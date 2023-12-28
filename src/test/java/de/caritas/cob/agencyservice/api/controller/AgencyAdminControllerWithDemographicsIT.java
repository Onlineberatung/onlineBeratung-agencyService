package de.caritas.cob.agencyservice.api.controller;


import static javax.ws.rs.core.MediaType.APPLICATION_JSON;
import static org.hamcrest.Matchers.contains;
import static org.mockito.Mockito.anyInt;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import de.caritas.cob.agencyservice.api.service.TenantService;
import de.caritas.cob.agencyservice.api.util.AuthenticatedUser;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.DemographicsDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Gender;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.api.util.JsonConverter;
import de.caritas.cob.agencyservice.testHelper.PathConstants;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@SpringBootTest
@ActiveProfiles("testing")
@TestPropertySource(properties = "feature.demographics.enabled=true")
@AutoConfigureMockMvc(addFilters = false)
@Transactional
class AgencyAdminControllerWithDemographicsIT {

  static final String PATH_GET_AGENCY_BY_ID = "/agencyadmin/agencies/1736";

  private MockMvc mockMvc;

  @MockBean
  private ConsultingTypeManager consultingTypeManager;

  @Autowired
  private WebApplicationContext context;

  @MockBean
  AuthenticatedUser authenticatedUser;

  @MockBean
  TenantService tenantService;

  @BeforeEach
  public void setup() {
    TenantContext.clear();
    mockMvc = MockMvcBuilders
        .webAppContextSetup(context)
        .apply(springSecurity())
        .build();
    when(tenantService.getRestrictedTenantDataByTenantId(Mockito.any()))
        .thenReturn(new de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO().settings(new de.caritas.cob.agencyservice.tenantservice.generated.web.model.Settings().featureCentralDataProtectionTemplateEnabled(false)));

  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  void getAgencyById_Should_ReturnAgencyWithDemographicsData() throws Exception {
    mockMvc.perform(get(PATH_GET_AGENCY_BY_ID)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.id").value(1736))
        .andExpect(jsonPath("_embedded.demographics.ageTo").exists())
        .andExpect(jsonPath("_embedded.demographics.ageFrom").exists())
        .andExpect(jsonPath("_embedded.demographics.genders").exists());
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  void createAgency_Should_returnStatusCreated_When_calledWithValidCreateParamsAndValidAuthority()
      throws Exception {
    // given
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(new ExtendedConsultingTypeResponseDTO());

    AgencyDTO agencyDTO = new AgencyDTO()
        .name("Test name")
        .description("Test description")
        .teamAgency(true)
        .consultingType(0)
        .external(true)
        .demographics(new DemographicsDTO().ageFrom(10).ageTo(20)
            .genders(List.of(Gender.MALE.name(), Gender.FEMALE.name(), Gender.DIVERSE.name())));
    String payload = JsonConverter.convertToJson(agencyDTO);

    // when, then
    mockMvc.perform(post(PathConstants.CREATE_AGENCY_PATH)
            .contentType(APPLICATION_JSON)
            .content(payload))
        .andExpect(status().isCreated())
        .andExpect(jsonPath("_embedded.id").exists())
        .andExpect(jsonPath("_embedded.name").value("Test name"))
        .andExpect(jsonPath("_embedded.demographics.ageFrom").value(10))
        .andExpect(jsonPath("_embedded.demographics.ageTo").value(20))
        .andExpect(jsonPath("_embedded.demographics.genders").value(
            contains("MALE", "FEMALE", "DIVERSE")));
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  void updateAgency_Should_returnStatusOk_When_calledWithValidCreateParamsAndValidAuthority()
      throws Exception {
    // given
    var extendedConsultingTypeResponseDTO = new ExtendedConsultingTypeResponseDTO();
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(extendedConsultingTypeResponseDTO);

    UpdateAgencyDTO agencyDTO = new UpdateAgencyDTO()
        .name("Test update name")
        .description("Test update description")
        .external(true)
        .offline(true)
        .demographics(new DemographicsDTO().ageFrom(11).ageTo(21)
            .genders(List.of(Gender.NOT_PROVIDED.name())));
    String payload = JsonConverter.convertToJson(agencyDTO);

    // when, then
    mockMvc.perform(put(PathConstants.UPDATE_DELETE_AGENCY_PATH)
            .contentType(APPLICATION_JSON)
            .content(payload))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.id").value(1))
        .andExpect(jsonPath("_embedded.name").value("Test update name"))
        .andExpect(jsonPath("_embedded.demographics.ageFrom").value(11))
        .andExpect(jsonPath("_embedded.demographics.ageTo").value(21))
        .andExpect(jsonPath("_embedded.demographics.genders").value(
            contains("NOT_PROVIDED")));
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  void updateAgency_Should_returnStatusBadRequest_When_calledWithMissingDemographicsDataAndDemographicsFeatureIsOn()
      throws Exception {
    // given
    var extendedConsultingTypeResponseDTO = new ExtendedConsultingTypeResponseDTO();
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(extendedConsultingTypeResponseDTO);

    UpdateAgencyDTO agencyDTO = new UpdateAgencyDTO()
        .name("Test update name")
        .description("Test update description")
        .external(true)
        .offline(true)
        .demographics(new DemographicsDTO());
    String payload = JsonConverter.convertToJson(agencyDTO);

    // when, then
    mockMvc.perform(put(PathConstants.UPDATE_DELETE_AGENCY_PATH)
            .contentType(APPLICATION_JSON)
            .content(payload))
        .andExpect(status().isBadRequest());
  }
}


