package de.caritas.cob.agencyservice.api.admin.controller;

import static de.caritas.cob.agencyservice.api.admin.controller.AgencyAdminControllerTest.AGENCY_SEARCH_PATH;
import static de.caritas.cob.agencyservice.api.admin.controller.AgencyAdminControllerTest.GET_AGENCY_POSTCODERANGE_PATH;
import static de.caritas.cob.agencyservice.api.admin.controller.AgencyAdminControllerTest.GET_DIOCESES_PATH;
import static de.caritas.cob.agencyservice.api.admin.controller.AgencyAdminControllerTest.PAGE_PARAM;
import static de.caritas.cob.agencyservice.api.admin.controller.AgencyAdminControllerTest.PER_PAGE_PARAM;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import de.caritas.cob.agencyservice.api.admin.service.DioceseAdminService;
import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyAdminSearchService;
import de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.AgencyPostCodeRangeAdminService;
import javax.servlet.http.Cookie;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
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
  private AgencyAdminSearchService agencyAdminSearchService;

  @MockBean
  private AgencyPostCodeRangeAdminService agencyPostCodeRangeAdminService;

  @MockBean
  private DioceseAdminService dioceseAdminService;

  @Test
  public void searchAgencies_Should_ReturnForbiddenAndCallNoMethods_WhenNoCsrfTokens()
      throws Exception {

    mvc.perform(get(AGENCY_SEARCH_PATH))
        .andExpect(status().isForbidden());

    verifyNoMoreInteractions(this.agencyAdminSearchService);
  }

  @Test
  public void searchAgencies_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(get(AGENCY_SEARCH_PATH)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyAdminSearchService);
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

    verify(this.agencyAdminSearchService, times(1)).searchAgencies(any(), anyInt(), any());
  }

  @Test
  public void getDioceses_Should_ReturnForbiddenAndCallNoMethods_WhenNoCsrfTokens()
      throws Exception {

    mvc.perform(get(GET_DIOCESES_PATH))
        .andExpect(status().isForbidden());

    verifyNoMoreInteractions(this.dioceseAdminService);
  }

  @Test
  public void getDioceses_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(get(GET_DIOCESES_PATH)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.dioceseAdminService);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void getDioceses_Should_ReturnOkAndCallDioceseAdminService_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(get(GET_DIOCESES_PATH)
        .param(PAGE_PARAM, "0")
        .param(PER_PAGE_PARAM, "1")
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk());

    verify(this.dioceseAdminService, times(1)).findAllDioceses(anyInt(), anyInt());
  }

  @Test
  public void getAgencyPostCodeRanges_Should_ReturnForbiddenAndCallNoMethods_WhenNoCsrfTokens()
      throws Exception {

    mvc.perform(get(GET_AGENCY_POSTCODERANGE_PATH))
        .andExpect(status().isForbidden());

    verifyNoMoreInteractions(this.agencyPostCodeRangeAdminService);
  }

  @Test
  public void getAgencyPostCodeRanges_Should_ReturnUnauthorizedAndCallNoMethods_When_noKeycloakAuthorizationIsPresent()
      throws Exception {

    mvc.perform(get(GET_AGENCY_POSTCODERANGE_PATH)
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isUnauthorized());

    verifyNoMoreInteractions(this.agencyPostCodeRangeAdminService);
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  public void getAgencyPostCodeRanges_Should_ReturnOkAndCallDioceseAdminService_When_agencyAdminAuthority()
      throws Exception {

    mvc.perform(get(GET_AGENCY_POSTCODERANGE_PATH)
        .param(PAGE_PARAM, "0")
        .param(PER_PAGE_PARAM, "1")
        .cookie(CSRF_COOKIE)
        .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk());

    verify(this.agencyPostCodeRangeAdminService, times(1)).findPostCodeRangesForAgency(anyInt(),
        anyInt(), anyLong());
  }

}
