package de.caritas.cob.agencyservice.api.admin.validation.validators.model;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import de.caritas.cob.agencyservice.api.admin.validation.AgencyValidator;

/**
 * Validation dto for {@link AgencyValidator}.
 */
@Builder
@Getter
@Setter
public class ValidateAgencyDto {

  private Long id;
  private Long dioceseId;
  private String name;
  private String description;
  private String postcode;
  private String city;
  private Boolean teamAgency;
  private Integer consultingType;
  private Boolean offline;

}
