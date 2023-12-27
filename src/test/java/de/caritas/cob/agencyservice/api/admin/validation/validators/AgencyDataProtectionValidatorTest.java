package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;

import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO.DataProtectionResponsibleEntityEnum;
import de.caritas.cob.agencyservice.api.repository.agency.DataProtectionPlaceHolderType;
import de.caritas.cob.agencyservice.api.service.ApplicationSettingsService;
import de.caritas.cob.agencyservice.api.service.TenantService;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTO;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTOMainTenantSubdomainForSingleDomainMultitenancy;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.Content;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
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
  void validate_Should_ValidateForAgencyTenant_When_NonSingleDomainMultitenancy() {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER)).build();
    ReflectionTestUtils.setField(agencyDataProtectionValidator, "multitenancyWithSingleDomain",
        false);
    givenAgencyTenantWithPrivacy(agencyToValidate, "${dataProtectionOfficer}");
    // when
    agencyDataProtectionValidator.validate(agencyToValidate);
    // then
    ArgumentCaptor<RestrictedTenantDTO> captor = ArgumentCaptor.forClass(RestrictedTenantDTO.class);
    Mockito.verify(agencyDataProtectionValidationService, Mockito.times(1))
        .validate(Mockito.eq(agencyToValidate), captor.capture());
    assertThat(captor.getValue().getContent().getPrivacy()).isEqualTo("${dataProtectionOfficer}");
  }

  @Test
  void validate_Should_ValidateForAgencyTenant_And_MainTenant_When_SingleDomainMultitenancy() {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER)).build();
    ReflectionTestUtils.setField(agencyDataProtectionValidator, "multitenancyWithSingleDomain",
        true);
    givenAgencyTenantWithPrivacy(agencyToValidate, "${dataProtectionOfficer}");
    givenSingleDomainWithValue("app");
    givenMainTenantWithPrivacy("app",
        DataProtectionPlaceHolderType.DATA_PROTECTION_RESPONSIBLE.getPlaceholder());
    // when
    agencyDataProtectionValidator.validate(agencyToValidate);
    // then
    ArgumentCaptor<RestrictedTenantDTO> captor = ArgumentCaptor.forClass(RestrictedTenantDTO.class);

    Mockito.verify(agencyDataProtectionValidationService, Mockito.times(2))
        .validate(Mockito.eq(agencyToValidate), captor.capture());

    List<RestrictedTenantDTO> allCapturedValues = captor.getAllValues();
    assertThat(allCapturedValues.get(0).getContent().getPrivacy()).isEqualTo(
        "${dataProtectionOfficer}");
    assertThat(allCapturedValues.get(1).getContent().getPrivacy()).isEqualTo(
        DataProtectionPlaceHolderType.DATA_PROTECTION_RESPONSIBLE.getPlaceholder());
  }


  private void givenAgencyTenantWithPrivacy(ValidateAgencyDTO agency, String privacy) {
    Mockito.when(tenantService.getRestrictedTenantDataByTenantId(agency.getTenantId()))
        .thenReturn(new RestrictedTenantDTO().content(new Content().privacy(privacy)));
  }

  private void givenMainTenantWithPrivacy(String domain, String placeholder) {
    Mockito.when(tenantService.getRestrictedTenantDataBySubdomain(domain))
        .thenReturn(new RestrictedTenantDTO().content(new Content().privacy(placeholder)));
  }

  private void givenSingleDomainWithValue(String domain) {
    Mockito.when(applicationSettingsService.getApplicationSettings()).thenReturn(
        new ApplicationSettingsDTO().mainTenantSubdomainForSingleDomainMultitenancy(
            new ApplicationSettingsDTOMainTenantSubdomainForSingleDomainMultitenancy().value(
                domain)));
  }


}