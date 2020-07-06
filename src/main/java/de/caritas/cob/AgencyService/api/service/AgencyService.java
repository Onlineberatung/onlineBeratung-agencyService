package de.caritas.cob.AgencyService.api.service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import de.caritas.cob.AgencyService.api.exception.ServiceException;
import de.caritas.cob.AgencyService.api.manager.consultingType.ConsultingTypeManager;
import de.caritas.cob.AgencyService.api.manager.consultingType.ConsultingTypeSettings;
import de.caritas.cob.AgencyService.api.model.AgencyResponseDTO;
import de.caritas.cob.AgencyService.api.repository.agency.Agency;
import de.caritas.cob.AgencyService.api.repository.agency.AgencyRepository;
import de.caritas.cob.AgencyService.api.repository.agency.ConsultingType;

/**
 * Service for agencies
 */
@Service
public class AgencyService {

  private final ConsultingTypeManager consultingTypeManager;
  private final AgencyRepository agencyRepository;
  private final LogService logService;

  @Autowired
  public AgencyService(ConsultingTypeManager consultingTypeManager,
      AgencyRepository agencyRepository, LogService logService) {
    this.consultingTypeManager = consultingTypeManager;
    this.agencyRepository = agencyRepository;
    this.logService = logService;
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
      logService.logDatabaseError(ex);
      throw new ServiceException("Database error while getting postcodes");
    }

    List<AgencyResponseDTO> agencyResponseDTOs = agencies.stream()
        .map(agency -> convertToAgencyResponseDTO(agency)).collect(Collectors.toList());

    // Return white spot agency if no agency is found
    if (consultingTypeSettings.getWhiteSpot().isWhiteSpotAgencyAssigned()
        && agencyResponseDTOs.size() < 1) {
      Optional<Agency> agency;

      try {
        agency = agencyRepository.findByIdAndDeleteDateNull(
            consultingTypeSettings.getWhiteSpot().getWhiteSpotAgencyId());
      } catch (DataAccessException ex) {
        logService.logDatabaseError(ex);
        throw new ServiceException("Database error while getting white spot agency");
      } catch (NumberFormatException nfEx) {
        logService.logNumberFormatException(nfEx);
        throw new ServiceException("Invalid white spot agency id");
      }

      if (agency.isPresent()) {
        agencyResponseDTOs.add(convertToAgencyResponseDTO(agency.get()));
      }
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
      logService.logDatabaseError(ex);
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
    return new AgencyResponseDTO(agency.getId() != null ? agency.getId() : null,
        (agency.getName() != null) ? agency.getName() : null,
        (agency.getPostCode() != null) ? agency.getPostCode() : null,
        (agency.getCity() != null) ? agency.getCity() : null,
        (agency.getDescription() != null) ? agency.getDescription() : null, agency.isTeamAgency(),
        agency.isOffline(), agency.getConsultingType().getValue());
  }
}
