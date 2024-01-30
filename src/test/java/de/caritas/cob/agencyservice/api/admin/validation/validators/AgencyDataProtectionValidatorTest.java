package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO.DataProtectionResponsibleEntityEnum;
import de.caritas.cob.agencyservice.api.service.ApplicationSettingsService;
import de.caritas.cob.agencyservice.api.service.TenantService;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTO;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTOMainTenantSubdomainForSingleDomainMultitenancy;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.Settings;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

@ExtendWith(MockitoExtension.class)
class AgencyDataProtectionValidatorTest {

  @InjectMocks
  AgencyDataProtectionValidator agencyDataProtectionValidator;

  private @Mock AgencyDataProtectionValidationService agencyDataProtectionValidationService;

  private @Mock TenantService tenantService;

  private @Mock ApplicationSettingsService applicationSettingsService;

  @Test
  void validate_Should_ValidateForAgencyTenant_When_NonSingleDomainMultitenancy_And_CentralDataProtectionFeatureEnabled() {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER)).build();
    ReflectionTestUtils.setField(agencyDataProtectionValidator, "multitenancyWithSingleDomain",
        false);
    givenAgencyTenant(agencyToValidate, true);
    // when
    agencyDataProtectionValidator.validate(agencyToValidate);
    // then
    Mockito.verify(agencyDataProtectionValidationService, Mockito.times(1))
        .validate(agencyToValidate);
  }

  @Test
  void validate_Should_NotValidateForAgencyTenant_When_NonSingleDomainMultitenancy_And_CentralDataProtectionFeatureDisabled() {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER)).build();
    ReflectionTestUtils.setField(agencyDataProtectionValidator, "multitenancyWithSingleDomain",
        false);
    givenAgencyTenant(agencyToValidate, false);
    // when
    agencyDataProtectionValidator.validate(agencyToValidate);
    // then
    Mockito.verify(agencyDataProtectionValidationService, Mockito.never())
        .validate(agencyToValidate);
  }

  @ParameterizedTest
  @CsvSource({
      "true,true,2",
      "true,false,1",
      "false,true,1",
      "false,false,0",
  })
  void validate_Should_ValidateForAgencyTenantAndMainTenant_When_SingleDomainMultitenancy(boolean isAgencyTenantCentralDataProtectionEnabled, boolean isMainTenantCentralDataProtectionEnabled, int expectedValidationCalls) {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER)).build();
    ReflectionTestUtils.setField(agencyDataProtectionValidator, "multitenancyWithSingleDomain",
        true);
    givenAgencyTenant(agencyToValidate, isAgencyTenantCentralDataProtectionEnabled);
    givenSingleDomainWithValue("app");
    givenMainTenant("app", isMainTenantCentralDataProtectionEnabled);
    // when
    agencyDataProtectionValidator.validate(agencyToValidate);
    // then

    Mockito.verify(agencyDataProtectionValidationService, Mockito.times(expectedValidationCalls))
        .validate(agencyToValidate);
  }



  private void givenAgencyTenant(ValidateAgencyDTO agency, boolean isCentralDataProtectionEnabled) {
    Mockito.when(tenantService.getRestrictedTenantDataByTenantId(agency.getTenantId()))
        .thenReturn(new RestrictedTenantDTO().settings(new Settings().featureCentralDataProtectionTemplateEnabled(isCentralDataProtectionEnabled)));
  }

  private void givenMainTenant(String domain, boolean isCentralDataProtectionEnabled) {
    Mockito.when(tenantService.getRestrictedTenantDataBySubdomain(domain))
        .thenReturn(new RestrictedTenantDTO().settings(new Settings().featureCentralDataProtectionTemplateEnabled(isCentralDataProtectionEnabled)));
  }

  private void givenSingleDomainWithValue(String domain) {
    Mockito.when(applicationSettingsService.getApplicationSettings()).thenReturn(
        new ApplicationSettingsDTO().mainTenantSubdomainForSingleDomainMultitenancy(
            new ApplicationSettingsDTOMainTenantSubdomainForSingleDomainMultitenancy().value(
                domain)));
  }
}