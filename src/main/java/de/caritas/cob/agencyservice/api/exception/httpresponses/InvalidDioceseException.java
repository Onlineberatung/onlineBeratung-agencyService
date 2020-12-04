package de.caritas.cob.agencyservice.api.exception.httpresponses;

public class InvalidDioceseException extends CustomHttpStatusException {

  /** InvalidDioceseException - BAD REQUEST 400. */
  public InvalidDioceseException() {
    super(HttpStatusExceptionReason.INVALID_DIOCESE);
  }
}
