package de.caritas.cob.agencyservice.api.exception.httpresponses;

/**
 * Exception, when agency access is denied.
 */
public class AgencyAccessDeniedException extends CustomValidationHttpStatusException {

  /**
   * AgencyAccessDeniedException - BAD REQUEST 400.
   */
  public AgencyAccessDeniedException() {
    super(HttpStatusExceptionReason.AGENCY_ACCESS_DENIED);
  }
}
