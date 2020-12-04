package de.caritas.cob.agencyservice.api.exception.httpresponses;

public class InvalidConsultingTypeException extends CustomHttpStatusException {

  /** InvalidConsultingTypeException - BAD REQUEST 400. */
  public InvalidConsultingTypeException() {
    super(HttpStatusExceptionReason.INVALID_CONSULTING_TYPE);
  }
}
