package de.caritas.cob.agencyservice.api.controller;

import static de.caritas.cob.agencyservice.testHelper.PathConstants.PATH_GET_AGENCIES_WITH_IDS;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.PATH_GET_LIST_OF_AGENCIES;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_RESPONSE_DTO;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_RESPONSE_DTO_LIST;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALIDAGENCY_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_CONSULTING_TYPE_QUERY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_POSTCODE_QUERY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_CONSULTING_TYPE_QUERY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_MEDIUM_POSTCODE_QUERY;
import static org.mockito.Mockito.atLeastOnce;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import de.caritas.cob.agencyservice.api.service.AgencyService;

@RunWith(SpringRunner.class)
@WebMvcTest(AgencyController.class)
@AutoConfigureMockMvc(secure = false)
public class AgencyControllerIT {

  @Autowired
  private MockMvc mvc;

  @MockBean
  private AgencyService agencyService;

  @Test
  public void getAgencies_Should_ReturnNoContent_When_ServiceReturnsEmptyList() throws Exception {

    when(agencyService.getAgencies(Mockito.anyString(), Mockito.any(ConsultingType.class)))
        .thenReturn(null);

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_MEDIUM_POSTCODE_QUERY + "&" + VALID_CONSULTING_TYPE_QUERY)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isNoContent());
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_When_PostcodeParamIsInvalid() throws Exception {

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + INVALID_POSTCODE_QUERY + "&" + VALID_CONSULTING_TYPE_QUERY)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_When_ConsultingTypeParamIsInvalid()
      throws Exception {

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_MEDIUM_POSTCODE_QUERY + "&" + INVALID_CONSULTING_TYPE_QUERY)
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

    mvc.perform(get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_MEDIUM_POSTCODE_QUERY)
        .accept(MediaType.APPLICATION_JSON)).andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_Should_ReturnListAndOk_When_ServiceReturnsList() throws Exception {

    List<AgencyResponseDTO> agencies = new ArrayList<AgencyResponseDTO>();
    agencies.add(AGENCY_RESPONSE_DTO);

    when(agencyService.getAgencies(Mockito.anyString(), Mockito.any(ConsultingType.class)))
        .thenReturn(agencies);

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_MEDIUM_POSTCODE_QUERY + "&" + VALID_CONSULTING_TYPE_QUERY)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(jsonPath("[0].name").value(AGENCY_RESPONSE_DTO.getName()));

    verify(agencyService, atLeastOnce()).getAgencies(Mockito.anyString(),
        Mockito.any(ConsultingType.class));
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnNoContent_When_ServiceReturnsNoAgency() throws Exception {

    when(agencyService.getAgencies(Mockito.anyList())).thenReturn(Collections.emptyList());

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID).accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isNotFound());
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnBadRequest_When_IdInvalid() throws Exception {

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + INVALIDAGENCY_ID).contentType(MediaType.APPLICATION_JSON)
        .accept(MediaType.APPLICATION_JSON)).andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnAgencyAndOk_When_ServiceReturnsAgency() throws Exception {

    when(agencyService.getAgencies(Mockito.anyList())).thenReturn(AGENCY_RESPONSE_DTO_LIST);

    mvc.perform(get(PATH_GET_AGENCIES_WITH_IDS + AGENCY_ID + "," + AGENCY_ID).accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(jsonPath("[0].name").value(AGENCY_RESPONSE_DTO.getName()));

    verify(agencyService, atLeastOnce()).getAgencies(Mockito.anyList());
  }
}
