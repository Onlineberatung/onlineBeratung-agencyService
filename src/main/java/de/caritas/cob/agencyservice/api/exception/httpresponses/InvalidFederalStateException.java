package de.caritas.cob.agencyservice.api.exception.httpresponses;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class InvalidFederalStateException extends CustomValidationHttpStatusException {

  /**
   * InvalidFederalStateException - BAD REQUEST 400.
   */
  public InvalidFederalStateException(HttpStatusExceptionReason reason) {
    super(reason);
  }
}
