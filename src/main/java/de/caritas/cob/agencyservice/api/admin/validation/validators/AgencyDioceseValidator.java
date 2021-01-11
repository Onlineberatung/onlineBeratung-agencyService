package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidDioceseException;
import de.caritas.cob.agencyservice.api.repository.diocese.DioceseRepository;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/*
* Diocese validator for an {@link ValidateAgencyDto}.
 */
@Component
@RequiredArgsConstructor
@CreateAgencyValidator
@UpdateAgencyValidator
public class AgencyDioceseValidator implements ConcreteAgencyValidator {

  private final @NonNull DioceseRepository dioceseRepository;

  /**
   * Validates the diocese id of an {@link ValidateAgencyDTO}.
   *
   * @param validateAgencyDto (required)
   */
  public void validate(ValidateAgencyDTO validateAgencyDto) {
    if (!dioceseRepository.findById(validateAgencyDto.getDioceseId()).isPresent()) {
      throw new InvalidDioceseException();
    }
  }
}
