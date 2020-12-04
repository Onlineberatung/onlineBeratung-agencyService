package de.caritas.cob.agencyservice.api.exception.httpresponses;

import static java.util.Objects.nonNull;

import java.util.function.Consumer;

public abstract class CustomHttpStatusException extends RuntimeException {

  private final Consumer<Exception> loggingMethod;
  private final HttpStatusExceptionReason httpStatusExceptionReason;

  CustomHttpStatusException(HttpStatusExceptionReason httpStatusExceptionReason) {
    super();
    this.loggingMethod = null;
    this.httpStatusExceptionReason = httpStatusExceptionReason;
  }

  CustomHttpStatusException(
      Consumer<Exception> loggingMethod, HttpStatusExceptionReason httpStatusExceptionReason) {
    super();
    this.loggingMethod = loggingMethod;
    this.httpStatusExceptionReason = httpStatusExceptionReason;
  }

  CustomHttpStatusException(
      Exception exception,
      Consumer<Exception> loggingMethod,
      HttpStatusExceptionReason httpStatusExceptionReason) {
    super(exception);
    this.loggingMethod = loggingMethod;
    this.httpStatusExceptionReason = httpStatusExceptionReason;
  }

  CustomHttpStatusException(
      String message,
      Exception exception,
      Consumer<Exception> loggingMethod,
      HttpStatusExceptionReason httpStatusExceptionReason) {
    super(message, exception);
    this.loggingMethod = loggingMethod;
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
