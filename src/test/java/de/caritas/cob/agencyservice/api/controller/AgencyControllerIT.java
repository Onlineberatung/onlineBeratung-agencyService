package de.caritas.cob.agencyservice.api.controller;

import static de.caritas.cob.agencyservice.testHelper.PathConstants.PATH_GET_AGENCIES_WITH_IDS;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.PATH_GET_LIST_OF_AGENCIES;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_RESPONSE_DTO;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_RESPONSE_DTO_LIST;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.FULL_AGENCY_RESPONSE_DTO;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_AGENCY_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_CONSULTING_TYPE_QUERY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_POSTCODE_QUERY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_AGE_QUERY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_CONSULTING_TYPE_QUERY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE_QUERY;
import static org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.atLeastOnce;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.powermock.reflect.Whitebox.setInternalState;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import de.caritas.cob.agencyservice.api.authorization.RoleAuthorizationAuthorityMapper;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.model.FullAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import de.caritas.cob.agencyservice.api.service.LogService;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.hateoas.client.LinkDiscoverers;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

@RunWith(SpringRunner.class)
@WebMvcTest(AgencyController.class)
@AutoConfigureMockMvc(addFilters = false)

public class AgencyControllerIT {

  static final String PATH_GET_AGENCIES_BY_CONSULTINGTYPE = "/agencies/consultingtype/1";

  @Autowired
  private MockMvc mvc;

  @MockBean
  private AgencyService agencyService;

  @MockBean
  private LinkDiscoverers linkDiscoverers;

  @MockBean
  private RoleAuthorizationAuthorityMapper roleAuthorizationAuthorityMapper;

  @Mock
  private Logger logger;

  @Before
  public void setup() {
    setInternalState(LogService.class, "LOGGER", logger);
  }

  @Test
  public void getAgencies_Should_ReturnNoContent_When_ServiceReturnsEmptyList() throws Exception {

    when(agencyService.getAgencies(Mockito.anyString(), Mockito.anyInt(), Mockito.any(Optional.class), Mockito.any(Optional.class), Mockito.any(Optional.class)))
        .thenReturn(null);

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_POSTCODE_QUERY + "&"
            + VALID_CONSULTING_TYPE_QUERY + "&" + VALID_AGE_QUERY)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isNoContent());
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_When_PostcodeParamIsInvalid() throws Exception {

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + INVALID_POSTCODE_QUERY + "&"
            + VALID_CONSULTING_TYPE_QUERY)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_When_ConsultingTypeParamIsInvalid()
      throws Exception {

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_POSTCODE_QUERY + "&"
            + INVALID_CONSULTING_TYPE_QUERY)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_When_PostcodeParamIsNotProvided()
      throws Exception {

    mvc.perform(get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_CONSULTING_TYPE_QUERY)
        .accept(MediaType.APPLICATION_JSON)).andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_When_ConsultingTypeParamIsNotProvided()
      throws Exception {

    mvc.perform(get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_POSTCODE_QUERY)
        .accept(MediaType.APPLICATION_JSON)).andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_Should_ReturnListAndOk_When_ServiceReturnsList() throws Exception {

    List<FullAgencyResponseDTO> agencies = new ArrayList<>();
    agencies.add(FULL_AGENCY_RESPONSE_DTO);

    when(agencyService.getAgencies(Mockito.anyString(), Mockito.anyInt(), Mockito.any(Optional.class), Mockito.any(Optional.class), Mockito.any(Optional.class)))
        .thenReturn(agencies);

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_POSTCODE_QUERY + "&"
            + VALID_CONSULTING_TYPE_QUERY)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(jsonPath("[0].name").value(AGENCY_RESPONSE_DTO.getName()));

    verify(agencyService, atLeastOnce()).getAgencies(Mockito.anyString(),
        Mockito.anyInt(), Mockito.any(Optional.class), Mockito.any(Optional.class), Mockito.any(Optional.class));
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnNoContent_When_ServiceReturnsNoAgency()
      throws Exception {

    when(agencyService.getAgencies(Mockito.anyList())).thenReturn(Collections.emptyList());

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID).accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isNotFound());
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnBadRequest_When_IdInvalid() throws Exception {

    mvc.perform(
        get(PATH_GET_AGENCIES_WITH_IDS + INVALID_AGENCY_ID).contentType(MediaType.APPLICATION_JSON)
            .accept(MediaType.APPLICATION_JSON)).andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnAgencyAndOk_When_ServiceReturnsAgency()
      throws Exception {

    when(agencyService.getAgencies(Mockito.anyList())).thenReturn(AGENCY_RESPONSE_DTO_LIST);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID + "," + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(jsonPath("[0].name").value(AGENCY_RESPONSE_DTO.getName()));

    verify(agencyService, atLeastOnce()).getAgencies(Mockito.anyList());
  }

  @Test
  public void getListOfAgencies_Should_ReturnServerErrorAndLogDatabaseError_OnAgencyServiceThrowsServerErrorException()
      throws Exception {

    InternalServerErrorException dbEx = new InternalServerErrorException(
        LogService::logDatabaseError, "message");
    when(agencyService.getAgencies(any(), anyInt(), Mockito.any(Optional.class), Mockito.any(Optional.class), Mockito.any(Optional.class))).thenThrow(dbEx);

    mvc.perform(get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_POSTCODE_QUERY + "&"
        + VALID_CONSULTING_TYPE_QUERY)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isInternalServerError());

    verify(logger, times(1)).error("Database error: {}", getStackTrace(dbEx));
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnServerErrorAndLogDatabaseError_OnAgencyServiceThrowsServerErrorException()
      throws Exception {

    InternalServerErrorException dbEx = new InternalServerErrorException(
        LogService::logDatabaseError, "message");
    when(agencyService.getAgencies(any())).thenThrow(dbEx);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID + "," + AGENCY_ID)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isInternalServerError());

    verify(logger, times(1)).error("Database error: {}", getStackTrace(dbEx));
  }

  @Test
  public void getListOfAgencies_Should_ReturnServerErrorAndLogNumberFormatError_OnAgencyServiceThrowsServerErrorException()
      throws Exception {

    InternalServerErrorException nfEx = new InternalServerErrorException(
        LogService::logNumberFormatException, "message");

    when(agencyService.getAgencies(any(), anyInt(), Mockito.any(Optional.class), Mockito.any(Optional.class), Mockito.any(Optional.class))).thenThrow(nfEx);

    mvc.perform(get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_POSTCODE_QUERY + "&"
        + VALID_CONSULTING_TYPE_QUERY)
        .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isInternalServerError());

    verify(logger, times(1)).error("Error while formatting number: {}",
        getStackTrace(nfEx));
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_When_ConsultingTypeIsNull() throws Exception {
    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_POSTCODE_QUERY + "&"
            + "consultingType=").accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void getAgenciesByConsultingType_Should_ReturnBadRequest_When_consultingTypeIsInvalid()
      throws Exception {
    mvc.perform(
        get(PATH_GET_AGENCIES_BY_CONSULTINGTYPE.replace("1", "invalid"))
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void getAgenciesByConsultingType_Should_ReturnOk_When_consultingTypeIsValid()
      throws Exception {
    mvc.perform(
        get(PATH_GET_AGENCIES_BY_CONSULTINGTYPE)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
  }

}
