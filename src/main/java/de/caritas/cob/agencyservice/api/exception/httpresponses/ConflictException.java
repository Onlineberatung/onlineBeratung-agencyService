package de.caritas.cob.agencyservice.api.exception.httpresponses;

import static org.springframework.http.HttpStatus.CONFLICT;

/**
 * Representation of a 409 - CONFLICT.
 */
public class ConflictException extends CustomValidationHttpStatusException {

  /**
   * Conflict exception.
   *
   * @param httpStatusExceptionReason the reason why the exception is thrown
   */
  public ConflictException(HttpStatusExceptionReason httpStatusExceptionReason) {
    super(httpStatusExceptionReason, CONFLICT);
  }
}
