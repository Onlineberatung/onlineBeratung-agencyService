package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static java.util.Objects.nonNull;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDto;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import org.springframework.stereotype.Component;

/**
 * Postcode validator for an {@link ValidateAgencyDto}.
 */
@Component
@CreateAgencyValidator
@UpdateAgencyValidator
public class AgencyPostcodeValidator implements ConcreteAgencyValidator {

  /**
   * Validates the postcode of an {@link ValidateAgencyDto}.
   *
   * @param validateAgencyDto (required)
   */
  public void validate(ValidateAgencyDto validateAgencyDto) {
    if (nonNull(validateAgencyDto.getPostcode()) && !validateAgencyDto.getPostcode().matches("^[0-9]{5}$")) {
      throw new InvalidPostcodeException();
    }
  }
}
