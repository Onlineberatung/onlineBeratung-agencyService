package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static java.util.Objects.nonNull;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import org.springframework.stereotype.Component;

/** Postcode validator for an {@link AgencyDTO}. */
@Component
public class AgencyPostcodeValidator implements ConcreteAgencyValidator {

  /**
   * Validates the postcode of an {@link AgencyDTO}.
   *
   * @param agencyDTO (required)
   */
  public void validate(AgencyDTO agencyDTO) {
    if (nonNull(agencyDTO.getPostcode()) && !agencyDTO.getPostcode().matches("^[0-9]{5}$")) {
      throw new InvalidPostcodeException();
    }
  }
}
