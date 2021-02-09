package de.caritas.cob.agencyservice.api;

import de.caritas.cob.agencyservice.api.service.LogService;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

@ControllerAdvice
@Order(Ordered.LOWEST_PRECEDENCE)
public class ApiDefaultResponseEntityExceptionHandler {

  private static final MultiValueMap<String, String> EMPTY_HEADERS = new LinkedMultiValueMap<>();

  /**
   * "Catch all" respectively fallback for all controller error messages that are not specifically
   * retained by {@link ApiResponseEntityExceptionHandler}. For the caller side does not need to
   * know the exact error stack trace, this method catches the trace and logs it.
   */
  @ExceptionHandler({RuntimeException.class})
  public ResponseEntity<Object> handleInternal(final RuntimeException ex,
      final WebRequest request) {
    LogService.logInternalServerError(ex);

    return new ResponseEntity<>(EMPTY_HEADERS, HttpStatus.INTERNAL_SERVER_ERROR);
  }
}
