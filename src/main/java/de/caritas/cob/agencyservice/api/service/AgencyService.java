package de.caritas.cob.agencyservice.api.service;


import static java.util.Objects.nonNull;
import static org.apache.commons.lang3.BooleanUtils.isTrue;

import de.caritas.cob.agencyservice.api.admin.service.agency.DemographicsConverter;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.BadRequestException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.model.DemographicsDTO;
import de.caritas.cob.agencyservice.api.model.FullAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

/**
 * Service for agencies.
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class AgencyService {

  @Qualifier("agencyTenantUnawareRepository")
  @Autowired
  AgencyRepository agencyTenantUnawareRepository;

  private final @NonNull ConsultingTypeManager consultingTypeManager;
  private final @NonNull AgencyRepository agencyRepository;

  private final @NonNull TenantService tenantService;
  private final @NonNull DemographicsConverter demographicsConverter;

  @Value("${feature.topics.enabled}")
  private boolean topicsFeatureEnabled;

  @Value("${feature.demographics.enabled}")
  private boolean demographicsFeatureEnabled;

  @Value("${multitenancy.enabled}")
  private boolean multitenancy;

  @Value("${feature.multitenancy.with.single.domain.enabled}")
  private boolean multitenancyWithSingleDomain;

  /**
   * Returns a list of {@link AgencyResponseDTO} which match the provided agencyIds.
   *
   * @param agencyIds the ids of requested agencies
   * @return a list containing regarding agencies
   */
  public List<AgencyResponseDTO> getAgencies(List<Long> agencyIds) {
    return getAgencyRepositoryForSearch().findByIdIn(agencyIds).stream()
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


  public List<FullAgencyResponseDTO> getAgencies(String postCode, int consultingTypeId,
      Optional<Integer> topicId) {
    return getAgencies(postCode, consultingTypeId, topicId, Optional.empty(), Optional.empty(), Optional.empty());
  }

  /**
   * Returns a randomly sorted list of {@link AgencyResponseDTO} which match to the provided
   * postCode. If no agency is found, returns the atm hard coded white spot agency id.
   *
   * @param postCode         the postcode for regarding agencies
   * @param consultingTypeId the consulting type used for filtering agencies
   * @return a list containing regarding agencies
   */
  public List<FullAgencyResponseDTO> getAgencies(String postCode, int consultingTypeId,
      Optional<Integer> topicId,
      Optional<Integer> age, Optional<String> gender, Optional<String> counsellingRelation) {

    var consultingTypeSettings = retrieveConsultingTypeSettings(
        consultingTypeId);

    if (doesPostCodeNotMatchMinSize(postCode, consultingTypeSettings)) {
      return Collections.emptyList();
    }

    var agencies = findAgencies(postCode, getConsultingTypeIdForSearch(consultingTypeId), topicId,
        age, gender, counsellingRelation);
    Collections.shuffle(agencies);
    var agencyResponseDTOs = agencies.stream()
        .map(this::convertToFullAgencyResponseDTO)
        .collect(Collectors.toList());

    if (agencyResponseDTOs.isEmpty()) {
      addWhiteSpotAgency(consultingTypeSettings, agencyResponseDTOs);
    }

    return agencyResponseDTOs;
  }

  private Optional<Integer> getConsultingTypeIdForSearch(int consultingTypeId) {
    return multitenancyWithSingleDomain ? Optional.empty() : Optional.of(consultingTypeId);
  }

  private List<Agency> findAgencies(String postCode, Optional<Integer> consultingTypeId,
      Optional<Integer> optionalTopicId, Optional<Integer> age,
      Optional<String> gender, Optional<String> counsellingRelation) {

    AgencySearch agencySearch = AgencySearch.builder()
        .postCode(postCode)
        .consultingTypeId(consultingTypeId)
        .topicId(optionalTopicId)
        .age(age)
        .gender(gender)
        .counsellingRelation(counsellingRelation)
        .build();

    if (demographicsFeatureEnabled) {
      assertAgeAndGenderAreProvided(age, gender);
    }

    if (isTopicFeatureEnabledAndActivatedInRegistration()) {
      assertTopicIdIsProvided(optionalTopicId);
      return findAgenciesWithTopic(agencySearch);
    } else {
      return findAgencies(agencySearch);
    }
  }

  private List<Agency> findAgencies(AgencySearch agencySearch) {
    try {
      return getAgencyRepositoryForSearch()
          .searchWithoutTopic(agencySearch.getPostCode(),
              agencySearch.getPostCode().length(), agencySearch.getConsultingTypeId().orElse(null),
              agencySearch.getAge().orElse(null),
              agencySearch.getGender().orElse(null),
              agencySearch.getCounsellingRelation().orElse(null),
              TenantContext.getCurrentTenant());
    } catch (DataAccessException ex) {
      throw new InternalServerErrorException(LogService::logDatabaseError,
          "Database error while getting postcodes");
    }
  }

  private void assertTopicIdIsProvided(Optional<Integer> topicId) {
    if (!topicId.isPresent()) {
      throw new BadRequestException("Topic id not provided in the search");
    }
  }

  private boolean isTopicFeatureEnabledAndActivatedInRegistration() {
    return topicsFeatureEnabled && isTopicFeatureActivatedInRegistration();
  }

  private boolean isTopicFeatureActivatedInRegistration() {
    RestrictedTenantDTO restrictedTenantDTO = getRestrictedTenantData();
    if (nonNull(restrictedTenantDTO) && nonNull(restrictedTenantDTO.getSettings())) {
      return Boolean.TRUE.equals(
          restrictedTenantDTO.getSettings().getTopicsInRegistrationEnabled());
    }
    return false;
  }

  private RestrictedTenantDTO getRestrictedTenantData() {
    if (multitenancy) {
      Long tenantId = TenantContext.getCurrentTenant();
      return tenantService.getRestrictedTenantDataByTenantId(tenantId);
    } else {
      return tenantService.getRestrictedTenantDataForSingleTenant();
    }
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

  private List<Agency> findAgenciesWithTopic(AgencySearch agencySearch) {
    try {
      return getAgencyRepositoryForSearch()
          .searchWithTopic(agencySearch.getPostCode(), agencySearch.getPostCode().length(),
              agencySearch.getConsultingTypeId().orElse(null),
              agencySearch.getTopicId().orElseThrow(),
              agencySearch.getAge().orElse(null), agencySearch.getGender().orElse(null),
              agencySearch.getCounsellingRelation().orElse(null),
              TenantContext.getCurrentTenant());

    } catch (DataAccessException ex) {
      throw new InternalServerErrorException(LogService::logDatabaseError,
          "Database error while getting postcodes");
    }
  }

  private AgencyRepository getAgencyRepositoryForSearch() {
    if (multitenancyWithSingleDomain) {
      return agencyTenantUnawareRepository;
    }
    return agencyRepository;
  }

  private void assertAgeAndGenderAreProvided(Optional<Integer> age, Optional<String> gender) {
    if (!age.isPresent()) {
      throw new BadRequestException("Age not provided in the search");
    }
    if (!gender.isPresent()) {
      throw new BadRequestException("Age not provided in the search");
    }
  }

  private void addWhiteSpotAgency(ExtendedConsultingTypeResponseDTO consultingTypeSettings,
      List<FullAgencyResponseDTO> agencyResponseDTOs) {

    var whiteSpot = consultingTypeSettings.getWhiteSpot();
    if (nonNull(whiteSpot) && nonNull(whiteSpot.getWhiteSpotAgencyId()) && isTrue(
        whiteSpot.getWhiteSpotAgencyAssigned())) {
      try {
        getAgencyRepositoryForSearch().findByIdAndDeleteDateNull(
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
        .tenantId(agency.getTenantId())
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
        .external(agency.isExternal())
        .demographics(getDemographics(agency))
        .tenantId(agency.getTenantId());
  }

  private DemographicsDTO getDemographics(Agency agency) {
    return agency.hasAnyDemographicsAttributes() ? demographicsConverter.convertToDTO(agency)
        : null;
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