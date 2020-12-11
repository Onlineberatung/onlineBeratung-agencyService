package de.caritas.cob.agencyservice.api.exception.httpresponses;

/**
 * Exception, when consulting type is invalid.
 */
public class InvalidConsultingTypeException extends CustomValidationHttpStatusException {

  /**
   * InvalidConsultingTypeException - BAD REQUEST 400.
   */
  public InvalidConsultingTypeException() {
    super(HttpStatusExceptionReason.INVALID_CONSULTING_TYPE);
  }
}
