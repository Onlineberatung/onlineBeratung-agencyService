package de.caritas.cob.agencyservice.api.admin.validation;

import de.caritas.cob.agencyservice.api.admin.validation.validators.ConcreteAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.CreateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDto;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
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

  private final @NonNull AgencyRepository agencyRepository;
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

  private ValidateAgencyDto fromAgencyDto(AgencyDTO agencyDto) {
    return ValidateAgencyDto.builder()
        .dioceseId(agencyDto.getDioceseId())
        .name(agencyDto.getName())
        .description(agencyDto.getDescription())
        .postcode(agencyDto.getPostcode())
        .city(agencyDto.getCity())
        .teamAgency(agencyDto.getTeamAgency())
        .consultingType(agencyDto.getConsultingType())
        .build();
  }

  private ValidateAgencyDto fromUpdateAgencyDto(Long agencyId, UpdateAgencyDTO updateAgencyDTO) {
    return ValidateAgencyDto.builder()
        .id(agencyId)
        .dioceseId(updateAgencyDTO.getDioceseId())
        .name(updateAgencyDTO.getName())
        .description(updateAgencyDTO.getDescription())
        .postcode(updateAgencyDTO.getPostcode())
        .city(updateAgencyDTO.getCity())
        .offline(updateAgencyDTO.getOffline())
        .build();
  }
}
