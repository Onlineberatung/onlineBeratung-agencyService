package de.caritas.cob.agencyservice.api.admin.controller;

import static de.caritas.cob.agencyservice.testHelper.PathConstants.AGENCY_POSTCODE_RANGE_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.AGENCY_SEARCH_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.CHANGE_AGENCY_TYPE_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.CREATE_AGENCY_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.GET_AGENCY_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.PAGE_PARAM;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.PER_PAGE_PARAM;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.ROOT_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.UPDATE_DELETE_AGENCY_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.UPDATE_DELETE_AGENCY_PATH_INVALID_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_PREGNANCY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE;
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
import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyAdminSearchService;
import de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.AgencyPostcodeRangeAdminService;
import de.caritas.cob.agencyservice.api.admin.validation.AgencyValidator;
import de.caritas.cob.agencyservice.api.authorization.RoleAuthorizationAuthorityMapper;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO;
import de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO.AgencyTypeEnum;
import de.caritas.cob.agencyservice.api.model.DemographicsDTO;
import de.caritas.cob.agencyservice.api.model.PostcodeRangeDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.service.TenantHeaderSupplier;
import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.config.apiclient.UserAdminServiceApiControllerFactory;
import de.caritas.cob.agencyservice.config.security.AuthorisationService;
import de.caritas.cob.agencyservice.config.security.JwtAuthConverter;
import de.caritas.cob.agencyservice.config.security.JwtAuthConverterProperties;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.hateoas.client.LinkDiscoverers;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

@RunWith(SpringRunner.class)
@SpringBootTest(
    webEnvironment = SpringBootTest.WebEnvironment.MOCK,
    classes = AgencyServiceApplication.class)
@AutoConfigureMockMvc(addFilters = false)
@TestPropertySource(
    locations = "classpath:application-testing.properties")
public class AgencyAdminControllerTest {

  public static final int AGE_FROM = 25;
  public static final int AGE_TO = 100;
  @Autowired
  private MockMvc mvc;
  @MockBean
  private AgencyAdminService agencyAdminService;
  @MockBean
  private AgencyValidator agencyValidator;
  @MockBean
  private AgencyAdminSearchService agencyAdminFullResponseDTO;
  @MockBean
  private AgencyPostcodeRangeAdminService agencyPostCodeRangeAdminService;
  @MockBean
  private LinkDiscoverers linkDiscoverers;
  @MockBean
  private RoleAuthorizationAuthorityMapper roleAuthorizationAuthorityMapper;

  @MockBean
  private JwtAuthConverter jwtAuthConverter;

  @MockBean
  private AuthorisationService authorisationService;

  @MockBean
  private JwtAuthConverterProperties jwtAuthConverterProperties;

  @MockBean
  private UserAdminServiceApiControllerFactory adminServiceApiControllerFactory;

  @MockBean
  private SecurityHeaderSupplier securityHeaderSupplier;

  @MockBean
  private TenantHeaderSupplier tenantHeaderSupplier;

  @MockBean
  private ConsultingTypeManager consultingTypeManager;


  @MockBean
  private AgencyRepository agencyRepository;


  @Test
  public void searchAgencies_Should_returnBadRequest_When_requiredPaginationParamsAreMissing()
      throws Exception {
    this.mvc.perform(get(AGENCY_SEARCH_PATH)).andExpect(status().isBadRequest());
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
        .searchAgencies(any(), eq(0), eq(1), any());
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void createAgency_Should_returnCreated_When_AgencyDtoIsGiven() throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setPostcode(VALID_POSTCODE);
    agencyDTO.setConsultingType(CONSULTING_TYPE_PREGNANCY);
    setValidDemographics(agencyDTO.getDemographics());
    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO =
        easyRandom.nextObject(AgencyAdminFullResponseDTO.class);

    when(agencyAdminService.createAgency(agencyDTO)).thenReturn(agencyAdminFullResponseDTO);

    this.mvc
        .perform(
            post(CREATE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(agencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isCreated());
  }

  private void setValidDemographics(DemographicsDTO demographics) {
    demographics.setAgeFrom(AGE_FROM);
    demographics.setAgeTo(AGE_TO);
  }

  @Test
  public void createAgency_Should_ReturnBadRequest_WhenAgencyDtoIsMissing() throws Exception {
    this.mvc
        .perform(post(CREATE_AGENCY_PATH).content("").contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void createAgency_Should_ReturnBadRequest_WhenAgencyConsultingType_IsInvalid()
      throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setPostcode(VALID_POSTCODE);
    agencyDTO.setConsultingType(CONSULTING_TYPE_PREGNANCY);
    setValidDemographics(agencyDTO.getDemographics());
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
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void createAgency_Should_ReturnBadRequest_WhenAgencyPostcode_IsInvalid() throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setPostcode(VALID_POSTCODE);
    agencyDTO.setConsultingType(CONSULTING_TYPE_PREGNANCY);
    setValidDemographics(agencyDTO.getDemographics());
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
  public void getAgencyPostCodeRanges_Should_returnOk()
      throws Exception {
    this.mvc
        .perform(get(AGENCY_POSTCODE_RANGE_PATH))
        .andExpect(status().isOk());

    Mockito.verify(this.agencyPostCodeRangeAdminService, Mockito.times(1))
        .findPostcodeRangesForAgency(1L);
  }

  @Test
  public void deleteAgencyPostCodeRange_Should_returnOk()
      throws Exception {
    this.mvc.perform(delete(AGENCY_POSTCODE_RANGE_PATH))
        .andExpect(status().isOk());

    Mockito.verify(this.agencyPostCodeRangeAdminService, Mockito.times(1))
        .deleteAgencyPostcodeRange(1L);
  }

  @Test
  public void deleteAgencyPostCodeRange_Should_returnBadRequest_When_requiredParamIsWrong()
      throws Exception {
    this.mvc
        .perform(delete(AGENCY_POSTCODE_RANGE_PATH + "aaa"))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void updateAgency_Should_returnOk_When_UpdateAgencyDtoIsGiven() throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setPostcode(VALID_POSTCODE);
    updateAgencyDTO.setConsultingType(CONSULTING_TYPE_PREGNANCY);
    setValidDemographics(updateAgencyDTO.getDemographics());
    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO =
        easyRandom.nextObject(AgencyAdminFullResponseDTO.class);

    when(agencyAdminService.updateAgency(AGENCY_ID, updateAgencyDTO))
        .thenReturn(agencyAdminFullResponseDTO);

    this.mvc
        .perform(
            put(UPDATE_DELETE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(updateAgencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
  }

  @Test
  public void updateAgency_Should_ReturnBadRequest_WhenUpdateAgencyDtoIsMissing() throws Exception {
    this.mvc
        .perform(put(UPDATE_DELETE_AGENCY_PATH).content("").contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void updateAgency_Should_ReturnBadRequest_WhenAgencyOfflineStatus_IsInvalid()
      throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setPostcode(VALID_POSTCODE);
    updateAgencyDTO.setName("name");
    updateAgencyDTO.setConsultingType(CONSULTING_TYPE_PREGNANCY);
    setValidDemographics(updateAgencyDTO.getDemographics());
    doThrow(new InvalidOfflineStatusException())
        .when(agencyValidator)
        .validate(1L, updateAgencyDTO);
    this.mvc
        .perform(
            put(UPDATE_DELETE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(updateAgencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest())
        .andExpect(header().string("X-Reason", "INVALID_OFFLINE_STATUS"));
  }

  @Test
  public void updateAgency_Should_ReturnBadRequest_WhenAgencyPostcode_IsInvalid() throws Exception {

    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setPostcode(VALID_POSTCODE);
    updateAgencyDTO.setConsultingType(CONSULTING_TYPE_PREGNANCY);
    setValidDemographics(updateAgencyDTO.getDemographics());
    doThrow(new InvalidPostcodeException()).when(agencyValidator).validate(1L, updateAgencyDTO);
    this.mvc
        .perform(
            put(UPDATE_DELETE_AGENCY_PATH)
                .content(new ObjectMapper().writeValueAsString(updateAgencyDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest())
        .andExpect(header().string("X-Reason", "INVALID_POSTCODE"));
  }

  @Test
  public void createAgencyPostcodeRange_Should_returnCreated_When_AllParamsAreValid()
      throws Exception {
    var postcodeRangeDTO = new PostcodeRangeDTO().postcodeRanges("12345-23456");

    this.mvc
        .perform(
            post(AGENCY_POSTCODE_RANGE_PATH)
                .content(new ObjectMapper().writeValueAsString(postcodeRangeDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isCreated());
  }

  @Test
  public void updateAgencyPostcodeRange_Should_returnOk_When_AllParamsAreValid() throws Exception {
    var postcodeRangeDTO = new PostcodeRangeDTO().postcodeRanges("12345-23456");

    this.mvc
        .perform(
            put(AGENCY_POSTCODE_RANGE_PATH)
                .content(new ObjectMapper().writeValueAsString(postcodeRangeDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
  }

  @Test
  public void changeAgencyType_Should_returnOk_When_AllParamsAreValid() throws Exception {
    var agencyTypeDTO = new AgencyTypeRequestDTO().agencyType(AgencyTypeEnum.TEAM_AGENCY);

    this.mvc
        .perform(
            post(CHANGE_AGENCY_TYPE_PATH)
                .content(new ObjectMapper().writeValueAsString(agencyTypeDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
  }

  @Test
  public void changeAgencyType_Should_returnBadRequest_When_teamAgencyIsNull() throws Exception {
    var agencyTypeDTO = new AgencyTypeRequestDTO().agencyType(null);

    this.mvc
        .perform(
            post(CHANGE_AGENCY_TYPE_PATH)
                .content(new ObjectMapper().writeValueAsString(agencyTypeDTO))
                .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void deleteAgency_Should_returnOk_When_AllParamsAreValid() throws Exception {
    this.mvc
        .perform(delete(UPDATE_DELETE_AGENCY_PATH).contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
  }

  @Test
  public void deleteAgency_Should_returnBadRequest_When_teamAgencyIsInvalid() throws Exception {
    this.mvc
        .perform(
            delete(UPDATE_DELETE_AGENCY_PATH_INVALID_ID).contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void getAgency_Should_returnOk_When_AllParamsAreValid() throws Exception {
    this.mvc
        .perform(get(GET_AGENCY_PATH + "/1").contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
  }

  @Test
  public void getAgency_Should_returnBadRequest_When_agncyIdIsInvalid() throws Exception {
    this.mvc
        .perform(get(GET_AGENCY_PATH + "/ab").contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }
}
