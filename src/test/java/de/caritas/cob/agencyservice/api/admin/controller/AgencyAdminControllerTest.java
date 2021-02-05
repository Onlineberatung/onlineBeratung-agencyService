package de.caritas.cob.agencyservice.api.admin.controller;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_PREGNANCY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_POSTCODE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE_2;
import static org.hamcrest.Matchers.endsWith;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.admin.service.DioceseAdminService;
import de.caritas.cob.agencyservice.api.admin.validation.AgencyValidator;
import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyAdminSearchService;
import de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.AgencyPostCodeRangeAdminService;
import de.caritas.cob.agencyservice.api.authorization.RoleAuthorizationAuthorityMapper;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidDioceseException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.hateoas.client.LinkDiscoverers;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

@RunWith(SpringRunner.class)
@WebMvcTest(AgencyAdminController.class)
@AutoConfigureMockMvc(addFilters = false)
public class AgencyAdminControllerTest {

  private static final String ROOT_PATH = "/agencyadmin";
  protected static final String AGENCY_SEARCH_PATH = ROOT_PATH + "/agencies";
  protected static final String GET_DIOCESES_PATH = ROOT_PATH + "/dioceses";
  protected static final String CREATE_AGENCY_PATH = ROOT_PATH + "/agency";
  protected static final String UPDATE_AGENCY_PATH = ROOT_PATH + "/agency/1";
  protected static final String PAGE_PARAM = "page";
  protected static final String PER_PAGE_PARAM = "perPage";
  protected static final String GET_AGENCY_POSTCODERANGE_PATH = ROOT_PATH
      + "/agency/1/postcoderanges";
  protected static final String DELETE_AGENCY_POSTCODERANGE_PATH = ROOT_PATH
      + "/postcoderange/";
  protected static final String CREATE_AGENCY_POSTCODE_RANGE_PATH = ROOT_PATH
      + "/agency/1/postcoderange";
  protected static final String UPDATE_AGENCY_POSTCODE_RANGE_PATH = ROOT_PATH
      + "/postcoderange/1";

  @Autowired
  private MockMvc mvc;
  @MockBean
  private AgencyAdminService agencyAdminService;
  @MockBean
  private AgencyValidator agencyValidator;
  @MockBean
  private AgencyAdminSearchService agencyAdminFullResponseDTO;
  @MockBean
  private AgencyPostCodeRangeAdminService agencyPostCodeRangeAdminService;
  @MockBean
  private LinkDiscoverers linkDiscoverers;
  @MockBean
  private DioceseAdminService dioceseAdminService;
  @MockBean
  private RoleAuthorizationAuthorityMapper roleAuthorizationAuthorityMapper;

  @Test
  public void searchAgencies_Should_returnBadRequest_When_requiredPaginationParamsAreMissing()
      throws Exception {
    this.mvc.perform(get(AGENCY_SEARCH_PATH))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void getRoot_Should_returnExpectedRootDTO() throws Exception {
    this.mvc
        .perform(get(ROOT_PATH))
        .andExpect(status().isOk())
        .andExpect(jsonPath("$._links").exists())
        .andExpect(jsonPath("$._links.self").exists())
        .andExpect(jsonPath("$._links.self.href", endsWith("/agencyadmin")))
        .andExpect(jsonPath("$._links.agencies").exists())
        .andExpect(
            jsonPath(
                "$._links.agencies.href", endsWith("/agencyadmin/agencies?page=1&perPage=20{&q}")));
  }

  @Test
  public void searchAgencies_Should_returnOk_When_requiredPaginationParamsAreGiven()
      throws Exception {
    this.mvc
        .perform(get(AGENCY_SEARCH_PATH).param(PAGE_PARAM, "0").param(PER_PAGE_PARAM, "1"))
        .andExpect(status().isOk());

    Mockito.verify(this.agencyAdminFullResponseDTO, Mockito.times(1))
        .searchAgencies(any(), eq(0), eq(1));
  }

  @Test
  public void getDioceses_Should_returnOk_When_requiredPaginationParamsAreGiven() throws Exception {
    this.mvc
        .perform(get(GET_DIOCESES_PATH).param(PAGE_PARAM, "0").param(PER_PAGE_PARAM, "1"))
        .andExpect(status().isOk());

    Mockito.verify(this.dioceseAdminService, Mockito.times(1)).findAllDioceses(eq(0), eq(1));
  }

  @Test
  public void getDioceses_Should_returnBadRequest_When_requiredPaginationParamsAreMissing()
      throws Exception {
    this.mvc.perform(get(GET_DIOCESES_PATH))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void createAgency_Should_returnCreated_When_AgencyDtoIsGiven() throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setDioceseId(1L);
    agencyDTO.setPostcode(VALID_POSTCODE);
    agencyDTO.setConsultingType(CONSULTING_TYPE_PREGNANCY.getValue());
    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO =
        easyRandom.nextObject(AgencyAdminFullResponseDTO.class);

    when(agencyAdminService.saveAgency(agencyDTO)).thenReturn(agencyAdminFullResponseDTO);

    this.mvc
        .perform(
            post(CREATE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(agencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isCreated());
  }

  @Test
  public void createAgency_Should_ReturnBadRequest_WhenAgencyDtoIsMissing() throws Exception {
    this.mvc
        .perform(post(CREATE_AGENCY_PATH).content("").contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void createAgency_Should_ReturnBadRequest_WhenAgencyConsultingType_IsInvalid()
      throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setDioceseId(1L);
    agencyDTO.setPostcode(VALID_POSTCODE);
    agencyDTO.setConsultingType(CONSULTING_TYPE_PREGNANCY.getValue());
    doThrow(new InvalidConsultingTypeException()).when(agencyValidator).validate(agencyDTO);
    this.mvc
        .perform(
            post(CREATE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(agencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest())
        .andExpect(header().string("X-Reason", "INVALID_CONSULTING_TYPE"));

  }

  @Test
  public void createAgency_Should_ReturnBadRequest_WhenAgencyDiocese_IsInvalid()
      throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setDioceseId(1L);
    agencyDTO.setPostcode(VALID_POSTCODE);
    agencyDTO.setConsultingType(CONSULTING_TYPE_PREGNANCY.getValue());
    doThrow(new InvalidDioceseException()).when(agencyValidator).validate(agencyDTO);
    this.mvc
        .perform(
            post(CREATE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(agencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest())
        .andExpect(header().string("X-Reason", "INVALID_DIOCESE"));

  }

  @Test
  public void createAgency_Should_ReturnBadRequest_WhenAgencyPostcode_IsInvalid()
      throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setDioceseId(1L);
    agencyDTO.setPostcode(VALID_POSTCODE);
    agencyDTO.setConsultingType(CONSULTING_TYPE_PREGNANCY.getValue());
    doThrow(new InvalidPostcodeException()).when(agencyValidator).validate(agencyDTO);
    this.mvc
        .perform(
            post(CREATE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(agencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest())
        .andExpect(header().string("X-Reason", "INVALID_POSTCODE"));

  }

  @Test
  public void getAgencyPostCodeRanges_Should_returnOk_When_requiredPaginationParamsAreGiven()
      throws Exception {
    this.mvc.perform(get(GET_AGENCY_POSTCODERANGE_PATH)
        .param(PAGE_PARAM, "0")
        .param(PER_PAGE_PARAM, "1"))
        .andExpect(status().isOk());

    Mockito.verify(this.agencyPostCodeRangeAdminService, Mockito.times(1))
        .findPostcodeRangesForAgency(eq(0), eq(1), eq(1L));
  }

  @Test
  public void getAgencyPostCodeRanges_Should_returnBadRequest_When_requiredPaginationParamsAreMissing()
      throws Exception {
    this.mvc.perform(get(GET_AGENCY_POSTCODERANGE_PATH))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void deleteAgencyPostCodeRange_Should_returnOk_When_requiredPaginationParamsAreGiven()
      throws Exception {
    this.mvc.perform(delete(DELETE_AGENCY_POSTCODERANGE_PATH + "1"))
        .andExpect(status().isOk());

    Mockito.verify(this.agencyPostCodeRangeAdminService, Mockito.times(1))
        .deleteAgencyPostcodeRange(eq(1L));
  }

  @Test
  public void deleteAgencyPostCodeRange_Should_returnBadRequest_When_requiredParamIsWrong()
      throws Exception {
    this.mvc.perform(delete(DELETE_AGENCY_POSTCODERANGE_PATH + "aaa"))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void updateAgency_Should_returnOk_When_UpdateAgencyDtoIsGiven() throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setPostcode(VALID_POSTCODE);
    updateAgencyDTO.setDioceseId(1L);
    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO =
        easyRandom.nextObject(AgencyAdminFullResponseDTO.class);

    when(agencyAdminService.updateAgency(AGENCY_ID, updateAgencyDTO))
        .thenReturn(agencyAdminFullResponseDTO);

    this.mvc
        .perform(
            put(UPDATE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(updateAgencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
  }

  @Test
  public void updateAgency_Should_ReturnBadRequest_WhenUpdateAgencyDtoIsMissing() throws Exception {
    this.mvc
        .perform(put(UPDATE_AGENCY_PATH).content("").contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void updateAgency_Should_ReturnBadRequest_WhenAgencyOfflineStatus_IsInvalid()
      throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setPostcode(VALID_POSTCODE);
    updateAgencyDTO.setDioceseId(1L);
    doThrow(new InvalidOfflineStatusException()).when(agencyValidator)
        .validate(1L, updateAgencyDTO);
    this.mvc
        .perform(
            put(UPDATE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(updateAgencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest())
        .andExpect(header().string("X-Reason", "INVALID_OFFLINE_STATUS"));

  }

  @Test
  public void updateAgency_Should_ReturnBadRequest_WhenAgencyDiocese_IsInvalid()
      throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setPostcode(VALID_POSTCODE);
    updateAgencyDTO.setDioceseId(1L);
    doThrow(new InvalidDioceseException()).when(agencyValidator).validate(1L, updateAgencyDTO);
    this.mvc
        .perform(
            put(UPDATE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(updateAgencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest())
        .andExpect(header().string("X-Reason", "INVALID_DIOCESE"));

  }

  @Test
  public void updateAgency_Should_ReturnBadRequest_WhenAgencyPostcode_IsInvalid()
      throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setPostcode(VALID_POSTCODE);
    updateAgencyDTO.setDioceseId(1L);
    doThrow(new InvalidPostcodeException()).when(agencyValidator).validate(1L, updateAgencyDTO);
    this.mvc
        .perform(
            put(UPDATE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(updateAgencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest())
        .andExpect(header().string("X-Reason", "INVALID_POSTCODE"));

  }

  @Test
  public void createAgencyPostcodeRange_Should_returnCreated_When_AllParamsAreValid()
      throws Exception {
    PostCodeRangeDTO postCodeRangeDTO = new PostCodeRangeDTO()
        .postcodeFrom(VALID_POSTCODE)
        .postcodeTo(VALID_POSTCODE_2);

    this.mvc.perform(post(CREATE_AGENCY_POSTCODE_RANGE_PATH)
        .content(new ObjectMapper().writeValueAsString(postCodeRangeDTO))
        .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isCreated());
  }

  @Test
  public void createAgencyPostcodeRange_Should_returnBadRequest_When_PostCodeIsInvalid()
      throws Exception {
    PostCodeRangeDTO postCodeRangeDTO = new PostCodeRangeDTO()
        .postcodeFrom(INVALID_POSTCODE)
        .postcodeTo(VALID_POSTCODE_2);

    this.mvc.perform(post(CREATE_AGENCY_POSTCODE_RANGE_PATH)
        .content(new ObjectMapper().writeValueAsString(postCodeRangeDTO))
        .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void updateAgencyPostcodeRange_Should_returnOk_When_AllParamsAreValid()
      throws Exception {
    PostCodeRangeDTO postCodeRangeDTO = new PostCodeRangeDTO()
        .postcodeFrom(VALID_POSTCODE)
        .postcodeTo(VALID_POSTCODE_2);

    this.mvc.perform(put(UPDATE_AGENCY_POSTCODE_RANGE_PATH)
        .content(new ObjectMapper().writeValueAsString(postCodeRangeDTO))
        .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
  }

  @Test
  public void updateAgencyPostcodeRange_Should_returnBadRequest_When_PostCodeIsInvalid()
      throws Exception {
    PostCodeRangeDTO postCodeRangeDTO = new PostCodeRangeDTO()
        .postcodeFrom(INVALID_POSTCODE)
        .postcodeTo(VALID_POSTCODE_2);

    this.mvc.perform(put(UPDATE_AGENCY_POSTCODE_RANGE_PATH)
        .content(new ObjectMapper().writeValueAsString(postCodeRangeDTO))
        .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }
}
