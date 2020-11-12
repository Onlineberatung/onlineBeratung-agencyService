package de.caritas.cob.agencyservice.api.admin.controller;

import static org.hamcrest.Matchers.endsWith;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.hateoas.client.LinkDiscoverers;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

@RunWith(SpringRunner.class)
@WebMvcTest(RootController.class)
@AutoConfigureMockMvc(addFilters = false)
public class RootControllerTest {

  private static final String ROOT_PATH = "/";

  @Autowired
  private MockMvc mvc;

  @MockBean
  private LinkDiscoverers linkDiscoverers;

  @Test
  public void getRoot_Should_returnExpectedRootDTO()
      throws Exception {
    this.mvc.perform(get(ROOT_PATH))
        .andExpect(status().isOk())
        .andExpect(jsonPath("$._links").exists())
        .andExpect(jsonPath("$._links.self").exists())
        .andExpect(jsonPath("$._links.self.href", endsWith("/")))
        .andExpect(jsonPath("$._links.agencies").exists())
        .andExpect(
            jsonPath("$._links.agencies.href", endsWith("/admin/agencies?page=1&perPage=20{&q}")));
  }

}
