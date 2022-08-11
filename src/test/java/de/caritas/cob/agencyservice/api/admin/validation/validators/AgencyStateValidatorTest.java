package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;

import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO.ValidateAgencyDTOBuilder;
import de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidFederalStateException;
import de.caritas.cob.agencyservice.api.repository.agency.FederalState;
import org.assertj.core.api.Fail;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.function.Executable;

class AgencyStateValidatorTest {

  AgencyStateValidator validator = new AgencyStateValidator();

  @Test
  void validate_Should_ThrowValidationException_When_FederalStateIsNotValid() {
    // given, when
    InvalidFederalStateException exception = assertThrows(InvalidFederalStateException.class,
        executeValidation(ValidateAgencyDTO.builder().state("XX")));

    // then
    assertThat(HttpStatusExceptionReason.INVALID_FEDERAL_STATE_VALUE).isEqualTo(
        exception.getHttpStatusExceptionReason());
  }


  private Executable executeValidation(ValidateAgencyDTOBuilder agencyBuilder) {
    return () -> validator.validate(agencyBuilder.build());
  }


  @Test
  void validate_Should_PassValidation_When_StateIsNull() {
    // when, then
    try {
      validator.validate(ValidateAgencyDTO.builder().build());
    } catch (Exception e) {
      Fail.fail("No exception is expected");
    }
  }

  @Test
  void validate_Should_PassValidation_When_StateIsValid() {
    // when, then
    try {
      validator.validate(ValidateAgencyDTO.builder().state(FederalState.SACHSEN.getShortcut()).build());
    } catch (Exception e) {
      Fail.fail("No exception is expected");
    }
  }
}