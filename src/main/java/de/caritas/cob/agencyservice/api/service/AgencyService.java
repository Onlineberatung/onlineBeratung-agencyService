package de.caritas.cob.agencyservice.api.service;


import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
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
    try {
      return agencyRepository.findByIdIn(agencyIds).stream()
          .map(this::convertToAgencyResponseDTO)
          .collect(Collectors.toList());
    } catch (DataAccessException ex) {
      throw new InternalServerErrorException(LogService::logDatabaseError,
          "Database error while getting agencies");
    }
  }

  /**
   * Returns a randomly sorted list of {@link AgencyResponseDTO} which match to the provided
   * postCode. If no agency is found, returns the atm hard coded white spot agency id.
   *
   * @param postCode       the postcode for regarding agencies
   * @param consultingTypeId the consulting type used for filtering agencies
   * @return a list containing regarding agencies
   */
  public List<AgencyResponseDTO> getAgencies(String postCode, int consultingTypeId) {

    ExtendedConsultingTypeResponseDTO consultingTypeSettings = retrieveConsultingTypeSettings(
        consultingTypeId);

    if (doesPostCodeNotMatchMinSize(postCode, consultingTypeSettings)) {
      return Collections.emptyList();
    }

    List<Agency> agencies = collectAgenciesByPostCodeAndConsultingType(
        postCode, consultingTypeId);
    Collections.shuffle(agencies);
    List<AgencyResponseDTO> agencyResponseDTOs = agencies.stream()
        .map(this::convertToAgencyResponseDTO)
        .collect(Collectors.toList());

    if (agencyResponseDTOs.isEmpty()) {
      addWhiteSpotAgency(consultingTypeSettings, agencyResponseDTOs);
    }

    return agencyResponseDTOs;
  }

  private boolean doesPostCodeNotMatchMinSize(String postCode,
       ExtendedConsultingTypeResponseDTO consultingTypeSettings) {
    return postCode.length() < consultingTypeSettings.getRegistration().getMinPostcodeSize();
  }

  private ExtendedConsultingTypeResponseDTO retrieveConsultingTypeSettings(int consultingTypeId) {
      return consultingTypeManager.getConsultingTypeSettings(consultingTypeId);
  }

  private List<Agency> collectAgenciesByPostCodeAndConsultingType(String postCode,
      int consultingTypeId) {
    try {
      return agencyRepository.findByPostCodeAndConsultingTypeId(postCode, postCode.length(),
          consultingTypeId);
    } catch (DataAccessException ex) {
      throw new InternalServerErrorException(LogService::logDatabaseError,
          "Database error while getting postcodes");
    }
  }

  private void addWhiteSpotAgency(ExtendedConsultingTypeResponseDTO consultingTypeSettings,
      List<AgencyResponseDTO> agencyResponseDTOs) {
    if (consultingTypeSettings.getWhiteSpot().getWhiteSpotAgencyAssigned()) {
      try {
        agencyRepository.findByIdAndDeleteDateNull(
            Long.valueOf(consultingTypeSettings.getWhiteSpot().getWhiteSpotAgencyId()))
            .ifPresent(agency -> agencyResponseDTOs.add(convertToAgencyResponseDTO(agency)));
      } catch (DataAccessException ex) {
        throw new InternalServerErrorException(LogService::logDatabaseError,
            "Database error while getting white spot agency");
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

  /**
   * Sets the {@link Agency} with given id to offline.
   *
   * @param agencyId the id for the agency to set offline
   */
  public void setAgencyOffline(Long agencyId) {
    Agency agency = this.agencyRepository.findById(agencyId)
        .orElseThrow(NotFoundException::new);
    agency.setOffline(true);
    agency.setUpdateDate(LocalDateTime.now(ZoneOffset.UTC));
    this.agencyRepository.save(agency);
  }

}
