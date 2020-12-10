package de.caritas.cob.agencyservice.api.admin.validation;

import de.caritas.cob.agencyservice.api.admin.validation.validators.ConcreteAgencyValidator;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

/**
 * Validator registry for an agency.
 */
@Service
@RequiredArgsConstructor
public class AgencyValidator {

  private final @NonNull ApplicationContext applicationContext;

  /**
   * Validates an {@link AgencyDTO}.
   *
   * @param agencyDTO (required)
   */
  public void validate(AgencyDTO agencyDTO) {
    this.applicationContext
        .getBeansOfType(ConcreteAgencyValidator.class)
        .values()
        .forEach(validator -> validator.validate(agencyDTO));
  }
}
