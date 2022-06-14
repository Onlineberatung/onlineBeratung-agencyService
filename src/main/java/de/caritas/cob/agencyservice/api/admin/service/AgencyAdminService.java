package de.caritas.cob.agencyservice.api.admin.service;

import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_IS_ALREADY_DEFAULT_AGENCY;
import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_IS_ALREADY_TEAM_AGENCY;
import static de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO.AgencyTypeEnum.TEAM_AGENCY;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyAdminFullResponseDTOBuilder;
import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyTopicEnrichmentService;
import de.caritas.cob.agencyservice.api.admin.validation.DeleteAgencyValidator;
import de.caritas.cob.agencyservice.api.exception.httpresponses.ConflictException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agencytopic.AgencyTopic;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.List;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

  @Autowired(required = false)
  private AgencyTopicEnrichmentService agencyTopicEnrichmentService;

  @Value("${feature.topics.enabled}")
  private boolean featureTopicsEnabled;

  /**
   * Returns the {@link AgencyAdminFullResponseDTO} for the provided agency ID.
   *
   * @param agencyId the agency id
   * @return the created {@link AgencyAdminFullResponseDTO}
   */
  public AgencyAdminFullResponseDTO findAgency(Long agencyId) {
    var agency = findAgencyById(agencyId);
    if (featureTopicsEnabled) {
      agencyTopicEnrichmentService.enrichAgencyWithTopics(agency);
    }
    return new AgencyAdminFullResponseDTOBuilder(agency)
        .fromAgency();
  }

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
        .consultingTypeId(agencyDTO.getConsultingType())
        .url(agencyDTO.getUrl())
        .isExternal(agencyDTO.getExternal())
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
    var agency = agencyRepository.findById(agencyId).orElseThrow(NotFoundException::new);
    Agency updatedAgency = agencyRepository.save(mergeAgencies(agency, updateAgencyDTO));
    return new AgencyAdminFullResponseDTOBuilder(updatedAgency)
        .fromAgency();
  }

  private Agency mergeAgencies(Agency agency, UpdateAgencyDTO updateAgencyDTO) {

    var agencyToUpdate = Agency.builder()
        .id(agency.getId())
        .dioceseId(updateAgencyDTO.getDioceseId())
        .name(updateAgencyDTO.getName())
        .description(updateAgencyDTO.getDescription())
        .postCode(updateAgencyDTO.getPostcode())
        .city(updateAgencyDTO.getCity())
        .offline(updateAgencyDTO.getOffline())
        .teamAgency(agency.isTeamAgency())
        .url(updateAgencyDTO.getUrl())
        .isExternal(updateAgencyDTO.getExternal())
        .consultingTypeId(agency.getConsultingTypeId())
        .createDate(agency.getCreateDate())
        .updateDate(LocalDateTime.now(ZoneOffset.UTC))
        .deleteDate(agency.getDeleteDate()).build();

    if (featureTopicsEnabled) {
      agencyToUpdate.setAgencyTopics(toAgencyTopics(agencyToUpdate, updateAgencyDTO.getTopicIds()));
    }
    return agencyToUpdate;
  }

  private List<AgencyTopic> toAgencyTopics(Agency agency, List<Long> topicIds) {
    if (topicIds == null || topicIds.isEmpty()) {
      return Lists.newArrayList();
    } else {
      return topicIds.stream().map(id -> new AgencyTopic(agency, id)).collect(Collectors.toList());
    }
  }

  /**
   * Changes the type of the agency.
   *
   * @param agencyId      the agency id
   * @param agencyTypeDTO the request dto containing the agency type
   */
  public void changeAgencyType(Long agencyId, AgencyTypeRequestDTO agencyTypeDTO) {
    var agency = findAgencyById(agencyId);
    boolean isTeamAgency = TEAM_AGENCY.equals(agencyTypeDTO.getAgencyType());
    if (isTeamAgency == agency.isTeamAgency()) {
      throw new ConflictException(
          isTeamAgency ? AGENCY_IS_ALREADY_TEAM_AGENCY : AGENCY_IS_ALREADY_DEFAULT_AGENCY);
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
    var agency = this.findAgencyById(agencyId);
    this.deleteAgencyValidator.validate(agency);
    agency.setDeleteDate(LocalDateTime.now(ZoneOffset.UTC));
    this.agencyRepository.save(agency);
  }
}
