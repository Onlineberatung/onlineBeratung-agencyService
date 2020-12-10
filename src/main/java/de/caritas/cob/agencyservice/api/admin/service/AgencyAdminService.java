package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.api.admin.hallink.CreateAgencyLinkBuilder;
import de.caritas.cob.agencyservice.api.exception.httpresponses.BadRequestException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.CreateAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.model.CreateLinks;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import de.caritas.cob.agencyservice.api.service.LogService;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataAccessException;
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
                .orElseThrow(() -> new BadRequestException("Consulting type of agency dto does not exist")))
        .createDate(LocalDateTime.now(ZoneOffset.UTC))
        .updateDate(LocalDateTime.now(ZoneOffset.UTC))
        .build();
  }
}
