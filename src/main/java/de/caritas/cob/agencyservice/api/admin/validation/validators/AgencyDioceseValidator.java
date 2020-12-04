package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static java.util.Objects.nonNull;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidDioceseException;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.repository.diocese.DioceseRepository;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/** Diocese validator for an {@link AgencyDTO}. */
@Component
@RequiredArgsConstructor
public class AgencyDioceseValidator implements ConcreteAgencyValidator {

  private final @NonNull DioceseRepository dioceseRepository;

  /**
   * Validates the diocese id of an {@link AgencyDTO}.
   *
   * @param agencyDTO (required)
   */
  public void validate(AgencyDTO agencyDTO) {
    if (!dioceseRepository.findById(agencyDTO.getDioceseId()).isPresent()) {
      throw new InvalidDioceseException();
    }
  }
}
