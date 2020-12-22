package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_AIDS;
import static org.junit.jupiter.api.Assertions.assertTrue;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;

public class AgencyConsultingTypeValidatorTest {

  private ValidateAgencyDTO validateAgencyDto;

  @Before
  public void setup() {
    EasyRandom easyRandom = new EasyRandom();
    this.validateAgencyDto = easyRandom.nextObject(ValidateAgencyDTO.class);
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

  @Test
  public void agencyConsultingTypeValidator_Should_HaveCreateAgencyValidatorAnnotation() {
    assertTrue(
        AgencyConsultingTypeValidator.class.isAnnotationPresent(CreateAgencyValidator.class));
  }

}
