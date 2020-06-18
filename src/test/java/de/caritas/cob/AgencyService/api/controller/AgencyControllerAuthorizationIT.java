package de.caritas.cob.AgencyService.api.controller;

import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import de.caritas.cob.AgencyService.api.service.AgencyService;

@RunWith(SpringRunner.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@SpringBootTest
@AutoConfigureMockMvc
public class AgencyControllerAuthorizationIT {

  private final String PATH_GET_FULL_LIST_OF_AGENCIES = "/agencies";
  private final String PATH_GET_AGENCY_DATA = "/agencies/data/100";
  private final String ROLE_NONE = "none";

  @Autowired
  private MockMvc mvc;

  @MockBean
  private AgencyService agencyService;

  /**
   * GET on /agencies
   *
   */

  @Test
  @WithMockUser(roles = {ROLE_NONE})
  public void getFullListOfAgencies_Should_ReturnForbiddenAndCallNoMethods_WhenNoCsrfTokens()
      throws Exception {

    mvc.perform(get(PATH_GET_FULL_LIST_OF_AGENCIES).contentType(MediaType.APPLICATION_JSON)
        .accept(MediaType.APPLICATION_JSON)).andExpect(status().isForbidden());

    verifyNoMoreInteractions(agencyService);
  }

  /**
   * GET ON /agencies/data/{agencyId}
   * 
   */

  @Test
  @WithMockUser(roles = {ROLE_NONE})
  public void getAgency_Should_ReturnForbiddenAndCallNoMethods_WhenNoCsrfTokens() throws Exception {

    mvc.perform(get(PATH_GET_AGENCY_DATA).contentType(MediaType.APPLICATION_JSON)
        .accept(MediaType.APPLICATION_JSON)).andExpect(status().isForbidden());

    verifyNoMoreInteractions(agencyService);
  }
}
