package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import org.springframework.stereotype.Component;

/**
 * Consulting type validator for an {@link ValidateAgencyDTO}.
 */
@Component
@CreateAgencyValidator
public class AgencyConsultingTypeValidator implements ConcreteAgencyValidator {

  /**
   * Validates the diocese id of an {@link ValidateAgencyDTO}.
   *
   * @param validateAgencyDto (required)
   */
  public void validate(ValidateAgencyDTO validateAgencyDto) {
    if (!ConsultingType.valueOf(validateAgencyDto.getConsultingType()).isPresent()) {
      throw new InvalidConsultingTypeException();
    }
  }
}
