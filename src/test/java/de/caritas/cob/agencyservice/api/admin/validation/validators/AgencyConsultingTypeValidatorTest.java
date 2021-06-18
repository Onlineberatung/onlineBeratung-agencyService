package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_AIDS;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

public class AgencyConsultingTypeValidatorTest {

  @Mock
  private ConsultingTypeManager consultingTypeManager;

  private ValidateAgencyDTO validateAgencyDto;

  private ExtendedConsultingTypeResponseDTO consultingTypeSettings;

  @Before
  public void setup() {
    initMocks(this);
    EasyRandom easyRandom = new EasyRandom();
    this.validateAgencyDto = easyRandom.nextObject(ValidateAgencyDTO.class);
    this.consultingTypeSettings = easyRandom.nextObject(ExtendedConsultingTypeResponseDTO.class);
  }

  @Test(expected = InvalidConsultingTypeException.class)
  public void validate_Should_ThrowInvalidConsultingTypeException_WhenConsultingTypeIsInvalid()
      throws MissingConsultingTypeException {
    this.validateAgencyDto.setConsultingType(-1);

    when(consultingTypeManager.getConsultingTypeSettings(anyInt())).thenThrow(new MissingConsultingTypeException(""));

    new AgencyConsultingTypeValidator(consultingTypeManager).validate(validateAgencyDto);
  }

  @Test
  public void validate_Should_ThrowNoException_WhenConsultingTypeIsValid()
      throws MissingConsultingTypeException {
    this.validateAgencyDto.setConsultingType(CONSULTING_TYPE_AIDS);

    when(consultingTypeManager.getConsultingTypeSettings(anyInt())).thenReturn(consultingTypeSettings);

    new AgencyConsultingTypeValidator(consultingTypeManager).validate(validateAgencyDto);
  }

  @Test
  public void agencyConsultingTypeValidator_Should_HaveCreateAgencyValidatorAnnotation() {
    assertTrue(
        AgencyConsultingTypeValidator.class.isAnnotationPresent(CreateAgencyValidator.class));
  }

}
