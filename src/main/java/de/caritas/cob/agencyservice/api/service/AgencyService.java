package de.caritas.cob.agencyservice.api.service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import de.caritas.cob.agencyservice.api.exception.ServiceException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeSettings;
import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;

/**
 * Service for agencies
 */
@Service
public class AgencyService {

  private final ConsultingTypeManager consultingTypeManager;
  private final AgencyRepository agencyRepository;

  @Autowired
  public AgencyService(ConsultingTypeManager consultingTypeManager,
      AgencyRepository agencyRepository) {
    this.consultingTypeManager = consultingTypeManager;
    this.agencyRepository = agencyRepository;
  }

  /**
   * Returns a list of {@link AgencyResponseDTO} which match to the provided postCode. If no agency
   * is found, returns the atm hard coded white spot agency id
   *
   * @param postCode
   * @return
   */
  public List<AgencyResponseDTO> getAgencies(String postCode, ConsultingType consultingType) {

    ConsultingTypeSettings consultingTypeSettings =
        consultingTypeManager.getConsultantTypeSettings(consultingType);

    // Only return an agency when user entered minimum post code characters (from consulting type
    // settings) at registration
    if (postCode.length() < consultingTypeSettings.getRegistration().getMinPostcodeSize()) {
      return Collections.emptyList();
    }

    List<Agency> agencies = null;
    try {
      agencies = agencyRepository.findByPostCodeAndConsultingType(postCode, postCode.length(),
          consultingType);
    } catch (DataAccessException ex) {
      LogService.logDatabaseError(ex);
      throw new ServiceException("Database error while getting postcodes");
    }

    List<AgencyResponseDTO> agencyResponseDTOs = agencies.stream()
        .map(this::convertToAgencyResponseDTO).collect(Collectors.toList());

    // Return white spot agency if no agency is found
    if (consultingTypeSettings.getWhiteSpot().isWhiteSpotAgencyAssigned()
        && agencyResponseDTOs.isEmpty()) {
      Optional<Agency> agency;

      try {
        agency = agencyRepository.findByIdAndDeleteDateNull(
            consultingTypeSettings.getWhiteSpot().getWhiteSpotAgencyId());
      } catch (DataAccessException ex) {
        LogService.logDatabaseError(ex);
        throw new ServiceException("Database error while getting white spot agency");
      } catch (NumberFormatException nfEx) {
        LogService.logNumberFormatException(nfEx);
        throw new ServiceException("Invalid white spot agency id");
      }

      agency.ifPresent(value -> agencyResponseDTOs.add(convertToAgencyResponseDTO(value)));
    }

    return agencyResponseDTOs;
  }

  /**
   * Returns a list of {@link AgencyResponseDTO} which match the provided agencyIds
   *
   * @param agencyIds
   * @return
   */
  public List<AgencyResponseDTO> getAgencies(List<Long> agencyIds) {
    List<Agency> agencies;
    try {
      agencies = agencyRepository.findByIdIn(agencyIds);
    } catch (DataAccessException ex) {
      LogService.logDatabaseError(ex);
      throw new ServiceException("Database error while getting agencies");
    }
    return agencies.stream().map(this::convertToAgencyResponseDTO).collect(Collectors.toList());
  }

  /**
   * Converts an {@link Agency} repository to an {@link AgencyResponseDTO}
   *
   * @param agency
   * @return
   */
  private AgencyResponseDTO convertToAgencyResponseDTO(Agency agency) {
    return new AgencyResponseDTO(agency.getId(),
        agency.getName(),
        agency.getPostCode(),
        agency.getCity(),
        agency.getDescription(),
        agency.isTeamAgency(),
        agency.isOffline(),
        agency.getConsultingType().getValue());
  }
}
