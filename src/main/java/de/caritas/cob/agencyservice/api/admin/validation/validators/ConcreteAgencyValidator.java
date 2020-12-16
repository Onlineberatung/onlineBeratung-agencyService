package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDto;

public interface ConcreteAgencyValidator {

  void validate(ValidateAgencyDto validateAgencyDto);
}
