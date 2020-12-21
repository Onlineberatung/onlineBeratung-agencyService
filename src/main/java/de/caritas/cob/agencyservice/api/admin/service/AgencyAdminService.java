package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyAdminFullResponseDTOBuilder;
import de.caritas.cob.agencyservice.api.exception.httpresponses.BadRequestException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import de.caritas.cob.agencyservice.api.service.LogService;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataAccessException;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;

/**
 * Service class to handle agency admin requests.
 */
@Service
@RequiredArgsConstructor
public class AgencyAdminService {

  private final @NonNull AgencyRepository agencyRepository;

  /**
   * Returns the {@link Agency} for the provided agency ID.
   *
   * @param agencyId the agency ID
   * @return {@link Agency}
   */
  public Agency findAgencyById(Long agencyId) {
    try {
      return agencyRepository.findById(agencyId).orElseThrow(NotFoundException::new);
    } catch (DataAccessException exception) {
      throw new InternalServerErrorException(
          LogService::logDatabaseError,
          String.format("Database error while getting agency with id %s", agencyId));
    }
  }

  /**
   * Saves an agency to the database.
   *
   * @param agencyDTO (required)
   * @return an {@link AgencyAdminFullResponseDTO} instance
   */
  public AgencyAdminFullResponseDTO saveAgency(AgencyDTO agencyDTO) {
    Agency agency;
    try {
      agency = agencyRepository.save(fromAgencyDTO(agencyDTO));
    } catch (DataAccessException ex) {
      throw new InternalServerErrorException(
          LogService::logDatabaseError, "Database error while saving agency");
    }

    return new AgencyAdminFullResponseDTOBuilder(agency).fromAgency();
  }

  /**
   * Converts a {@link AgencyDTO} to an {@link Agency}. The attribute "offline" is always set to
   * true, because a newly created agency still has no assigned postcode ranges.
   *
   * @param agencyDTO (required)
   * @return an {@link Agency} instance
   */
  private Agency fromAgencyDTO(AgencyDTO agencyDTO) {

    return Agency.builder()
        .dioceseId(agencyDTO.getDioceseId())
        .name(agencyDTO.getName())
        .description(agencyDTO.getDescription())
        .postCode(agencyDTO.getPostcode())
        .city(agencyDTO.getCity())
        .offline(true)
        .teamAgency(agencyDTO.getTeamAgency())
        .consultingType(
            ConsultingType.valueOf(agencyDTO.getConsultingType())
                .orElseThrow(
                    () -> new BadRequestException(String
                        .format("Consulting type %s of agency dto does not exist",
                            agencyDTO.getConsultingType()))))
        .createDate(LocalDateTime.now(ZoneOffset.UTC))
        .updateDate(LocalDateTime.now(ZoneOffset.UTC))
        .build();
  }

  /**
   * Updates an agency in the database.
   *
   * @param agencyId        the id of the agency to update
   * @param updateAgencyDTO {@link UpdateAgencyDTO}
   * @return an {@link AgencyAdminFullResponseDTO} instance
   */
  public AgencyAdminFullResponseDTO updateAgency(Long agencyId, UpdateAgencyDTO updateAgencyDTO) {
    try {
      Agency agency = agencyRepository.findById(agencyId)
          .orElseThrow(NotFoundException::new);
      return new AgencyAdminFullResponseDTOBuilder(
          agencyRepository.save(mergeAgencies(agency, updateAgencyDTO))).fromAgency();
    } catch (DataAccessException ex) {
      throw new InternalServerErrorException(
          LogService::logDatabaseError,
          String.format("Database error while saving agency with id %s", agencyId.toString()));
    }
  }

  private Agency mergeAgencies(Agency agency, UpdateAgencyDTO updateAgencyDTO) {

    return Agency.builder()
        .id(agency.getId())
        .dioceseId(updateAgencyDTO.getDioceseId())
        .name(updateAgencyDTO.getName())
        .description(updateAgencyDTO.getDescription())
        .postCode(updateAgencyDTO.getPostcode())
        .city(updateAgencyDTO.getCity())
        .offline(updateAgencyDTO.getOffline())
        .teamAgency(agency.isTeamAgency())
        .consultingType(agency.getConsultingType())
        .createDate(agency.getCreateDate())
        .updateDate(LocalDateTime.now(ZoneOffset.UTC))
        .deleteDate(agency.getDeleteDate())
        .build();
  }

}
