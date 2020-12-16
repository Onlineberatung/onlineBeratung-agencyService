package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_AIDS;

import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDto;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;

public class AgencyConsultingTypeValidatorTest {

  private ValidateAgencyDto validateAgencyDto;

  @Before
  public void setup() {
    EasyRandom easyRandom = new EasyRandom();
    this.validateAgencyDto = easyRandom.nextObject(ValidateAgencyDto.class);
  }

  @Test(expected = InvalidConsultingTypeException.class)
  public void validate_Should_ThrowInvalidConsultingTypeException_WhenConsultingTypeIsInvalid() {
    this.validateAgencyDto.setConsultingType(-1);
    new AgencyConsultingTypeValidator().validate(validateAgencyDto);
  }

  @Test
  public void validate_Should_ThrowNoException_WhenConsultingTypeIsValid() {
    this.validateAgencyDto.setConsultingType(CONSULTING_TYPE_AIDS.getValue());
    new AgencyConsultingTypeValidator().validate(validateAgencyDto);
  }

}
