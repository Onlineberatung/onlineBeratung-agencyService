package de.caritas.cob.agencyservice.api.service;


import static java.util.Objects.nonNull;
import static org.apache.commons.lang3.BooleanUtils.isTrue;

import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.BadRequestException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.model.FullAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

/**
 * Service for agencies.
 */
@Service
@RequiredArgsConstructor
public class AgencyService {

  private final @NonNull ConsultingTypeManager consultingTypeManager;
  private final @NonNull AgencyRepository agencyRepository;

  /**
   * Returns a list of {@link AgencyResponseDTO} which match the provided agencyIds.
   *
   * @param agencyIds the ids of requested agencies
   * @return a list containing regarding agencies
   */
  public List<AgencyResponseDTO> getAgencies(List<Long> agencyIds) {
    return agencyRepository.findByIdIn(agencyIds).stream()
        .map(this::convertToAgencyResponseDTO)
        .collect(Collectors.toList());
  }

  /**
   * Returns a list of {@link AgencyResponseDTO} which match the provided consulting type.
   *
   * @param consultingTypeId the id of the request
   * @return a list containing regarding agencies
   */
  public List<AgencyResponseDTO> getAgencies(int consultingTypeId) {
    try {
      verifyConsultingTypeExists(consultingTypeId);

      return agencyRepository.findByConsultingTypeId(consultingTypeId).stream()
          .map(this::convertToAgencyResponseDTO)
          .collect(Collectors.toList());

    } catch (MissingConsultingTypeException ex) {
      throw new BadRequestException(
          String.format("Consulting type with id %s does not exist", consultingTypeId));
    }
  }

  /**
   * Returns a randomly sorted list of {@link AgencyResponseDTO} which match to the provided
   * postCode. If no agency is found, returns the atm hard coded white spot agency id.
   *
   * @param postCode         the postcode for regarding agencies
   * @param consultingTypeId the consulting type used for filtering agencies
   * @return a list containing regarding agencies
   */
  public List<FullAgencyResponseDTO> getAgencies(String postCode, int consultingTypeId) {

    var consultingTypeSettings = retrieveConsultingTypeSettings(
        consultingTypeId);

    if (doesPostCodeNotMatchMinSize(postCode, consultingTypeSettings)) {
      return Collections.emptyList();
    }

    var agencies = collectAgenciesByPostCodeAndConsultingType(
        postCode, consultingTypeId);
    Collections.shuffle(agencies);
    var agencyResponseDTOs = agencies.stream()
        .map(this::convertToFullAgencyResponseDTO)
        .collect(Collectors.toList());

    if (agencyResponseDTOs.isEmpty()) {
      addWhiteSpotAgency(consultingTypeSettings, agencyResponseDTOs);
    }

    return agencyResponseDTOs;
  }

  private void verifyConsultingTypeExists(int consultingTypeId)
      throws MissingConsultingTypeException {
    consultingTypeManager.getConsultingTypeSettings(consultingTypeId);
  }

  private boolean doesPostCodeNotMatchMinSize(String postCode,
      ExtendedConsultingTypeResponseDTO consultingTypeSettings) {
    var registration = consultingTypeSettings.getRegistration();
    return nonNull(registration) && nonNull(registration.getMinPostcodeSize())
        && postCode.length() < registration.getMinPostcodeSize();
  }

  public ExtendedConsultingTypeResponseDTO retrieveConsultingTypeSettings(int consultingTypeId) {
    try {
      return consultingTypeManager.getConsultingTypeSettings(consultingTypeId);
    } catch (MissingConsultingTypeException e) {
      throw new InternalServerErrorException(LogService::logInternalServerError, e.getMessage());
    }
  }

  private List<Agency> collectAgenciesByPostCodeAndConsultingType(String postCode,
      int consultingTypeId) {
    try {
      return agencyRepository
          .findByPostCodeAndConsultingTypeId(postCode, postCode.length(), consultingTypeId,
              TenantContext.getCurrentTenant());


    } catch (DataAccessException ex) {
      throw new InternalServerErrorException(LogService::logDatabaseError,
          "Database error while getting postcodes");
    }
  }

  private void addWhiteSpotAgency(ExtendedConsultingTypeResponseDTO consultingTypeSettings,
      List<FullAgencyResponseDTO> agencyResponseDTOs) {
    var whiteSpot = consultingTypeSettings.getWhiteSpot();
    if (nonNull(whiteSpot) && nonNull(whiteSpot.getWhiteSpotAgencyId()) && isTrue(
        whiteSpot.getWhiteSpotAgencyAssigned())) {
      try {
        agencyRepository.findByIdAndDeleteDateNull(
            Long.valueOf(whiteSpot.getWhiteSpotAgencyId()))
            .ifPresent(agency -> agencyResponseDTOs.add(convertToFullAgencyResponseDTO(agency)));
      } catch (NumberFormatException nfEx) {
        throw new InternalServerErrorException(LogService::logNumberFormatException,
            "Invalid white spot agency id");
      }
    }
  }

  private AgencyResponseDTO convertToAgencyResponseDTO(Agency agency) {
    return new AgencyResponseDTO()
        .id(agency.getId())
        .name(agency.getName())
        .postcode(agency.getPostCode())
        .city(agency.getCity())
        .description(agency.getDescription())
        .teamAgency(agency.isTeamAgency())
        .offline(agency.isOffline())
        .consultingType(agency.getConsultingTypeId());
  }

  private FullAgencyResponseDTO convertToFullAgencyResponseDTO(Agency agency) {
    return new FullAgencyResponseDTO()
        .id(agency.getId())
        .name(agency.getName())
        .postcode(agency.getPostCode())
        .city(agency.getCity())
        .description(agency.getDescription())
        .teamAgency(agency.isTeamAgency())
        .offline(agency.isOffline())
        .consultingType(agency.getConsultingTypeId())
        .url(agency.getUrl())
        .external(agency.isExternal());

  }

  /**
   * Sets the {@link Agency} with given id to offline.
   *
   * @param agencyId the id for the agency to set offline
   */
  public void setAgencyOffline(Long agencyId) {
    var agency = this.agencyRepository.findById(agencyId)
        .orElseThrow(NotFoundException::new);
    agency.setOffline(true);
    agency.setUpdateDate(LocalDateTime.now(ZoneOffset.UTC));
    this.agencyRepository.save(agency);
  }

}
