package de.caritas.cob.agencyservice.api.service;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.atLeastOnce;
import static org.mockito.Mockito.verify;

import java.io.PrintWriter;
import javax.ws.rs.BadRequestException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.http.HttpStatus;

@RunWith(MockitoJUnitRunner.class)
public class LogServiceTest {

  @Mock
  Exception exception;

  @Mock
  BadRequestException badRequestException;

  @Mock
  NumberFormatException numberFormatException;

  @Test
  public void logDatabaseError_Should_LogExceptionStackTrace() {

    LogService.logDatabaseError(exception);
    verify(exception, atLeastOnce()).printStackTrace(any(PrintWriter.class));
  }

  @Test
  public void logBadRequestException_Should_LogExceptionStackTrace() {

    LogService.logBadRequestException(badRequestException);
    verify(badRequestException, atLeastOnce()).printStackTrace(any(PrintWriter.class));
  }

  @Test
  public void logNumberFormatException_Should_LogExceptionStackTrace() {

    LogService.logNumberFormatException(numberFormatException);
    verify(numberFormatException, atLeastOnce()).printStackTrace(any(PrintWriter.class));
  }

  @Test
  public void logWarning_Should_LogWarnMessage_When_onlyExceptionIsProvided() {

    LogService.logWarning(exception);
    verify(exception, atLeastOnce()).printStackTrace(any(PrintWriter.class));
  }

  @Test
  public void logWarning_Should_LogWarnMessage_When_onlyExceptionAndStatusProvided() {

    LogService.logWarning(HttpStatus.MULTI_STATUS, exception);
    verify(exception, atLeastOnce()).printStackTrace(any(PrintWriter.class));
  }

  @Test
  public void logInternalServerError_Should_LogError() {

    LogService.logInternalServerError(exception);
    verify(exception, atLeastOnce()).printStackTrace(any(PrintWriter.class));
  }

  @Test
  public void logError_Should_LogError() {
    LogService.logError(exception);
    verify(exception, atLeastOnce()).printStackTrace(any(PrintWriter.class));
  }

}
