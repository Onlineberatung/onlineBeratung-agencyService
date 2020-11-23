package de.caritas.cob.agencyservice.api.admin.controller;

import static org.hamcrest.Matchers.endsWith;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminSearchService;
import de.caritas.cob.agencyservice.api.admin.service.DioceseAdminService;
import de.caritas.cob.agencyservice.api.authorization.RoleAuthorizationAuthorityMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.hateoas.client.LinkDiscoverers;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

@RunWith(SpringRunner.class)
@WebMvcTest(AgencyAdminController.class)
@AutoConfigureMockMvc(addFilters = false)
public class AgencyAdminControllerTest {

  private static final String ROOT_PATH = "/agencyadmin";
  private static final String AGENCY_SEARCH_PATH = ROOT_PATH + "/agencies";
  private static final String GET_DIOCESES_PATH = ROOT_PATH + "/dioceses";
  private static final String PAGE_PARAM = "page";
  private static final String PER_PAGE_PARAM = "perPage";

  @Autowired
  private MockMvc mvc;

  @MockBean
  private AgencyAdminSearchService agencyAdminSearchService;

  @MockBean
  private DioceseAdminService dioceseAdminService;

  @MockBean
  private LinkDiscoverers linkDiscoverers;

  @MockBean
  private RoleAuthorizationAuthorityMapper roleAuthorizationAuthorityMapper;

  @Test
  public void searchAgencies_Should_returnBadRequest_When_requiredPaginationParamsAreMissing()
      throws Exception {
    this.mvc.perform(get(AGENCY_SEARCH_PATH))
        .andExpect(status().isBadRequest());
  }

  @Test
  public void getRoot_Should_returnExpectedRootDTO()
      throws Exception {
    this.mvc.perform(get(ROOT_PATH))
        .andExpect(status().isOk())
        .andExpect(jsonPath("$._links").exists())
        .andExpect(jsonPath("$._links.self").exists())
        .andExpect(jsonPath("$._links.self.href", endsWith("/agencyadmin")))
        .andExpect(jsonPath("$._links.agencies").exists())
        .andExpect(
            jsonPath("$._links.agencies.href", endsWith("/agencyadmin/agencies?page=1&perPage=20{&q}")));
  }

  @Test
  public void searchAgencies_Should_returnOk_When_requiredPaginationParamsAreGiven()
      throws Exception {
    this.mvc.perform(get(AGENCY_SEARCH_PATH)
        .param(PAGE_PARAM, "0")
        .param(PER_PAGE_PARAM, "1"))
        .andExpect(status().isOk());

    Mockito.verify(this.agencyAdminSearchService, Mockito.times(1))
        .searchAgencies(any(), eq(0), eq(1));
  }

  @Test
  public void getDioceses_Should_returnOk_When_requiredPaginationParamsAreGiven()
      throws Exception {
    this.mvc.perform(get(GET_DIOCESES_PATH)
        .param(PAGE_PARAM, "0")
        .param(PER_PAGE_PARAM, "1"))
        .andExpect(status().isOk());

    Mockito.verify(this.dioceseAdminService, Mockito.times(1))
        .findAllDioceses(eq(0), eq(1));
  }

}
