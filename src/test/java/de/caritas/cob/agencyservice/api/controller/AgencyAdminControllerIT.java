package de.caritas.cob.agencyservice.api.controller;


import static org.powermock.reflect.Whitebox.setInternalState;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.authorization.RoleAuthorizationAuthorityMapper;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import de.caritas.cob.agencyservice.api.service.LogService;
import org.junit.Before;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.hateoas.client.LinkDiscoverers;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("testing")
@AutoConfigureTestDatabase
@TestPropertySource(properties = "spring.profiles.active=testing")
@TestPropertySource(properties = "feature.topics.enabled=true")
// TODO https://serviceticket.virtual-identity.com/browse/VIC-959"
class AgencyAdminControllerIT {

  static final String PATH_GET_AGENCY_BY_ID = "/agencyadmin/agencies/1";

  @Autowired
  private MockMvc mvc;

  @MockBean
  private AgencyAdminService agencyAdminService;

  @MockBean
  private LinkDiscoverers linkDiscoverers;

  @MockBean
  private RoleAuthorizationAuthorityMapper roleAuthorizationAuthorityMapper;

  @MockBean
  private AgencyService agencyService;

  @Test
  @Disabled("TODO Patric https://serviceticket.virtual-identity.com/browse/VIC-959")
  void getAgencyById_Should_ReturnAgencyData() throws Exception {
    mvc.perform(
        get(PATH_GET_AGENCY_BY_ID)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk());
  }


}
