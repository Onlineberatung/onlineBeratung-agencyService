package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;

import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO.ValidateAgencyDTOBuilder;
import de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidDemographicsException;
import de.caritas.cob.agencyservice.api.model.DemographicsDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Gender;
import org.assertj.core.util.Lists;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.function.Executable;

class AgencyDemographicsValidatorTest {

  AgencyDemographicsValidator validator = new AgencyDemographicsValidator();

  @Test
  void validate_Should_ThrowValidationException_When_DemographicsDTOIsNull() {
    // given, when
    InvalidDemographicsException exception = assertThrows(InvalidDemographicsException.class,
        executeValidation(ValidateAgencyDTO.builder()));

    // then
    assertThat(HttpStatusExceptionReason.INVALID_DEMOGRAPHICS_NULL_OBJECT).isEqualTo(
        exception.getHttpStatusExceptionReason());
  }

  @Test
  void validate_Should_ThrowValidationException_When_DemographicsDTOIsEmpty() {
    // given, when
    InvalidDemographicsException exception = assertThrows(InvalidDemographicsException.class,
        executeValidation(ValidateAgencyDTO.builder().demographicsDTO(new DemographicsDTO())));

    // then
    assertThat(HttpStatusExceptionReason.INVALID_DEMOGRAPHICS_EMPTY_AGE_FROM).isEqualTo(
        exception.getHttpStatusExceptionReason());
  }

  private Executable executeValidation(ValidateAgencyDTOBuilder demographicsDTOBuilder) {
    return () -> validator.validate(demographicsDTOBuilder
        .build());
  }

  @Test
  void validate_Should_ThrowValidationException_When_DemographicsDTOContainEmptyGenders() {
    // given
    DemographicsDTO demographicsDTO = new DemographicsDTO().ageFrom(10);

    // when
    InvalidDemographicsException exception = assertThrows(InvalidDemographicsException.class,
        executeValidation(ValidateAgencyDTO.builder().demographicsDTO(demographicsDTO)));

    // then
    assertThat(HttpStatusExceptionReason.INVALID_DEMOGRAPHICS_EMPTY_GENDERS).isEqualTo(
        exception.getHttpStatusExceptionReason());
  }

  @Test
  void validate_Should_PassValidation_When_AgeFromAndGendersAreProvided() {
    // given
    DemographicsDTO demographicsDTO = new DemographicsDTO().ageFrom(10).genders(Lists.newArrayList(
        Gender.NOT_PROVIDED.toString()));

    // when
    validator.validate(ValidateAgencyDTO.builder().demographicsDTO(demographicsDTO).build());
  }

}