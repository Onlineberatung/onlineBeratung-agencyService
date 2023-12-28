package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;

import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO.DataProtectionResponsibleEntityEnum;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.Content;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import org.assertj.core.api.Fail;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class AgencyDataProtectionValidationServiceTest {

  @InjectMocks
  AgencyDataProtectionValidationService agencyDataProtectionValidator;

  @Test
  void validate_Should_NotValidate_When_DataProtectionOfficerIsNotSet() {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER)).build();

    // when
    try {
      agencyDataProtectionValidator.validate(
          agencyToValidate);
    } catch (InvalidOfflineStatusException e) {
      // then
      assertThat(e.getHttpStatusExceptionReason()).isEqualTo(HttpStatusExceptionReason.DATA_PROTECTION_OFFICER_IS_EMPTY);
    }
  }

  private de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO tenantWithPrivacy(
      String privacy) {
    return new RestrictedTenantDTO().content(new Content().privacy(privacy));
  }

  @Test
  void validate_Should_Validate_When_DataProtectionOfficerIsSet() {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER)
            .dataProtectionOfficerContact(new DataProtectionContactDTO().nameAndLegalForm("name").email("email").city("city").postcode("postcode"))).build();
    // when
    try {
      agencyDataProtectionValidator.validate(
          agencyToValidate);
    } catch (Exception e) {
      // then
      Fail.fail("Should not throw exception");
    }
  }

  @Test
  void validate_Should_Validate_When_DataResponsibleIsSet() {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.AGENCY_RESPONSIBLE).agencyDataProtectionResponsibleContact(new DataProtectionContactDTO().nameAndLegalForm("name").email("email").city("city").postcode("postcode"))
        ).build();
    // when
    try {
      agencyDataProtectionValidator.validate(
          agencyToValidate);
    } catch (Exception e) {
      // then
      Fail.fail("Should not throw exception");
    }
  }


  @Test
  void validate_Should_NotValidate_When_DataResponsibleIsNotSet() {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.AGENCY_RESPONSIBLE)
        ).build();
    // when
    try {
      agencyDataProtectionValidator.validate(
          agencyToValidate);
    } catch (InvalidOfflineStatusException e) {
      // then
      assertThat(e.getHttpStatusExceptionReason()).isEqualTo(HttpStatusExceptionReason.DATA_PROTECTION_RESPONSIBLE_IS_EMPTY);
    }
  }

  @Test
  void validate_Should_NotValidate_When_AlternativeDataResponsibleIsNotSet() {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.ALTERNATIVE_REPRESENTATIVE)).build();
    // when
    try {
      agencyDataProtectionValidator.validate(agencyToValidate);
    } catch (InvalidOfflineStatusException e) {
      // then
      assertThat(e.getHttpStatusExceptionReason()).isEqualTo(HttpStatusExceptionReason.DATA_PROTECTION_ALTERNATIVE_RESPONSIBLE_IS_EMPTY);
    }
  }


  @Test
  void validate_Should_Validate_When_AlternativeDataResponsibleIsSet() {
    // given
    ValidateAgencyDTO agencyToValidate = ValidateAgencyDTO.builder()
        .dataProtectionDTO(new DataProtectionDTO().dataProtectionResponsibleEntity(
                DataProtectionResponsibleEntityEnum.ALTERNATIVE_REPRESENTATIVE)
            .alternativeDataProtectionRepresentativeContact(
                new DataProtectionContactDTO().nameAndLegalForm("name").city("city")
                    .postcode("postcode").email("email"))).build();

    // when
    try {
      agencyDataProtectionValidator.validate(
          agencyToValidate);
    } catch (Exception e) {
      // then
      Fail.fail("Should not throw exception");
    }
  }
}