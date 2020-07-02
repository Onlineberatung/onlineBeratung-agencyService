package de.caritas.cob.AgencyService.api.controller;

import static org.mockito.Mockito.atLeastOnce;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import java.util.ArrayList;
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
import de.caritas.cob.AgencyService.api.model.AgencyResponseDTO;
import de.caritas.cob.AgencyService.api.repository.agency.ConsultingType;
import de.caritas.cob.AgencyService.api.service.AgencyService;

@RunWith(SpringRunner.class)
@WebMvcTest(AgencyController.class)
@AutoConfigureMockMvc(secure = false)
public class AgencyControllerIT {

  private final String VALID_MEDIUM_POSTCODE = "postcode=884";
  private final String VALID_CONSULTING_TYPE = "consultingType=1";
  private final String INVALID_POSTCODE = "postcode=12";
  private final String INVALID_CONSULTING_TYPE = "consultingType=99999";
  private final String PATH_GET_LIST_OF_AGENCIES = "/agencies";
  private final String PATH_GET_AGENCY = "/agencies/data/";
  private final String AGENCY_ID = "12";
  private final String INVALIDAGENCY_ID = "12xX";
  private final AgencyResponseDTO AGENCY_RESPONSE_DTO = new AgencyResponseDTO(1L, "name", "12345", "testcity",
      "description", false, false, ConsultingType.SUCHT.getValue());

  @Autowired
  private MockMvc mvc;

  @MockBean
  private AgencyService agencyService;

  @Test
  public void getAgencies_Should_ReturnNoContent_WhenServiceReturnsEmptyList() throws Exception {

    when(agencyService.getListOfAgencies(Mockito.anyString(), Mockito.any(ConsultingType.class)))
        .thenReturn(null);

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_MEDIUM_POSTCODE + "&" + VALID_CONSULTING_TYPE)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isNoContent());
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_WhenPostcodeParamIsInvalid() throws Exception {

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + INVALID_POSTCODE + "&" + VALID_CONSULTING_TYPE)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_WhenConsultingTypeParamIsInvalid()
      throws Exception {

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_MEDIUM_POSTCODE + "&" + INVALID_CONSULTING_TYPE)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_WhenPostcodeParamIsNotProvided()
      throws Exception {

    mvc.perform(get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_CONSULTING_TYPE)
        .accept(MediaType.APPLICATION_JSON)).andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_Should_ReturnBadRequest_WhenConsultingTypeParamIsNotProvided()
      throws Exception {

    mvc.perform(get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_MEDIUM_POSTCODE)
        .accept(MediaType.APPLICATION_JSON)).andExpect(status().isBadRequest());
  }

  @Test
  public void getAgencies_Should_ReturnListAndOK_WhenServiceReturnsList() throws Exception {

    List<AgencyResponseDTO> agencies = new ArrayList<AgencyResponseDTO>();
    agencies.add(AGENCY_RESPONSE_DTO);

    when(agencyService.getListOfAgencies(Mockito.anyString(), Mockito.any(ConsultingType.class)))
        .thenReturn(agencies);

    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_MEDIUM_POSTCODE + "&" + VALID_CONSULTING_TYPE)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(jsonPath("[0].name").value(AGENCY_RESPONSE_DTO.getName()));

    verify(agencyService, atLeastOnce()).getListOfAgencies(Mockito.anyString(),
        Mockito.any(ConsultingType.class));
  }

  @Test
  public void getAgency_Should_ReturnNoContent_WhenServiceReturnsNoAgency() throws Exception {

    when(agencyService.getAgency(Mockito.anyLong())).thenReturn(null);

    mvc.perform(get(PATH_GET_AGENCY + AGENCY_ID).accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isNotFound());
  }

  @Test
  public void getAgency_Should_ReturnBadRequest_WhenPathParamIsInvalid() throws Exception {

    mvc.perform(get(PATH_GET_AGENCY + INVALIDAGENCY_ID).contentType(MediaType.APPLICATION_JSON)
        .accept(MediaType.APPLICATION_JSON)).andExpect(status().isBadRequest());
  }

  @Test
  public void getAgency_Should_ReturnAgencyAndOK_WhenServiceReturnsAgency() throws Exception {

    when(agencyService.getAgency(Mockito.anyLong())).thenReturn(AGENCY_RESPONSE_DTO);

    mvc.perform(get(PATH_GET_AGENCY + AGENCY_ID).accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(jsonPath("name").value(AGENCY_RESPONSE_DTO.getName()));

    verify(agencyService, atLeastOnce()).getAgency(Mockito.anyLong());
  }
}
