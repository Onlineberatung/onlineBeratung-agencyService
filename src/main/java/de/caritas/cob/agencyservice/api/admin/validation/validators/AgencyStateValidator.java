package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidFederalStateException;
import de.caritas.cob.agencyservice.api.repository.agency.FederalState;
import java.util.Optional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * Postcode validator for an {@link ValidateAgencyDTO}.
 */
@Component
@CreateAgencyValidator
@UpdateAgencyValidator
@Slf4j
public class AgencyStateValidator implements ConcreteAgencyValidator {

  /**
   * Validates the postcode of an {@link ValidateAgencyDTO}.
   *
   * @param validateAgencyDto (required)
   */
  public void validate(ValidateAgencyDTO validateAgencyDto) {
    if (validateAgencyDto.getState() != null) {
      assertNotEmpty(FederalState.findByShortcut(validateAgencyDto.getState()));
    }
  }

  private void assertNotEmpty(Optional<FederalState> foundState) {
    if (foundState.isEmpty()) {
      throw new InvalidFederalStateException(HttpStatusExceptionReason.INVALID_FEDERAL_STATE_VALUE);
    }
  }
}
