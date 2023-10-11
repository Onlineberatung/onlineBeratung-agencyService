package de.caritas.cob.agencyservice.api;

import de.caritas.cob.agencyservice.api.exception.KeycloakException;
import de.caritas.cob.agencyservice.api.exception.customheader.CustomHttpHeader;
import de.caritas.cob.agencyservice.api.exception.httpresponses.BadRequestException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.ConflictException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.CustomValidationHttpStatusException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidDemographicsException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.service.LogService;
import java.net.UnknownHostException;
import jakarta.validation.ConstraintViolationException;
import lombok.NoArgsConstructor;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

/**
 * Customizes API error/exception handling to hide information and/or possible security
 * vulnerabilities.
 */
@NoArgsConstructor
@ControllerAdvice
@Order(Ordered.HIGHEST_PRECEDENCE)
public class ApiResponseEntityExceptionHandler extends ResponseEntityExceptionHandler {

  private static final Exception EMPTY_EXCEPTION = new RuntimeException();

  /**
   * Custom BadRequest exception.
   *
   * @param ex      the thrown exception
   * @param request web request
   * @return response entity
   */
  @ExceptionHandler({BadRequestException.class})
  public ResponseEntity<Object> handleCustomBadRequest(
      final BadRequestException ex, final WebRequest request) {
    LogService.logWarning(ex);

    return handleExceptionInternal(ex, null, new HttpHeaders(), HttpStatus.BAD_REQUEST, request);
  }

  /**
   * Constraint violations.
   *
   * @param ex      the thrown exception
   * @param request web request
   * @return response entity
   */
  @ExceptionHandler({ConstraintViolationException.class})
  public ResponseEntity<Object> handleBadRequest(
      final ConstraintViolationException ex, final WebRequest request) {
    LogService.logWarning(ex);

    return handleExceptionInternal(ex, null, new HttpHeaders(), HttpStatus.BAD_REQUEST, request);
  }

  /**
   * 409 - Conflict.
   *
   * @param ex      the thrown exception
   * @param request web request
   * @return response entity
   */
  @ExceptionHandler({InvalidDataAccessApiUsageException.class})
  protected ResponseEntity<Object> handleConflict(
      final RuntimeException ex, final WebRequest request) {
    LogService.logWarning(HttpStatus.CONFLICT, ex);

    return handleExceptionInternal(ex, null, new HttpHeaders(), HttpStatus.CONFLICT, request);
  }

  /**
   * 500 - Internal Server Error.
   *
   * @param ex      the thrown exception
   * @param request web request
   * @return response entity
   */
  @ExceptionHandler({NullPointerException.class, IllegalArgumentException.class,
      IllegalStateException.class, KeycloakException.class,
      UnknownHostException.class, DataAccessException.class})
  public ResponseEntity<Object> handleInternal(
      final RuntimeException ex, final WebRequest request) {
    LogService.logInternalServerError(ex);

    return handleExceptionInternal(
        EMPTY_EXCEPTION, null, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR, request);
  }

  /**
   * 500 - Internal Server Error with custom logging method.
   *
   * @param ex      the thrown exception
   * @param request web request
   * @return response entity
   */
  @ExceptionHandler({InternalServerErrorException.class})
  public ResponseEntity<Object> handleInternal(
      final InternalServerErrorException ex, final WebRequest request) {
    ex.executeLogging();

    return handleExceptionInternal(
        EMPTY_EXCEPTION, null, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR, request);
  }

  /**
   * 400 - Bad Request.
   *
   * @param ex      CustomValidationHttpStatusException
   * @param request WebRequest
   * @return a ResponseEntity instance
   */
  @ExceptionHandler({InvalidPostcodeException.class, InvalidConsultingTypeException.class, InvalidOfflineStatusException.class,
      InvalidDemographicsException.class
  })
  public ResponseEntity<Object> handleInternal(
      final CustomValidationHttpStatusException ex, final WebRequest request) {
    ex.executeLogging();

    return handleExceptionInternal(
        ex,
        null,
        new CustomHttpHeader(ex.getHttpStatusExceptionReason()).buildHeader(),
        HttpStatus.BAD_REQUEST,
        request);
  }

  /**
   * 404 - Not found.
   *
   * @param ex      {@link NotFoundException}
   * @param request WebRequest
   * @return a ResponseEntity instance
   */
  @ExceptionHandler({NotFoundException.class})
  public ResponseEntity<Object> handleInternal(
      final NotFoundException ex, final WebRequest request) {

    return handleExceptionInternal(
        ex,
        null,
        new HttpHeaders(),
        HttpStatus.NOT_FOUND,
        request);
  }

  /**
   * 409 - Conflict.
   *
   * @param ex      {@link NotFoundException}
   * @param request WebRequest
   * @return a ResponseEntity instance
   */
  @ExceptionHandler({ConflictException.class})
  public ResponseEntity<Object> handleInternal(
      final ConflictException ex, final WebRequest request) {

    return handleExceptionInternal(
        ex,
        null,
        new CustomHttpHeader(ex.getHttpStatusExceptionReason()).buildHeader(),
        HttpStatus.CONFLICT,
        request);
  }

  /**
   * Handles generic HTTP client error status for generated apis.
   *
   * @param ex      {@link HttpClientErrorException}
   * @param request {@link WebRequest}
   * @return response entity
   */
  @ExceptionHandler({HttpClientErrorException.class})
  public ResponseEntity<Object> handleInternal(final HttpClientErrorException ex,
      final WebRequest request) {
    LogService.logError(ex);

    return handleExceptionInternal(EMPTY_EXCEPTION, null, new HttpHeaders(), ex.getStatusCode(),
        request);
  }

}
