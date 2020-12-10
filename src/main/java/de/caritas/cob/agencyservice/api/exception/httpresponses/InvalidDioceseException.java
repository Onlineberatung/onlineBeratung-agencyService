package de.caritas.cob.agencyservice.api.exception.httpresponses;

/**
 * Exception, when diocese is invalid.
 */
public class InvalidDioceseException extends CustomValidationHttpStatusException {

  /*
   * InvalidDioceseException - BAD REQUEST 400.
   */
  public InvalidDioceseException() {
    super(HttpStatusExceptionReason.INVALID_DIOCESE);
  }
}
