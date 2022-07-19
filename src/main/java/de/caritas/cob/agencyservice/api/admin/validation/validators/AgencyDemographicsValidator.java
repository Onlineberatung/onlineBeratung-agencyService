package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidDemographicsException;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.stereotype.Component;

/**
 * Postcode validator for an {@link ValidateAgencyDTO}.
 */
@Component
@CreateAgencyValidator
@UpdateAgencyValidator
@ConditionalOnExpression("${feature.demographics.enabled:true}")
@Slf4j
public class AgencyDemographicsValidator implements ConcreteAgencyValidator {

  /**
   * Validates the postcode of an {@link ValidateAgencyDTO}.
   *
   * @param validateAgencyDto (required)
   */
  public void validate(ValidateAgencyDTO validateAgencyDto) {
    assertIsNotNull(validateAgencyDto.getDemographicsDTO(), HttpStatusExceptionReason.INVALID_DEMOGRAPHICS_NULL_OBJECT);
    assertIsNotNull(validateAgencyDto.getDemographicsDTO().getAgeFrom(), HttpStatusExceptionReason.INVALID_DEMOGRAPHICS_EMPTY_AGE_FROM);
    assertIsNotNull(validateAgencyDto.getDemographicsDTO().getGenders(), HttpStatusExceptionReason.INVALID_DEMOGRAPHICS_EMPTY_GENDERS);
    assertNotEmpty(validateAgencyDto.getDemographicsDTO().getGenders());
  }

  private void assertNotEmpty(List<String> genders) {
    if (genders.isEmpty()) {
      throw new InvalidDemographicsException(HttpStatusExceptionReason.INVALID_DEMOGRAPHICS_EMPTY_GENDERS);
    }
  }

  private <T> void assertIsNotNull(T object, HttpStatusExceptionReason reason) {
    if (object == null) {
      throw new InvalidDemographicsException(reason);
    }
  }
}
