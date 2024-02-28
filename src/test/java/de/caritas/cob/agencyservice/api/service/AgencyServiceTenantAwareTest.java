package de.caritas.cob.agencyservice.api.service;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.admin.service.agency.DemographicsConverter;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.BadRequestException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.RegistrationDTO;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.BasicConsultingTypeResponseDTORegistration;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.Settings;
import java.util.Optional;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.util.ReflectionTestUtils;

@RunWith(MockitoJUnitRunner.class)
public class AgencyServiceTenantAwareTest {

  @InjectMocks
  private AgencyService agencyService;

  @Mock
  ConsultingTypeManager consultingTypeManager;

  @Mock
  DemographicsConverter demographicsConverter;

  @Mock
  TenantService tenantService;

  @Mock
  private AgencyRepository agencyRepository;

  @Mock
  private CentralDataProtectionTemplateService centralDataProtectionTemplateService;

  @Mock
  private ApplicationSettingsService applicationSettingsService;

  private static final Long TENANT_ID = 1L;

  @Before
  public void before() {
    ReflectionTestUtils.setField(agencyService, "multitenancy", true);
    TenantContext.setCurrentTenant(TENANT_ID);
  }

  @After
  public void tearDown() {
    ReflectionTestUtils.setField(agencyService, "topicsFeatureEnabled", false);
    ReflectionTestUtils.setField(agencyService, "multitenancy", false);
    TenantContext.clear();
  }

  @Test(expected = BadRequestException.class)
  public void getAgencies_Should_throwBadRequestException_When_topicIdNotProvidedAndFeatureEnabled()
      throws MissingConsultingTypeException {
    // given
    ReflectionTestUtils.setField(agencyService, "topicsFeatureEnabled", true);
    ExtendedConsultingTypeResponseDTO dto = new ExtendedConsultingTypeResponseDTO().registration(
        new BasicConsultingTypeResponseDTORegistration().minPostcodeSize(5));
    when(consultingTypeManager.getConsultingTypeSettings(1)).thenReturn(dto);
    RestrictedTenantDTO restrictedTenantDTO = new RestrictedTenantDTO().settings(
        new Settings().topicsInRegistrationEnabled(true));
    when(tenantService.getRestrictedTenantDataByTenantId(TENANT_ID)).thenReturn(
        restrictedTenantDTO);

    // when
    this.agencyService.getAgencies(Optional.of("12123"), 1, Optional.empty());

    // then
    verify(agencyRepository).searchWithTopic("12123", 5, 1, 2, null,
        null, null,
        TENANT_ID);
  }

  @Test
  public void getAgencies_Should_searchByTopicId_When_topicIdProvidedAndFeatureEnabled()
      throws MissingConsultingTypeException {
    // given
    ReflectionTestUtils.setField(agencyService, "topicsFeatureEnabled", true);
    ExtendedConsultingTypeResponseDTO dto = new ExtendedConsultingTypeResponseDTO().registration(
        new BasicConsultingTypeResponseDTORegistration().minPostcodeSize(5));
    when(consultingTypeManager.getConsultingTypeSettings(1)).thenReturn(dto);
    RestrictedTenantDTO restrictedTenantDTO = new RestrictedTenantDTO().settings(
        new Settings().topicsInRegistrationEnabled(true));
    when(tenantService.getRestrictedTenantDataByTenantId(TENANT_ID)).thenReturn(
        restrictedTenantDTO);

    // when
    this.agencyService.getAgencies(Optional.of("12123"), 1, Optional.of(2), Optional.empty(), Optional.empty(), Optional.empty());

    // then
    verify(agencyRepository).searchWithTopic("12123", 5, 1, 2, null,
        null, null,
        TENANT_ID);
  }
}
