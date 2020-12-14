package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import org.springframework.stereotype.Component;

/**
 * Consulting type validator for an {@link AgencyDTO}.
 */
@Component
public class AgencyConsultingTypeValidator implements ConcreteAgencyValidator {

  /**
   * Validates the diocese id of an {@link AgencyDTO}.
   *
   * @param agencyDTO (required)
   */
  public void validate(AgencyDTO agencyDTO) {
    if (!ConsultingType.valueOf(agencyDTO.getConsultingType()).isPresent()) {
      throw new InvalidConsultingTypeException();
    }
  }
}
