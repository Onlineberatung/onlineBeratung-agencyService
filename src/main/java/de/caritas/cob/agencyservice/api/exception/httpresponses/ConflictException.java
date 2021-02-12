package de.caritas.cob.agencyservice.api.exception.httpresponses;

/**
 * Representation of a 409 - CONFLICT.
 */
public class ConflictException extends RuntimeException {

  /**
   * Conflict exception.
   */
  public ConflictException() {
    super();
  }

  /**
   * Conflict exception.
   *
   * @param message the message
   */
  public ConflictException(String message) {
    super(message);
  }
}
