package de.caritas.cob.agencyservice.api.controller;

import static javax.ws.rs.core.MediaType.APPLICATION_JSON;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.Mockito.anyInt;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO;
import de.caritas.cob.agencyservice.api.util.AuthenticatedUser;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.api.util.JsonConverter;
import de.caritas.cob.agencyservice.testHelper.PathConstants;
import org.jeasy.random.EasyRandom;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@SpringBootTest
@ActiveProfiles("testing")
@AutoConfigureMockMvc(addFilters = false)
@Transactional
class AgencyAdminControllerIT {

  static final String PATH_GET_AGENCY_BY_ID = "/agencyadmin/agencies/1";

  static final String PATH_GET_AGENCY_BY_TENANT_ID = "/agencyadmin/agencies/tenant/1";

  private MockMvc mockMvc;

  @MockBean
  private ConsultingTypeManager consultingTypeManager;

  @Autowired
  private WebApplicationContext context;

  @MockBean
  private AuthenticatedUser authenticatedUser;

  @MockBean
  private UserAdminService userAdminService;

  @Autowired
  private AgencyRepository agencyRepository;

  @BeforeEach
  public void setup() {
    TenantContext.clear();
    mockMvc = MockMvcBuilders
        .webAppContextSetup(context)
        .apply(springSecurity())
        .build();
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  void getAgencyById_Should_ReturnAgencyData() throws Exception {
    mockMvc.perform(get(PATH_GET_AGENCY_BY_ID)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.id").value(1))
        .andExpect(jsonPath("_embedded.name").exists())
        .andExpect(jsonPath("_embedded.city").exists())
        .andExpect(jsonPath("_embedded.consultingType").exists())
        .andExpect(jsonPath("_embedded.description").exists())
        .andExpect(jsonPath("_embedded.postcode").exists())
        .andExpect(jsonPath("_embedded.teamAgency").exists())
        .andExpect(jsonPath("_embedded.url").isEmpty())
        .andExpect(jsonPath("_embedded.external").exists())
        .andExpect(jsonPath("_embedded.offline").exists())
        .andExpect(jsonPath("_embedded.topics").exists())
        .andExpect(jsonPath("_embedded.createDate").exists())
        .andExpect(jsonPath("_embedded.updateDate").exists())
        .andExpect(jsonPath("_embedded.deleteDate").exists());
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void createAgency_Should_returnStatusCreated_When_calledWithValidCreateParamsAndValidAuthority()
      throws Exception {
    // given
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(new ExtendedConsultingTypeResponseDTO());

    AgencyDTO agencyDTO = new AgencyDTO()
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
        .andExpect(jsonPath("_embedded.city").value("Test city"))
        .andExpect(jsonPath("_embedded.consultingType").value(0))
        .andExpect(jsonPath("_embedded.description").value("Test description"))
        .andExpect(jsonPath("_embedded.postcode").value("12345"))
        .andExpect(jsonPath("_embedded.teamAgency").value("true"))
        .andExpect(jsonPath("_embedded.url").value("https://www.test.de"))
        .andExpect(jsonPath("_embedded.external").value("true"))
        .andExpect(jsonPath("_embedded.offline").exists())
        .andExpect(jsonPath("_embedded.topics").exists())
        .andExpect(jsonPath("_embedded.createDate").exists())
        .andExpect(jsonPath("_embedded.updateDate").exists())
        .andExpect(jsonPath("_embedded.deleteDate").exists());
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_RESTRICTED_AGENCY_ADMIN")
  void createAgency_Should_returnAcessDenied_When_tryingToCreateAgencyAsRestrictedAgencyAdmin()
      throws Exception {

    // given
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(new ExtendedConsultingTypeResponseDTO());

    when(authenticatedUser.hasRestrictedAgencyPriviliges()).thenReturn(true);

    AgencyDTO agencyDTO = new AgencyDTO()
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
        .andExpect(status().isForbidden());
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
        .postcode("54321")
        .city("Test update city")
        .consultingType(18)
        .offline(true)
        .url("https://www.test-update.de")
        .external(false);
    String payload = JsonConverter.convertToJson(agencyDTO);

    // when, then
    mockMvc.perform(put(PathConstants.UPDATE_DELETE_AGENCY_PATH)
            .contentType(APPLICATION_JSON)
            .content(payload))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.id").value(1))
        .andExpect(jsonPath("_embedded.name").value("Test update name"))
        .andExpect(jsonPath("_embedded.city").value("Test update city"))
        .andExpect(jsonPath("_embedded.consultingType").value(18))
        .andExpect(jsonPath("_embedded.description").value("Test update description"))
        .andExpect(jsonPath("_embedded.postcode").value("54321"))
        .andExpect(jsonPath("_embedded.teamAgency").value("false"))
        .andExpect(jsonPath("_embedded.url").value("https://www.test-update.de"))
        .andExpect(jsonPath("_embedded.external").value("false"))
        .andExpect(jsonPath("_embedded.offline").exists())
        .andExpect(jsonPath("_embedded.topics").exists())
        .andExpect(jsonPath("_embedded.createDate").exists())
        .andExpect(jsonPath("_embedded.updateDate").exists())
        .andExpect(jsonPath("_embedded.deleteDate").exists());

    var savedAgency = agencyRepository.findById(1L).orElseThrow();
    assertEquals(agencyDTO.getConsultingType(), savedAgency.getConsultingTypeId());
    assertEquals(agencyDTO.getDescription(), savedAgency.getDescription());
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void updateAgency_Should_returnStatusOk_When_calledWithEmptyDescription() throws Exception {
    var response = new ExtendedConsultingTypeResponseDTO();
    when(consultingTypeManager.getConsultingTypeSettings(anyInt())).thenReturn(response);

    var agencyDTO = new UpdateAgencyDTO()
        .name("Test update name")
        .description(null)
        .offline(true)
        .external(false);

    mockMvc.perform(put(PathConstants.UPDATE_DELETE_AGENCY_PATH)
            .contentType(APPLICATION_JSON)
            .content(JsonConverter.convertToJson(agencyDTO)))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.id").value(1))
        .andExpect(jsonPath("_embedded.name").value("Test update name"))
        .andExpect(jsonPath("_embedded.description").isEmpty())
        .andExpect(jsonPath("_embedded.teamAgency").value("false"))
        .andExpect(jsonPath("_embedded.external").value("false"))
        .andExpect(jsonPath("_embedded.offline").exists())
        .andExpect(jsonPath("_embedded.topics").exists())
        .andExpect(jsonPath("_embedded.createDate").exists())
        .andExpect(jsonPath("_embedded.updateDate").exists())
        .andExpect(jsonPath("_embedded.deleteDate").exists());

    var savedAgency = agencyRepository.findById(1L).orElseThrow();
    assertNull(savedAgency.getDescription());
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void updateAgency_Should_persistDataProtectionAttributes_When_payloadContainsDataProtection() throws Exception {
    var response = new ExtendedConsultingTypeResponseDTO();
    when(consultingTypeManager.getConsultingTypeSettings(anyInt())).thenReturn(response);

    var agencyDTO = new UpdateAgencyDTO()
        .name("Test update name")
        .description(null)
        .offline(true)
        .external(false)
            .dataProtection(new DataProtectionDTO()
                .dataProtectionResponsibleEntity(DataProtectionDTO.DataProtectionResponsibleEntityEnum.AGENCY_RESPONSIBLE)
                .agencyDataProtectionResponsibleContact(new DataProtectionContactDTO().nameAndLegalForm("agency responsible contact")
                    .city("Freiburg").postcode("99999").phoneNumber("123-123-123").email("agency@onlineberatung.net")
                )
                .dataProtectionOfficerContact(new DataProtectionContactDTO().nameAndLegalForm("data protection contact").city("Munich")
                    .postcode("00001").phoneNumber("321-321-321").email("dataprotection@onlineberatung.net")
                ));

    mockMvc.perform(put(PathConstants.UPDATE_DELETE_AGENCY_PATH)
            .contentType(APPLICATION_JSON)
            .content(JsonConverter.convertToJson(agencyDTO)))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.id").value(1))
        .andExpect(jsonPath("_embedded.name").value("Test update name"))
        .andExpect(jsonPath("_embedded.description").isEmpty())
        .andExpect(jsonPath("_embedded.teamAgency").value("false"))
        .andExpect(jsonPath("_embedded.external").value("false"))
        .andExpect(jsonPath("_embedded.offline").exists())
        .andExpect(jsonPath("_embedded.topics").exists())
        .andExpect(jsonPath("_embedded.createDate").exists())
        .andExpect(jsonPath("_embedded.updateDate").exists())
        .andExpect(jsonPath("_embedded.deleteDate").exists())
        .andExpect(jsonPath("_embedded.dataProtection.dataProtectionResponsibleEntity").value("AGENCY_RESPONSIBLE"))
        .andExpect(jsonPath("_embedded.dataProtection.agencyDataProtectionResponsibleContact.nameAndLegalForm").value("agency responsible contact"))
        .andExpect(jsonPath("_embedded.dataProtection.agencyDataProtectionResponsibleContact.city").value("Freiburg"))
        .andExpect(jsonPath("_embedded.dataProtection.agencyDataProtectionResponsibleContact.postcode").value("99999"))
        .andExpect(jsonPath("_embedded.dataProtection.agencyDataProtectionResponsibleContact.phoneNumber").value("123-123-123"))
        .andExpect(jsonPath("_embedded.dataProtection.agencyDataProtectionResponsibleContact.email").value("agency@onlineberatung.net"))
        .andExpect(jsonPath("_embedded.dataProtection.dataProtectionOfficerContact.nameAndLegalForm").value("data protection contact"))
        .andExpect(jsonPath("_embedded.dataProtection.dataProtectionOfficerContact.city").value("Munich"))
        .andExpect(jsonPath("_embedded.dataProtection.dataProtectionOfficerContact.postcode").value("00001"))
        .andExpect(jsonPath("_embedded.dataProtection.dataProtectionOfficerContact.phoneNumber").value("321-321-321"))
        .andExpect(jsonPath("_embedded.dataProtection.dataProtectionOfficerContact.email").value("dataprotection@onlineberatung.net"));

    var savedAgency = agencyRepository.findById(1L).orElseThrow();
    assertNull(savedAgency.getDescription());
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_RESTRICTED_AGENCY_ADMIN"})
  void updateAgency_Should_returnStatusOk_When_calledWithRestrictedAgencyAdminThatHasPermissionForGivenAgency()
      throws Exception {
    // given
    var extendedConsultingTypeResponseDTO = new ExtendedConsultingTypeResponseDTO();
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(extendedConsultingTypeResponseDTO);
    when(userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId())).thenReturn(
        Lists.newArrayList(1L));

    UpdateAgencyDTO agencyDTO = new UpdateAgencyDTO()
        .name("Test update name")
        .description("Test update description")
        .postcode("54321")
        .city("Test update city")
        .offline(true)
        .url("https://www.test-update.de")
        .external(false);
    String payload = JsonConverter.convertToJson(agencyDTO);

    // when, then
    mockMvc.perform(put(PathConstants.UPDATE_DELETE_AGENCY_PATH)
            .contentType(APPLICATION_JSON)
            .content(payload))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.id").value(1))
        .andExpect(jsonPath("_embedded.name").value("Test update name"))
        .andExpect(jsonPath("_embedded.city").value("Test update city"))
        .andExpect(jsonPath("_embedded.consultingType").value(0))
        .andExpect(jsonPath("_embedded.description").value("Test update description"))
        .andExpect(jsonPath("_embedded.postcode").value("54321"))
        .andExpect(jsonPath("_embedded.teamAgency").value("false"))
        .andExpect(jsonPath("_embedded.url").value("https://www.test-update.de"))
        .andExpect(jsonPath("_embedded.external").value("false"))
        .andExpect(jsonPath("_embedded.offline").exists())
        .andExpect(jsonPath("_embedded.topics").exists())
        .andExpect(jsonPath("_embedded.createDate").exists())
        .andExpect(jsonPath("_embedded.updateDate").exists())
        .andExpect(jsonPath("_embedded.deleteDate").exists());
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_RESTRICTED_AGENCY_ADMIN"})
  void updateAgency_Should_returnAccessDenied_When_calledWithRestrictedAgencyAdminDoesntHavePermissionForGivenAgency()
      throws Exception {
    // given
    var extendedConsultingTypeResponseDTO = new ExtendedConsultingTypeResponseDTO();
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(extendedConsultingTypeResponseDTO);
    when(authenticatedUser.hasRestrictedAgencyPriviliges()).thenReturn(true);
    when(userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId())).thenReturn(
        Lists.newArrayList(2L, 3L));

    UpdateAgencyDTO agencyDTO = new UpdateAgencyDTO()
        .name("Test update name")
        .description("Test update description")
        .postcode("54321")
        .city("Test update city")
        .offline(true)
        .url("https://www.test-update.de")
        .external(false);
    String payload = JsonConverter.convertToJson(agencyDTO);

    // when, then
    mockMvc.perform(put(PathConstants.UPDATE_DELETE_AGENCY_PATH)
            .contentType(APPLICATION_JSON)
            .content(payload))
        .andExpect(status().isForbidden());
  }

  @Test
  void getAgency_Should_returnUnauthorized_When_calledAsUnauthenticatedUser()
      throws Exception {
    mockMvc.perform(get(PATH_GET_AGENCY_BY_ID)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isUnauthorized());
  }

  @Test
  void createAgency_Should_returnUnauthorized_When_calledAsUnauthenticatedUser()
      throws Exception {
    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    String payload = JsonConverter.convertToJson(agencyDTO);
    mockMvc.perform(post(PathConstants.CREATE_AGENCY_PATH)
            .content(payload)
            .contentType(APPLICATION_JSON))
        .andExpect(status().isUnauthorized());
  }

  @Test
  void updateAgency_Should_returnUnauthorized_When_calledAsUnauthenticatedUser()
      throws Exception {
    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO agencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    String payload = JsonConverter.convertToJson(agencyDTO);
    mockMvc.perform(put(PathConstants.UPDATE_DELETE_AGENCY_PATH)
            .content(payload)
            .contentType(APPLICATION_JSON))
        .andExpect(status().isUnauthorized());
  }

  @Test
  @WithMockUser(authorities = {"NOT_AUTHORIZED"})
  void getAgency_Should_returnIsForbidden_When_calledAsUnauthorizedUser()
      throws Exception {
    mockMvc.perform(get(PATH_GET_AGENCY_BY_ID)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isForbidden());
  }

  @Test
  @WithMockUser(authorities = {"NOT_AUTHORIZED"})
  void createAgency_Should_returnForbidden_When_calledAsUnauthorizedUser()
      throws Exception {
    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    String payload = JsonConverter.convertToJson(agencyDTO);
    mockMvc.perform(post(PathConstants.CREATE_AGENCY_PATH)
            .content(payload)
            .contentType(APPLICATION_JSON))
        .andExpect(status().isForbidden());
  }

  @Test
  @WithMockUser(authorities = {"NOT_AUTHORIZED"})
  void updateAgency_Should_returnForbidden_When_calledAsUnauthorizedUser()
      throws Exception {
    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO agencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    String payload = JsonConverter.convertToJson(agencyDTO);
    mockMvc.perform(put(PathConstants.UPDATE_DELETE_AGENCY_PATH)
            .content(payload)
            .contentType(APPLICATION_JSON))
        .andExpect(status().isForbidden());
  }

  @Test
  @WithMockUser(authorities = {"NOT_AUTHORIZED"})
  void getAgencyByTenantId_Should_returnForbidden_When_calledAsUnauthorizedUser()
      throws Exception {
    mockMvc.perform(get(PATH_GET_AGENCY_BY_TENANT_ID)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isForbidden());
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_TENANT_ADMIN"})
  void getAgencyByTenantId_Should_returnForbidden_When_calledAsTenantAdminButWithoutAgencyPriviliges()
      throws Exception {
    mockMvc.perform(get(PATH_GET_AGENCY_BY_TENANT_ID)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isForbidden());
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN"})
  void getAgencyByTenantId_Should_returnForbidden_When_calledAsAgencyAdminButWithoutSuperAdminPriviliges()
      throws Exception {
    mockMvc.perform(get(PATH_GET_AGENCY_BY_TENANT_ID)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isForbidden());
  }

  @Test
  @WithMockUser(authorities = {"AUTHORIZATION_AGENCY_ADMIN", "AUTHORIZATION_TENANT_ADMIN"})
  void getAgencyByTenantId_Should_return_Ok_When_calledAsTenantAdminWithAgencyAuthorities()
      throws Exception {
    mockMvc.perform(get(PATH_GET_AGENCY_BY_TENANT_ID)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(jsonPath("$[0]._embedded.id").value(1735))
        .andExpect(jsonPath("$[0]._embedded.name").value("With tenant id"));
  }

}
