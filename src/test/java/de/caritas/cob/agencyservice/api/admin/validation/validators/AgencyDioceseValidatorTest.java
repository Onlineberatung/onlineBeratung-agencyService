package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDto;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidDioceseException;
import de.caritas.cob.agencyservice.api.repository.diocese.Diocese;
import de.caritas.cob.agencyservice.api.repository.diocese.DioceseRepository;
import java.util.Optional;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class AgencyDioceseValidatorTest {

  @InjectMocks
  AgencyDioceseValidator agencyDioceseValidator;
  @Mock
  DioceseRepository dioceseRepository;

  Long dioceseId = 1L;
  private ValidateAgencyDto validateAgencyDto;
  private final Diocese diocese = new Diocese();

  @Before
  public void setup() {
    EasyRandom easyRandom = new EasyRandom();
    this.validateAgencyDto = easyRandom.nextObject(ValidateAgencyDto.class);
  }

  @Test(expected = InvalidDioceseException.class)
  public void validate_Should_ThrowInvalidDioceseException_WhenDioceseIsInvalid() {
    when(dioceseRepository.findById(dioceseId)).thenReturn(Optional.empty());
    this.validateAgencyDto.setDioceseId(dioceseId);
    agencyDioceseValidator.validate(validateAgencyDto);
  }

  @Test
  public void validate_Should_ThrowNoException_WhenDioceseIsValid() {
    when(dioceseRepository.findById(dioceseId)).thenReturn(Optional.of(this.diocese));
    this.validateAgencyDto.setDioceseId(dioceseId);
    agencyDioceseValidator.validate(validateAgencyDto);
  }

  @Test
  public void agencyDioceseValidator_Should_HaveCreateAgencyValidatorAnnotation() {
    assertTrue(AgencyDioceseValidator.class.isAnnotationPresent(CreateAgencyValidator.class));
  }

  @Test
  public void agencyDioceseValidator_Should_HaveUpdateAgencyValidatorAnnotation() {
    assertTrue(AgencyDioceseValidator.class.isAnnotationPresent(UpdateAgencyValidator.class));
  }

}
