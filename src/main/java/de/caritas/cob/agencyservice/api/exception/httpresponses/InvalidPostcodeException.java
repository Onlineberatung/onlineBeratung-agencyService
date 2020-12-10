package de.caritas.cob.agencyservice.api.exception.httpresponses;

/**
 * Exception, when postcode is invalid.
 */
public class InvalidPostcodeException extends CustomValidationHttpStatusException {

  /**
   * InvalidPostcodeException - BAD REQUEST 400.
   */
  public InvalidPostcodeException() {
    super(HttpStatusExceptionReason.INVALID_POSTCODE);
  }
}
