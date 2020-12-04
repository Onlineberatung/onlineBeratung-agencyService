package de.caritas.cob.agencyservice.api.exception.httpresponses;

import static java.util.Objects.nonNull;

import java.util.function.Consumer;

/**
 * Represents the exception for an internal server error - status code 500.
 */
public class InternalServerErrorException extends RuntimeException {

  private static final long serialVersionUID = -1101045273426330258L;

  private Consumer<Exception> loggingMethod;

  /**
   * InternalServerErrorException exception.
   *
   * @param message the message to be logged
   */
  public InternalServerErrorException(String message) {
    super(message);
  }

  /**
   * InternalServerErrorException exception.
   *
   * @param loggingMethod the method to be used for logging
   * @param message the message to be logged
   */
  public InternalServerErrorException(Consumer<Exception> loggingMethod, String message) {
    super(message);
    this.loggingMethod = loggingMethod;
  }

  /**
   * Executes the non null logging method.
   */
  public void executeLogging() {
    if (nonNull(this.loggingMethod)) {
      this.loggingMethod.accept(this);
    }
  }

}
