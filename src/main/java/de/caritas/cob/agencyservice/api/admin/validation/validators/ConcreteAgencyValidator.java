package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;

public interface ConcreteAgencyValidator {

  void validate(ValidateAgencyDTO validateAgencyDto);
}
