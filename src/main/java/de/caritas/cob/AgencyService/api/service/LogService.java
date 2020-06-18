package de.caritas.cob.AgencyService.api.service;

import javax.ws.rs.BadRequestException;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

/**
 * Service for logging
 */
@Service
@Slf4j
public class LogService {

  /**
   * Logs a database error
   * 
   * @param exception
   */
  public void logDatabaseError(Exception exception) {
    log.error("Database error: {}",
        org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(exception));
  }

  /**
   * javax Bad Request Exception
   * 
   * @param exception
   */
  public void logBadRequestException(BadRequestException exception) {
    log.warn("Bad Request: {}",
        org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(exception));
  }

  /**
   * Logs a {@link NumberFormatException}
   * 
   * @param exception
   */
  public void logNumberFormatException(NumberFormatException exception) {
    log.error("Error while formating number: {}",
        org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(exception));
  }

}
