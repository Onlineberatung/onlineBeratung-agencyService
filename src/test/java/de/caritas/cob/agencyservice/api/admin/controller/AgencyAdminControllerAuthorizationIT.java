package de.caritas.cob.agencyservice.api.admin.controller;

import static de.caritas.cob.agencyservice.testHelper.PathConstants.AGENCY_POSTCODE_RANGE_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.AGENCY_SEARCH_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.CHANGE_AGENCY_TYPE_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.CREATE_AGENCY_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.GET_AGENCY_PATH;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.PAGE_PARAM;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.PER_PAGE_PARAM;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.UPDATE_DELETE_AGENCY_PATH;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_AGENCY_DTO;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_AGENCY_UPDATE_DTO;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE_RANGE_DTO;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyAdminSearchService;
import de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.AgencyPostcodeRangeAdminService;
import de.caritas.cob.agencyservice.api.admin.validation.AgencyValidator;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.AgencyTypeRequestDTO;
import de.caritas.cob.agencyservice.api.model.PostcodeRangeDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import jakarta.servlet.http.Cookie;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

@RunWith(SpringRunner.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@SpringBootTest
@AutoConfigureMockMvc
@AutoConfigureTestDatabase(replace = Replace.ANY)
public class AgencyAdminControllerAuthorizationIT {

  private static final String CSRF_HEADER = "csrfHeader";
  private static final String CSRF_VALUE = "test";
  private static final Cookie CSRF_COOKIE = new Cookie("csrfCookie", CSRF_VALUE);

  @Autowired
  private MockMvc mvc;

  @MockBean
  private AgencyAdminSearchService agencyAdminFullResponseDTO;

  @MockBean
  private AgencyPostcodeRangeAdminService agencyPostCodeRangeAdminService;

  @MockBean
  private AgencyAdminService agencyAdminService;

  @MockBean
  private AgencyValidator agencyValidator;

  @Test
  public void searchAgencies_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(get(AGENCY_SEARCH_PATH)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyAdminFullResponseDTO);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void searchAgencies_Should_ReturnOkAndCallAgencyAdminSearchService_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(get(AGENCY_SEARCH_PATH)
        .param(PAGE_PARAM, "0")
        .param(PER_PAGE_PARAM, "1")
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk());

    verify(this.agencyAdminFullResponseDTO, times(1)).searchAgencies(any(), anyInt(), any(), any());
  }

  @Test
  public void getAgencyPostCodeRanges_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(get(AGENCY_POSTCODE_RANGE_PATH)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyPostCodeRangeAdminService);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void getAgencyPostCodeRanges_Should_ReturnOkAndCallAgencyPostCodeRangeAdminService_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(get(AGENCY_POSTCODE_RANGE_PATH)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk());

    verify(this.agencyPostCodeRangeAdminService, times(1)).findPostcodeRangesForAgency(anyLong());
  }

  @Test
  public void createAgency_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(post(CREATE_AGENCY_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyAdminService);
    verifyNoMoreInteractions(this.agencyValidator);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void createAgency_Should_ReturnCreatedAndCallAgencyAdminServiceAndAgencyValidator_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(post(CREATE_AGENCY_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .content(VALID_AGENCY_DTO)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isCreated());

    verify(this.agencyValidator, times(1)).validate(Mockito.any(AgencyDTO.class));
    verify(this.agencyAdminService, times(1)).createAgency(Mockito.any());
  }

  @Test
  public void updateAgency_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(put(UPDATE_DELETE_AGENCY_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyAdminService);
    verifyNoMoreInteractions(this.agencyValidator);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void updateAgency_Should_ReturnOkAndCallAgencyAdminServiceAndAgencyValidator_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(put(UPDATE_DELETE_AGENCY_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .content(VALID_AGENCY_UPDATE_DTO)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk());

    verify(this.agencyValidator, times(1))
        .validate(Mockito.anyLong(), Mockito.any(UpdateAgencyDTO.class));
    verify(this.agencyAdminService, times(1)).updateAgency(Mockito.anyLong(), Mockito.any());
  }

  @Test
  public void deletePostcodeRange_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(delete(AGENCY_POSTCODE_RANGE_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyAdminService);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void deletePostcodeRange_Should_ReturnOKAndCallAgencyAdminServiceAndAgencyValidator_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(delete(AGENCY_POSTCODE_RANGE_PATH + "1")
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk());

    verify(this.agencyPostCodeRangeAdminService, times(1)).deleteAgencyPostcodeRange(any());
  }

  @Test
  public void createAgencyPostcodeRange_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(post(AGENCY_POSTCODE_RANGE_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyPostCodeRangeAdminService);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void createAgencyPostcodeRange_Should_ReturnCreatedAndCallAgencyPostCodeRangeAdminService_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(post(AGENCY_POSTCODE_RANGE_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .content(VALID_POSTCODE_RANGE_DTO)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isCreated());

    verify(this.agencyPostCodeRangeAdminService, times(1))
        .createPostcodeRanges(Mockito.anyLong(), Mockito.any(PostcodeRangeDTO.class));
  }

  @Test
  public void updateAgencyPostcodeRange_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(put(AGENCY_POSTCODE_RANGE_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyPostCodeRangeAdminService);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void updateAgencyPostcodeRange_Should_ReturnOkAndCallAgencyPostCodeRangeAdminService_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(put(AGENCY_POSTCODE_RANGE_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .content(VALID_POSTCODE_RANGE_DTO)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk());

    verify(this.agencyPostCodeRangeAdminService, times(1))
        .updatePostcodeRange(Mockito.anyLong(), Mockito.any(PostcodeRangeDTO.class));
  }

  @Test
  public void changeAgencyType_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(post(CHANGE_AGENCY_TYPE_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyAdminService);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void changeAgencyType_Should_ReturnOkAndCallAgencyAdminService_When_agencyAdminAuthority()
      throws Exception {
    AgencyTypeRequestDTO requestDTO =
        new EasyRandom().nextObject(AgencyTypeRequestDTO.class);

    mvc.perform(post(CHANGE_AGENCY_TYPE_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .content(new ObjectMapper().writeValueAsString(requestDTO))
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk());

    verify(this.agencyAdminService, times(1)).changeAgencyType(1L, requestDTO);
  }

  @Test
  public void deleteAgency_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(delete(UPDATE_DELETE_AGENCY_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyAdminService);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void deleteAgency_Should_ReturnOkAndCallAgencyAdminService_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(delete(UPDATE_DELETE_AGENCY_PATH)
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk());

    verify(this.agencyAdminService, times(1)).deleteAgency(anyLong());
  }

  @Test
  public void getAgency_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(get(GET_AGENCY_PATH + "/1")
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyAdminService);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void getAgency_Should_ReturnOkAndCallAgencyAdminService_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(get(GET_AGENCY_PATH + "/1")
        .contentType(MediaType.APPLICATION_JSON)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk());

    verify(this.agencyAdminService, times(1)).findAgency(anyLong());
  }
}
