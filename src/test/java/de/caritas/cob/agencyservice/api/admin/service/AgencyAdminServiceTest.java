package de.caritas.cob.agencyservice.api.admin.service;

import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_IS_ALREADY_DEFAULT_AGENCY;
import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_IS_ALREADY_TEAM_AGENCY;
import static de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO.AgencyTypeEnum.DEFAULT_AGENCY;
import static de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO.AgencyTypeEnum.TEAM_AGENCY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.fail;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyTopicEnrichmentService;
import de.caritas.cob.agencyservice.api.admin.service.agency.DemographicsConverter;
import de.caritas.cob.agencyservice.api.admin.validation.DeleteAgencyValidator;
import de.caritas.cob.agencyservice.api.exception.httpresponses.ConflictException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO;
import de.caritas.cob.agencyservice.api.model.DemographicsDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.service.AppointmentService;
import de.caritas.cob.agencyservice.api.service.LogService;
import java.util.List;
import java.util.Optional;
import org.jeasy.random.EasyRandom;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.slf4j.Logger;
import org.springframework.test.util.ReflectionTestUtils;

@ExtendWith(MockitoExtension.class)
class AgencyAdminServiceTest {

  @InjectMocks
  AgencyAdminService agencyAdminService;

  @Mock
  AgencyRepository agencyRepository;

  @Mock
  UserAdminService userAdminService;

  @Mock
  DeleteAgencyValidator deleteAgencyValidator;

  @Mock
  AgencyTopicMergeService mergeService;

  @Mock
  AgencyTopicEnrichmentService agencyTopicEnrichmentService;

  @Mock
  DemographicsConverter demographicsConverter;

  @Mock
  AppointmentService appointmentService;

  @Mock
  private Logger logger;

  @Captor private ArgumentCaptor<Agency> agencyArgumentCaptor;

  private EasyRandom easyRandom;

  @BeforeEach
  public void setup() {
    ReflectionTestUtils.setField(agencyAdminService, "agencyTopicEnrichmentService", agencyTopicEnrichmentService);
    ReflectionTestUtils.setField(agencyAdminService, "demographicsConverter", demographicsConverter);

    this.easyRandom = new EasyRandom();
  }

  @Test
  void updateAgency_Should_ThrowNotFoundException_WhenAgencyIsNotFound() {
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.empty());

    var updateAgencyDTO = this.easyRandom.nextObject(UpdateAgencyDTO.class);

    assertThrows(NotFoundException.class,
        () -> agencyAdminService.updateAgency(AGENCY_ID, updateAgencyDTO));
  }

  @Test
  void createAgency_Should_CreateAgencyAndAddDefaultCounsellingRelations() {
    var agency = this.easyRandom.nextObject(Agency.class);
    agency.setCounsellingRelations(null);
    var agencyDTO = this.easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setCounsellingRelations(null);
    agencyDTO.setConsultingType(1);

    when(agencyRepository.save(any())).thenReturn(agency);
    agencyAdminService.createAgency(agencyDTO);
    verify(agencyRepository).save(agencyArgumentCaptor.capture());
    assertThat(agencyArgumentCaptor.getValue().getCounsellingRelations(), is("RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING"));
  }

  @Test
  void updateAgency_Should_SaveAgencyMandatoryChanges_WhenAgencyIsFound() {
    var agency = this.easyRandom.nextObject(Agency.class);
    agency.setCounsellingRelations(null);
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.of(agency));
    when(agencyRepository.save(any())).thenReturn(agency);

    var updateAgencyDTO = this.easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setConsultingType(null);
    agencyAdminService.updateAgency(AGENCY_ID, updateAgencyDTO);

    verify(agencyRepository).save(agencyArgumentCaptor.capture());
    var passedConsultingTypeId = agencyArgumentCaptor.getValue().getConsultingTypeId();
    assertEquals(agency.getConsultingTypeId(), passedConsultingTypeId);
  }

  @Test
  void updateAgency_Should_SaveOptionalAgencyChanges_WhenAgencyIsFound() {
    var agency = easyRandom.nextObject(Agency.class);
    agency.setCounsellingRelations(AgencyAdminResponseDTO.CounsellingRelationsEnum.PARENTAL_COUNSELLING.getValue());

    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.of(agency));
    when(agencyRepository.save(any())).thenReturn(agency);

    var updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setCounsellingRelations(Lists.newArrayList(UpdateAgencyDTO.CounsellingRelationsEnum.PARENTAL_COUNSELLING));

    agencyAdminService.updateAgency(AGENCY_ID, updateAgencyDTO);

    verify(agencyRepository).save(agencyArgumentCaptor.capture());
    var passedConsultingTypeId = agencyArgumentCaptor.getValue().getConsultingTypeId();
    assertEquals(updateAgencyDTO.getConsultingType(), passedConsultingTypeId);
    assertEquals("PARENTAL_COUNSELLING", agencyArgumentCaptor.getValue().getCounsellingRelations());
  }

  @Test
  void updateAgency_Should_SaveAgencyChanges_WhenAgencyIsFoundAndTopicFeatureEnabled() {
    // given
    ReflectionTestUtils.setField(agencyAdminService, "featureTopicsEnabled", true);
    var agency = this.easyRandom.nextObject(Agency.class);
    agency.setCounsellingRelations(null);
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.of(agency));
    when(agencyRepository.save(any())).thenReturn(agency);
    var updateAgencyDTO = this.easyRandom.nextObject(UpdateAgencyDTO.class);

    // when
    agencyAdminService.updateAgency(AGENCY_ID, updateAgencyDTO);

    // then
    verify(this.agencyRepository).save(any());
    verify(this.mergeService).getMergedTopics(Mockito.any(Agency.class), any(List.class));
    verify(this.agencyTopicEnrichmentService).enrichAgencyWithTopics(agency);
    ReflectionTestUtils.setField(agencyAdminService, "featureTopicsEnabled", false);
  }

  @Test
  void updateAgency_Should_SaveAgencyChanges_WhenAgencyIsFoundAndDemographicsFeatureIsEnabled() {
    // given
    ReflectionTestUtils.setField(agencyAdminService, "featureDemographicsEnabled", true);
    var agency = this.easyRandom.nextObject(Agency.class);
    agency.setCounsellingRelations(AgencyAdminResponseDTO.CounsellingRelationsEnum.PARENTAL_COUNSELLING.getValue());
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.of(agency));
    when(agencyRepository.save(any())).thenReturn(agency);
    var updateAgencyDTO = this.easyRandom.nextObject(UpdateAgencyDTO.class);

    // when
    agencyAdminService.updateAgency(AGENCY_ID, updateAgencyDTO);

    // then
    verify(this.agencyRepository).save(any());
    verify(this.demographicsConverter).convertToEntity(Mockito.any(DemographicsDTO.class), Mockito.any(Agency.AgencyBuilder.class));
    ReflectionTestUtils.setField(agencyAdminService, "featureDemographicsEnabled", false);
  }

  @Test
  void findAgencyById_Should_ThrowNotFoundException_WhenAgencyIsNotFound() {
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.empty());

    assertThrows(NotFoundException.class, () -> agencyAdminService.findAgencyById(AGENCY_ID));
  }

  @Test
  void changeAgencyType_Should_throwNotFoundException_When_agencyWasNotFound() {
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.empty());

    assertThrows(NotFoundException.class,
        () -> agencyAdminService.changeAgencyType(AGENCY_ID, mock(AgencyTypeRequestDTO.class)));
  }

  @Test
  void changeAgencyType_Should_throwConflictExceptionWithCorrectReason_When_agencyHasAlreadyTypeTeamAgency() {
    var agency = this.easyRandom.nextObject(Agency.class);
    agency.setTeamAgency(true);
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.of(agency));
    var requestDTO = new AgencyTypeRequestDTO().agencyType(TEAM_AGENCY);

    try {
      agencyAdminService.changeAgencyType(AGENCY_ID, requestDTO);
      fail("ConflictException not thrown");
    } catch (ConflictException exception) {
      assertThat(AGENCY_IS_ALREADY_TEAM_AGENCY, is(exception.getHttpStatusExceptionReason()));
    }
  }

  @Test
  void changeAgencyType_Should_throwConflictExceptionWithCorrectReason_When_agencyHasAlreadyTypeDefault() {
    var agency = this.easyRandom.nextObject(Agency.class);
    agency.setTeamAgency(false);
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.of(agency));
    var requestDTO = new AgencyTypeRequestDTO().agencyType(DEFAULT_AGENCY);

    try {
      agencyAdminService.changeAgencyType(AGENCY_ID, requestDTO);
      fail("ConflictException not thrown");
    } catch (ConflictException exception) {
      assertThat(AGENCY_IS_ALREADY_DEFAULT_AGENCY, is(exception.getHttpStatusExceptionReason()));
    }
  }

  @Test
  void changeAgencyType_Should_callUserAdminServiceAndSaveChangedAgency_When_agencyCanBeChanged() {
    var agency = this.easyRandom.nextObject(Agency.class);
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.of(agency));
    var requestDTO = new AgencyTypeRequestDTO().agencyType(DEFAULT_AGENCY);

    agencyAdminService.changeAgencyType(AGENCY_ID, requestDTO);

    verify(this.userAdminService).adaptRelatedConsultantsForChange(AGENCY_ID,
        requestDTO.getAgencyType().getValue());
    verify(this.agencyRepository).save(any());
  }

  @Test
  void deleteAgency_Should_ThrowNotFoundException_WhenAgencyIsNotFound() {
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.empty());

    assertThrows(NotFoundException.class, () -> agencyAdminService.deleteAgency(AGENCY_ID));
  }

  @Test
  void deleteAgency_Should_callDeleteAgencyValidatorAndSaveChangedAgency_When_AgencyIsFound() {
    var agency = this.easyRandom.nextObject(Agency.class);
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.of(agency));

    agencyAdminService.deleteAgency(AGENCY_ID);

    verify(this.deleteAgencyValidator).validate(agency);
    verify(this.agencyRepository).save(any());
  }

}
