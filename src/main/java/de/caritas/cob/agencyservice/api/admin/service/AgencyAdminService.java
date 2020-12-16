package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.api.admin.hallink.CreateAgencyLinkBuilder;
import de.caritas.cob.agencyservice.api.admin.hallink.UpdateAgencyLinkBuilder;
import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyAdminResponseDTOBuilder;
import de.caritas.cob.agencyservice.api.exception.httpresponses.BadRequestException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.CreateAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.model.CreateLinks;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.model.UpdateLinks;
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
   * Saves an agency to the database.
   *
   * @param agencyDTO (required)
   * @return an {@link AgencyAdminResponseDTO} instance
   */
  public CreateAgencyResponseDTO saveAgency(AgencyDTO agencyDTO) {
    Agency agency;
    try {
      agency = agencyRepository.save(fromAgencyDTO(agencyDTO));
    } catch (DataAccessException ex) {
      throw new InternalServerErrorException(
          LogService::logDatabaseError, "Database error while saving agency");
    }

    CreateLinks createLinks =
        CreateAgencyLinkBuilder.getInstance(agency).buildCreateAgencyLinks();

    return new CreateAgencyResponseDTO()
        .embedded(new AgencyAdminResponseDTOBuilder(agency).fromAgency())
        .links(createLinks);
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
                    () -> new BadRequestException("Consulting type of agency dto does not exist")))
        .createDate(LocalDateTime.now(ZoneOffset.UTC))
        .updateDate(LocalDateTime.now(ZoneOffset.UTC))
        .build();
  }

  /**
   * Updates an agency in the database.
   *
   * @param updateAgencyDTO (required)
   * @return an {@link UpdateAgencyResponseDTO} instance
   */
  public UpdateAgencyResponseDTO updateAgency(Long agencyId, UpdateAgencyDTO updateAgencyDTO) {
    Agency updatedAgency;
    try {
      Agency agency = agencyRepository.findById(agencyId)
          .orElseThrow(NotFoundException::new);
      updatedAgency = agencyRepository.save(mergeAgencies(agency, updateAgencyDTO));
    } catch (DataAccessException ex) {
      throw new InternalServerErrorException(
          LogService::logDatabaseError, "Database error while saving agency");
    }

    UpdateLinks updateLinks =
        UpdateAgencyLinkBuilder.getInstance(updatedAgency).buildUpdateAgencyLinks();

    return new UpdateAgencyResponseDTO()
        .embedded(new AgencyAdminResponseDTOBuilder(updatedAgency).fromAgency())
        .links(updateLinks);

  }

  /**
   * Converts a {@link UpdateAgencyDTO} to an {@link Agency}.
   *
   * @param updateAgencyDTO (required)
   * @return an {@link Agency} instance
   */
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
