package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Consulting type validator for an {@link ValidateAgencyDTO}.
 */
@Component
@RequiredArgsConstructor
@CreateAgencyValidator
public class AgencyConsultingTypeValidator implements ConcreteAgencyValidator {

  private final @NonNull ConsultingTypeManager consultingTypeManager;

  /**
   * Validates the diocese id of an {@link ValidateAgencyDTO}.
   *
   * @param validateAgencyDto (required)
   */
  public void validate(ValidateAgencyDTO validateAgencyDto) {

    try {
      consultingTypeManager.getConsultingTypeSettings(validateAgencyDto.getConsultingType());
    } catch (MissingConsultingTypeException e) {
      throw new InvalidConsultingTypeException();
    }
  }
}
