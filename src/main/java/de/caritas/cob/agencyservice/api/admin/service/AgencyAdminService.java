package de.caritas.cob.agencyservice.api.admin.service;

import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_IS_ALREADY_DEFAULT_AGENCY;
import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_IS_ALREADY_TEAM_AGENCY;
import static de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO.AgencyTypeEnum.TEAM_AGENCY;
import static java.util.Objects.nonNull;

import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyAdminFullResponseDTOBuilder;
import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyTopicEnrichmentService;
import de.caritas.cob.agencyservice.api.admin.service.agency.DemographicsConverter;
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
import de.caritas.cob.agencyservice.api.service.AppointmentService;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.List;
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
  private final @NonNull AgencyTopicMergeService agencyTopicMergeService;
  private final @NonNull AppointmentService appointmentService;

  @Autowired(required = false)
  private AgencyTopicEnrichmentService agencyTopicEnrichmentService;

  @Autowired(required = false)
  private DemographicsConverter demographicsConverter;

  @Value("${feature.topics.enabled}")
  private boolean featureTopicsEnabled;

  @Value("${feature.demographics.enabled}")
  private boolean featureDemographicsEnabled;

  /**
   * Returns the {@link AgencyAdminFullResponseDTO} for the provided agency ID.
   *
   * @param agencyId the agency id
   * @return the created {@link AgencyAdminFullResponseDTO}
   */
  public AgencyAdminFullResponseDTO findAgency(Long agencyId) {
    var agency = findAgencyById(agencyId);
    enrichWithAgencyTopicsIfTopicFeatureEnabled(agency);
    return new AgencyAdminFullResponseDTOBuilder(agency)
        .fromAgency();
  }

  private void enrichWithAgencyTopicsIfTopicFeatureEnabled(Agency agency) {
    if (featureTopicsEnabled) {
      agencyTopicEnrichmentService.enrichAgencyWithTopics(agency);
    }
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
  public AgencyAdminFullResponseDTO createAgency(AgencyDTO agencyDTO) {
    var savedAgency = agencyRepository.save(fromAgencyDTO(agencyDTO));
    enrichWithAgencyTopicsIfTopicFeatureEnabled(savedAgency);
    this.appointmentService.syncAgencyDataToAppointmentService(savedAgency);
    return new AgencyAdminFullResponseDTOBuilder(savedAgency)
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

    var agencyBuilder = Agency.builder()
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
        .updateDate(LocalDateTime.now(ZoneOffset.UTC));

    if (featureDemographicsEnabled && agencyDTO.getDemographics() != null) {
      demographicsConverter.convertToEntity(agencyDTO.getDemographics(), agencyBuilder);
    }

    var agencyToCreate = agencyBuilder.build();

    if (featureTopicsEnabled) {
      List<AgencyTopic> agencyTopics = agencyTopicMergeService.getMergedTopics(agencyToCreate,
          agencyDTO.getTopicIds());
      agencyToCreate.setAgencyTopics(agencyTopics);
    }
    return agencyToCreate;
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
    var updatedAgency = agencyRepository.save(mergeAgencies(agency, updateAgencyDTO));
    enrichWithAgencyTopicsIfTopicFeatureEnabled(updatedAgency);
    this.appointmentService.syncAgencyDataToAppointmentService(updatedAgency);
    return new AgencyAdminFullResponseDTOBuilder(updatedAgency)
        .fromAgency();
  }

  private Agency mergeAgencies(Agency agency, UpdateAgencyDTO updateAgencyDTO) {

    var agencyBuilder = Agency.builder()
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
        .createDate(agency.getCreateDate())
        .updateDate(LocalDateTime.now(ZoneOffset.UTC))
        .deleteDate(agency.getDeleteDate());

    if (nonNull(updateAgencyDTO.getConsultingType())) {
      agencyBuilder.consultingTypeId(updateAgencyDTO.getConsultingType());
    } else {
      agencyBuilder.consultingTypeId(agency.getConsultingTypeId());
    }

    if (featureDemographicsEnabled && updateAgencyDTO.getDemographics() != null) {
      demographicsConverter.convertToEntity(updateAgencyDTO.getDemographics(), agencyBuilder);
    }

    var agencyToUpdate = agencyBuilder.build();

    if (featureTopicsEnabled) {
      List<AgencyTopic> agencyTopics = agencyTopicMergeService.getMergedTopics(agencyToUpdate,
          updateAgencyDTO.getTopicIds());
      agencyToUpdate.setAgencyTopics(agencyTopics);
    } else {
      // If the Topic feature is not enabled, Hibernate use an empty PersistentBag,
      // and we have to consider this and pass it for merging.
      agencyToUpdate.setAgencyTopics(agency.getAgencyTopics());
    }
    return agencyToUpdate;
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
    this.appointmentService.deleteAgency(agency);
  }
}
