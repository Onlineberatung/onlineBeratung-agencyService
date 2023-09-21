package de.caritas.cob.agencyservice.api.admin.validation;

import de.caritas.cob.agencyservice.api.admin.validation.validators.ConcreteAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
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
   * @param agencyDto (required)
   */
  public void validate(AgencyDTO agencyDto) {
    this.applicationContext
        .getBeansOfType(ConcreteAgencyValidator.class)
        .values()
        .stream()
        .filter(c -> c.getClass().isAnnotationPresent(CreateAgencyValidator.class))
        .forEach(validator -> validator.validate(fromAgencyDto(agencyDto)));
  }

  /**
   * Validates an {@link UpdateAgencyDTO}.
   *
   * @param updateAgencyDTO (required)
   */
  public void validate(Long agencyId, UpdateAgencyDTO updateAgencyDTO) {
    this.applicationContext
        .getBeansOfType(ConcreteAgencyValidator.class)
        .values()
        .stream()
        .filter(c -> c.getClass().isAnnotationPresent(UpdateAgencyValidator.class))
        .forEach(validator -> validator.validate(fromUpdateAgencyDto(agencyId, updateAgencyDTO)));
  }

  private ValidateAgencyDTO fromAgencyDto(AgencyDTO agencyDto) {
    return ValidateAgencyDTO.builder()
        .postcode(agencyDto.getPostcode())
        .consultingType(agencyDto.getConsultingType())
        .demographicsDTO(agencyDto.getDemographics())
        .build();
  }

  private ValidateAgencyDTO fromUpdateAgencyDto(Long agencyId, UpdateAgencyDTO updateAgencyDTO) {
    return ValidateAgencyDTO.builder()
        .id(agencyId)
        .postcode(updateAgencyDTO.getPostcode())
        .offline(updateAgencyDTO.getOffline())
        .demographicsDTO(updateAgencyDTO.getDemographics())
        .build();
  }
}
