package de.caritas.cob.agencyservice.api.exception.httpresponses;

import static org.springframework.http.HttpStatus.BAD_REQUEST;

/**
 * Exception, when consulting type is invalid.
 */
public class InvalidConsultingTypeException extends CustomValidationHttpStatusException {

  /**
   * InvalidConsultingTypeException - BAD REQUEST 400.
   */
  public InvalidConsultingTypeException() {
    super(HttpStatusExceptionReason.INVALID_CONSULTING_TYPE, BAD_REQUEST);
  }
}