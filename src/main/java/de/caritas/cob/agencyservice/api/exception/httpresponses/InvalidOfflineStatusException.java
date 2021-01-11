package de.caritas.cob.agencyservice.api.exception.httpresponses;

/**
 * Exception, when the offline status of an agency is invalid.
 */
public class InvalidOfflineStatusException extends CustomValidationHttpStatusException {

  /*
   * InvalidOfflineStatusException - BAD REQUEST 400.
   */
  public InvalidOfflineStatusException() {
    super(HttpStatusExceptionReason.INVALID_OFFLINE_STATUS);
  }
}
