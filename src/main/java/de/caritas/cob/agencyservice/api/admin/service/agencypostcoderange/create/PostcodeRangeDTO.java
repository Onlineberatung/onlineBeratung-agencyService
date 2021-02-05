package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.create;

import lombok.Builder;
import lombok.Getter;

/**
 * Builder for postcode range validation DTO.
 */
@Builder
@Getter
public class PostcodeRangeDTO {

  private int postCodeFrom;
  private int postCodeTo;
}