package de.caritas.cob.agencyservice.api;

import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_IS_ALREADY_TEAM_AGENCY;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.PATH_GET_AGENCIES_WITH_IDS;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.http.HttpStatus.CONFLICT;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import de.caritas.cob.agencyservice.api.authorization.RoleAuthorizationAuthorityMapper;
import de.caritas.cob.agencyservice.api.controller.AgencyController;
import de.caritas.cob.agencyservice.api.exception.httpresponses.BadRequestException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.ConflictException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import de.caritas.cob.agencyservice.api.service.LogService;
import de.caritas.cob.agencyservice.config.security.AuthorisationService;
import de.caritas.cob.agencyservice.config.security.JwtAuthConverter;
import de.caritas.cob.agencyservice.config.security.JwtAuthConverterProperties;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.hateoas.client.LinkDiscoverers;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.client.HttpClientErrorException;

@RunWith(SpringRunner.class)
@WebMvcTest(AgencyController.class)
@AutoConfigureMockMvc(addFilters = false)
public class ResponseEntityExceptionHandlerIT {

  private static final String ERROR_MESSAGE = "message";

  @Autowired
  private MockMvc mvc;

  @MockBean
  private AgencyService agencyService;

  @MockBean
  private LinkDiscoverers linkDiscoverers;

  @MockBean
  private RoleAuthorizationAuthorityMapper roleAuthorizationAuthorityMapper;

  @MockBean
  private JwtAuthConverter jwtAuthConverter;

  @Mock
  private Logger logger;

  @MockBean
  private AuthorisationService authorisationService;

  @MockBean
  private JwtAuthConverterProperties jwtAuthConverterProperties;

  @Before
  public void setup() {
  }

  @Test
  public void handleException_Should_ReturnServerErrorAndLogError_When_InternalServerErrorIsThrown()
      throws Exception {

    InternalServerErrorException exception = new InternalServerErrorException(ERROR_MESSAGE);
    when(agencyService.getAgencies(any())).thenThrow(exception);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isInternalServerError());
  }

  @Test
  public void handleException_Should_ReturnBadRequestAndLogWarning_When_BadRequestExceptionIsThrown()
      throws Exception {

    BadRequestException exception = new BadRequestException(ERROR_MESSAGE);
    when(agencyService.getAgencies(any())).thenThrow(exception);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void handleException_Should_ReturnConflictAndLogWarning_When_InvalidDataAccessApiUsageExceptionIsThrown()
      throws Exception {

    InvalidDataAccessApiUsageException exception = new InvalidDataAccessApiUsageException(
        ERROR_MESSAGE);
    when(agencyService.getAgencies(any())).thenThrow(exception);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isConflict());
  }

  @Test
  public void handleException_Should_ReturnInternalServerErrorAndLogError_When_NullPointerExceptionIsThrown()
      throws Exception {

    NullPointerException exception = new NullPointerException(ERROR_MESSAGE);
    when(agencyService.getAgencies(any())).thenThrow(exception);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isInternalServerError());
  }

  @Test
  public void handleException_Should_ReturnBadRequestAndLogWarning_When_CustomValidationHttpStatusExceptionIsThrown()
      throws Exception {

    InvalidPostcodeException exception = new InvalidPostcodeException();
    when(agencyService.getAgencies(any())).thenThrow(exception);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void handleException_Should_ReturnNotFound_When_NotFoundExceptionIsThrown()
      throws Exception {

    NotFoundException exception = new NotFoundException();
    when(agencyService.getAgencies(any())).thenThrow(exception);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isNotFound());
  }

  @Test
  public void handleException_Should_ReturnConflict_When_ConflictExceptionIsThrown()
      throws Exception {

    ConflictException exception = new ConflictException(AGENCY_IS_ALREADY_TEAM_AGENCY);
    when(agencyService.getAgencies(any())).thenThrow(exception);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isConflict());
  }

  @Test
  public void handleException_Should_ReturnStatusOfExceptionAndLogError_When_HttpClientErrorExceptionIsThrown()
      throws Exception {

    HttpClientErrorException exception = new HttpClientErrorException(HttpStatus.CHECKPOINT);
    when(agencyService.getAgencies(any())).thenThrow(exception);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isCheckpoint());
  }

  @Test
  public void handleException_Should_ReturnInternalServerErrorAndLogError_When_RuntimeExceptionIsThrown()
      throws Exception {

    RuntimeException exception = new RuntimeException();
    when(agencyService.getAgencies(any())).thenThrow(exception);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isInternalServerError());
  }

}
