package de.caritas.cob.agencyservice.api.controller;


import static javax.ws.rs.core.MediaType.APPLICATION_JSON;
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
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.service.TopicService;
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
@TestPropertySource(properties = "feature.topics.enabled=true")
@AutoConfigureMockMvc(addFilters = false)
@Transactional
class AgencyAdminControllerWithTopicsIT {

  static final String PATH_GET_AGENCY_BY_ID = "/agencyadmin/agencies/1";

  private MockMvc mockMvc;

  @MockBean
  private ConsultingTypeManager consultingTypeManager;

  @MockBean
  private TopicService topicService;

  @Autowired
  private WebApplicationContext context;

  @MockBean
  private AuthenticatedUser authenticatedUser;

  @MockBean
  private TenantService tenantService;

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
  void getAgencyById_Should_returnAgencyDataWithTopics() throws Exception {
    // given
    de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO topic1 = createTopicServiceTopicDTO(
        0L, "Topic 1", "Topic 1 description", "T1Identifier", true);
    de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO topic2 = createTopicServiceTopicDTO(
        1L, "Topic 2", "Topic 2 description", "T2Identifier", true);
    when(topicService.getAllTopics()).thenReturn(List.of(topic1, topic2));

    // when, then
    mockMvc.perform(get(PATH_GET_AGENCY_BY_ID)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.id").value(1))
        .andExpect(jsonPath("_embedded.topics").exists())
        .andExpect(jsonPath("_embedded.topics.length()").value(2))
        .andExpect(jsonPath("_embedded.topics.[0].id").value(0))
        .andExpect(jsonPath("_embedded.topics.[0].name").value("Topic 1"))
        .andExpect(jsonPath("_embedded.topics.[0].description").value("Topic 1 description"))
        .andExpect(jsonPath("_embedded.topics.[0].internalIdentifier").value("T1Identifier"))
        .andExpect(jsonPath("_embedded.topics.[0].status").value("ACTIVE"))
        .andExpect(jsonPath("_embedded.topics.[1].id").value(1))
        .andExpect(jsonPath("_embedded.topics.[1].name").value("Topic 2"))
        .andExpect(jsonPath("_embedded.topics.[1].description").value("Topic 2 description"))
        .andExpect(jsonPath("_embedded.topics.[1].internalIdentifier").value("T2Identifier"))
        .andExpect(jsonPath("_embedded.topics.[1].status").value("ACTIVE"));
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  void createAgency_Should_returnStatusCreated_When_calledWithValidCreateParamsAndValidAuthority()
      throws Exception {
    // given
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(new ExtendedConsultingTypeResponseDTO());

    de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO topic1 = createTopicServiceTopicDTO(
        1L, "Topic 1", "Topic 1 description", "T1Identifier", true);
    de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO topic2 = createTopicServiceTopicDTO(
        2L, "Topic 2", "Topic 2 description", "T2Identifier", true);
    when(topicService.getAllTopics()).thenReturn(List.of(topic1, topic2));

    AgencyDTO agencyDTO = new AgencyDTO()
        .topicIds(List.of(1L, 2L))
        .name("Test name")
        .description("Test description")
        .postcode("12345")
        .city("Test city")
        .teamAgency(true)
        .consultingType(0)
        .url("https://www.test.de")
        .external(true);
    String payload = JsonConverter.convertToJson(agencyDTO);

    // when, then
    mockMvc.perform(post(PathConstants.CREATE_AGENCY_PATH)
            .contentType(APPLICATION_JSON)
            .content(payload))
        .andExpect(status().isCreated())
        .andExpect(jsonPath("_embedded.id").exists())
        .andExpect(jsonPath("_embedded.name").value("Test name"))
        .andExpect(jsonPath("_embedded.topics").exists())
        .andExpect(jsonPath("_embedded.topics.length()").value(2))
        .andExpect(jsonPath("_embedded.topics.[0].id").value(1))
        .andExpect(jsonPath("_embedded.topics.[0].name").value("Topic 1"))
        .andExpect(jsonPath("_embedded.topics.[0].description").value("Topic 1 description"))
        .andExpect(jsonPath("_embedded.topics.[0].internalIdentifier").value("T1Identifier"))
        .andExpect(jsonPath("_embedded.topics.[0].status").value("ACTIVE"))
        .andExpect(jsonPath("_embedded.topics.[1].id").value(2))
        .andExpect(jsonPath("_embedded.topics.[1].name").value("Topic 2"))
        .andExpect(jsonPath("_embedded.topics.[1].description").value("Topic 2 description"))
        .andExpect(jsonPath("_embedded.topics.[1].internalIdentifier").value("T2Identifier"))
        .andExpect(jsonPath("_embedded.topics.[1].status").value("ACTIVE"));
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  void updateAgency_Should_returnStatusOk_When_calledWithValidCreateParamsAndValidAuthority()
      throws Exception {
    // given
    var extendedConsultingTypeResponseDTO = new ExtendedConsultingTypeResponseDTO();
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(extendedConsultingTypeResponseDTO);

    de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO topic2 = createTopicServiceTopicDTO(
        2L, "Topic 2", "Topic 2 description", "T2Identifier", true);
    de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO topic3 = createTopicServiceTopicDTO(
        3L, "Topic 3", "Topic 3 description", "T3Identifier", true);
    when(topicService.getAllTopics()).thenReturn(List.of(topic2, topic3));

    UpdateAgencyDTO agencyDTO = new UpdateAgencyDTO()
        .topicIds(List.of(2L, 3L))
        .name("Test update name")
        .description("Test update description")
        .offline(true)
        .external(false);
    String payload = JsonConverter.convertToJson(agencyDTO);

    // when, then
    mockMvc.perform(put(PathConstants.UPDATE_DELETE_AGENCY_PATH)
            .contentType(APPLICATION_JSON)
            .content(payload))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.id").value(1))
        .andExpect(jsonPath("_embedded.name").value("Test update name"))
        .andExpect(jsonPath("_embedded.topics.[0].id").value(2))
        .andExpect(jsonPath("_embedded.topics.[0].name").value("Topic 2"))
        .andExpect(jsonPath("_embedded.topics.[0].description").value("Topic 2 description"))
        .andExpect(jsonPath("_embedded.topics.[0].internalIdentifier").value("T2Identifier"))
        .andExpect(jsonPath("_embedded.topics.[0].status").value("ACTIVE"))
        .andExpect(jsonPath("_embedded.topics.[1].id").value(3))
        .andExpect(jsonPath("_embedded.topics.[1].name").value("Topic 3"))
        .andExpect(jsonPath("_embedded.topics.[1].description").value("Topic 3 description"))
        .andExpect(jsonPath("_embedded.topics.[1].internalIdentifier").value("T3Identifier"))
        .andExpect(jsonPath("_embedded.topics.[1].status").value("ACTIVE"));
  }

  private de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO createTopicServiceTopicDTO(
      long id, String name, String description, String internalIdentifier, Boolean active) {
    return new de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO().id(
            id).name(name).description(description).internalIdentifier(internalIdentifier)
        .status(active ? "ACTIVE" : "INACTIVE");
  }
}
