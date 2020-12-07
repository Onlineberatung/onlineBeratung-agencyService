package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_POSTCODE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_FULL_POSTCODE;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;

public class AgencyPostcodeValidatorTest {

  private AgencyDTO agencyDTO;

  @Before
  public void setup() {
    EasyRandom easyRandom = new EasyRandom();
    this.agencyDTO = easyRandom.nextObject(AgencyDTO.class);
  }

  @Test(expected = InvalidPostcodeException.class)
  public void validate_Should_ThrowInvalidPostcodeException_WhenPostcodeIsInvalid() {
    this.agencyDTO.setPostcode(INVALID_POSTCODE);
    new AgencyPostcodeValidator().validate(agencyDTO);
  }

  @Test
  public void validate_Should_ThrowNoException_WhenPostcodeIsValid() {
    this.agencyDTO.setPostcode(VALID_FULL_POSTCODE);
    new AgencyPostcodeValidator().validate(agencyDTO);
  }

  @Test
  public void validate_ShouldNot_ThrowInvalidPostcodeException_WhenPostcodeIsNull() {
    this.agencyDTO.setPostcode(null);
    new AgencyPostcodeValidator().validate(agencyDTO);
  }
}
