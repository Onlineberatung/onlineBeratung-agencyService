package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_POSTCODE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE;
import static org.junit.jupiter.api.Assertions.assertTrue;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;

public class AgencyPostcodeValidatorTest {

  private ValidateAgencyDTO validateAgencyDto;

  @Before
  public void setup() {
    EasyRandom easyRandom = new EasyRandom();
    this.validateAgencyDto = easyRandom.nextObject(ValidateAgencyDTO.class);
  }

  @Test(expected = InvalidPostcodeException.class)
  public void validate_Should_ThrowInvalidPostcodeException_WhenPostcodeIsInvalid() {
    this.validateAgencyDto.setPostcode(INVALID_POSTCODE);
    new AgencyPostcodeValidator().validate(validateAgencyDto);
  }

  @Test
  public void validate_Should_ThrowNoException_WhenPostcodeIsValid() {
    this.validateAgencyDto.setPostcode(VALID_POSTCODE);
    new AgencyPostcodeValidator().validate(validateAgencyDto);
  }

  @Test
  public void validate_ShouldNot_ThrowInvalidPostcodeException_WhenPostcodeIsNull() {
    this.validateAgencyDto.setPostcode(null);
    new AgencyPostcodeValidator().validate(validateAgencyDto);
  }

  @Test
  public void agencyPostcodeValidator_Should_HaveCreateAgencyValidatorAnnotation() {
    assertTrue(AgencyPostcodeValidator.class.isAnnotationPresent(CreateAgencyValidator.class));
  }

  @Test
  public void agencyPostcodeValidator_Should_HaveUpdateAgencyValidatorAnnotation() {
    assertTrue(AgencyPostcodeValidator.class.isAnnotationPresent(UpdateAgencyValidator.class));
  }
}
