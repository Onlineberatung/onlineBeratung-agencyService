package de.caritas.cob.agencyservice.api.exception.httpresponses;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class InvalidDemographicsException extends CustomValidationHttpStatusException {

  /**
   * InvalidDemographicsException - BAD REQUEST 400.
   */
  public InvalidDemographicsException(HttpStatusExceptionReason reason) {
    super(reason);
  }
}
