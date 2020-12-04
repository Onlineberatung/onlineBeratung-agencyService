package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.model.AgencyDTO;

public interface ConcreteAgencyValidator {

  public void validate(AgencyDTO agencyDTO);
}
