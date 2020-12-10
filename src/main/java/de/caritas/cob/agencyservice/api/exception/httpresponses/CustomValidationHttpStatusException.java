package de.caritas.cob.agencyservice.api.exception.httpresponses;

import static java.util.Objects.nonNull;

import java.util.function.Consumer;

public abstract class CustomValidationHttpStatusException extends RuntimeException {

  private final Consumer<Exception> loggingMethod;
  private final HttpStatusExceptionReason httpStatusExceptionReason;

  CustomValidationHttpStatusException(HttpStatusExceptionReason httpStatusExceptionReason) {
    super();
    this.loggingMethod = null;
    this.httpStatusExceptionReason = httpStatusExceptionReason;
  }

  /** Executes the non null logging method. */
  public void executeLogging() {
    if (nonNull(this.loggingMethod)) {
      this.loggingMethod.accept(this);
    }
  }

  /**
   * Get the {@link @HttpStatusExceptionReason} for the thrown exception.
   *
   * @return a value of {@link @HttpStatusExceptionReason}
   */
  public HttpStatusExceptionReason getHttpStatusExceptionReason() {
    return this.httpStatusExceptionReason;
  }
}
