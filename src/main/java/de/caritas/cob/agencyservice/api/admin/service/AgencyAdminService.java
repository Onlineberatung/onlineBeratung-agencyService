package de.caritas.cob.agencyservice.api.admin.service;

import static de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO.AgencyTypeEnum.TEAM_AGENCY;

import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyAdminFullResponseDTOBuilder;
import de.caritas.cob.agencyservice.api.admin.validation.DeleteAgencyValidator;
import de.caritas.cob.agencyservice.api.exception.httpresponses.BadRequestException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.ConflictException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Service class to handle agency admin requests.
 */
@Service
@RequiredArgsConstructor
public class AgencyAdminService {

  private final @NonNull AgencyRepository agencyRepository;
  private final @NonNull UserAdminService userAdminService;
  private final @NonNull DeleteAgencyValidator deleteAgencyValidator;

  /**
   * Returns the {@link Agency} for the provided agency ID.
   *
   * @param agencyId the agency ID
   * @return {@link Agency}
   */
  public Agency findAgencyById(Long agencyId) {
    return agencyRepository.findById(agencyId).orElseThrow(NotFoundException::new);
  }

  /**
   * Saves an agency to the database.
   *
   * @param agencyDTO (required)
   * @return an {@link AgencyAdminFullResponseDTO} instance
   */
  public AgencyAdminFullResponseDTO saveAgency(AgencyDTO agencyDTO) {
    return new AgencyAdminFullResponseDTOBuilder(agencyRepository.save(fromAgencyDTO(agencyDTO)))
        .fromAgency();
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
                    () ->
                        new BadRequestException(
                            String.format(
                                "Consulting type %s of agency dto does not exist",
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
    Agency agency = agencyRepository.findById(agencyId).orElseThrow(NotFoundException::new);
    return new AgencyAdminFullResponseDTOBuilder(
        agencyRepository.save(mergeAgencies(agency, updateAgencyDTO)))
        .fromAgency();
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

  /**
   * Changes the type of the agency.
   *
   * @param agencyId      the agency id
   * @param agencyTypeDTO the request dto containing the agency type
   */
  public void changeAgencyType(Long agencyId, AgencyTypeRequestDTO agencyTypeDTO) {
    Agency agency = findAgencyById(agencyId);
    boolean isTeamAgency = TEAM_AGENCY.equals(agencyTypeDTO.getAgencyType());
    if (isTeamAgency == agency.isTeamAgency()) {
      throw new ConflictException(String.format("Agency is already type of team agency=%s",
          isTeamAgency));
    }
    this.userAdminService
        .adaptRelatedConsultantsForChange(agencyId, agencyTypeDTO.getAgencyType().getValue());
    agency.setTeamAgency(isTeamAgency);
    this.agencyRepository.save(agency);
  }

  /**
   * Deletes the provided agency.
   *
   * @param agencyId agency ID
   */
  public void deleteAgency(Long agencyId) {
    Agency agency = this.findAgencyById(agencyId);
    this.deleteAgencyValidator.validate(agency);
    agency.setDeleteDate(LocalDateTime.now(ZoneOffset.UTC));
    this.agencyRepository.save(agency);
  }
}
