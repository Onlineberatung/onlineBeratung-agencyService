package de.caritas.cob.AgencyService.api.service;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.atLeastOnce;
import static org.mockito.Mockito.verify;
import java.io.PrintWriter;
import javax.ws.rs.BadRequestException;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class LogServiceTest {

  private LogService logService;

  @Mock
  Exception exception;

  @Mock
  BadRequestException badRequestException;

  @Before
  public void setup() {
    logService = new LogService();

  }

  @Test
  public void logDatabaseError_Should_LogExceptionStackTrace() {

    logService.logDatabaseError(exception);
    verify(exception, atLeastOnce()).printStackTrace(any(PrintWriter.class));

  }

  @Test
  public void logBadRequestException_Should_LogExceptionStackTrace() {

    logService.logBadRequestException(badRequestException);
    verify(badRequestException, atLeastOnce()).printStackTrace(any(PrintWriter.class));
  }

}
