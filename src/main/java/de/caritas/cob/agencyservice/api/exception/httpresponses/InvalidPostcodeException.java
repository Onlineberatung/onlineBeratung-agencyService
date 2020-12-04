package de.caritas.cob.agencyservice.api.exception.httpresponses;

public class InvalidPostcodeException extends CustomHttpStatusException {

  /** InvalidPostcodeException - BAD REQUEST 400. */
  public InvalidPostcodeException() {
    super(HttpStatusExceptionReason.INVALID_POSTCODE);
  }
}
