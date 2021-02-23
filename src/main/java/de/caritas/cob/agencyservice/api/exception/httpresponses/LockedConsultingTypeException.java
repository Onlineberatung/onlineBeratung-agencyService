package de.caritas.cob.agencyservice.api.exception.httpresponses;

/**
 * Exception when consulting type is invalid.
 */
public class LockedConsultingTypeException extends CustomValidationHttpStatusException {

  private static final long serialVersionUID = -5565155390148452370L;

  /**
   * LockedConsultingTypeException - LOCKED 423.
   */
  public LockedConsultingTypeException() {
    super(HttpStatusExceptionReason.LOCKED_CONSULTING_TYPE);
  }
}