package de.caritas.cob.agencyservice.api.admin.controller;

import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fasterxml.jackson.databind.ObjectMapper;
import de.caritas.cob.agencyservice.api.admin.validation.validators.AgencyUpdatePermissionValidator;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.diocese.DioceseRepository;
import de.caritas.cob.agencyservice.config.apiclient.ConsultingTypeServiceApiControllerFactory;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.ConsultingTypeControllerApi;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import java.net.URI;
import java.util.Map;
import java.util.stream.StreamSupport;
import javax.servlet.http.Cookie;
import lombok.NonNull;
import lombok.SneakyThrows;
import org.apache.commons.lang3.RandomStringUtils;
import org.jeasy.random.EasyRandom;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriTemplateHandler;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("testing")
@AutoConfigureTestDatabase
class AgencyAdminControllerE2EIT {

  private static final EasyRandom easyRandom = new EasyRandom();
  private static final String CSRF_HEADER = "csrfHeader";
  private static final String CSRF_VALUE = "test";
  private static final Cookie CSRF_COOKIE = new Cookie("csrfCookie", CSRF_VALUE);

  @Autowired private MockMvc mockMvc;

  @Autowired private ObjectMapper objectMapper;

  @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
  @Autowired
  private ConsultingTypeControllerApi consultingTypeControllerApi;

  @Autowired
  private DioceseRepository dioceseRepository;

  @Autowired
  private AgencyRepository agencyRepository;

  @MockBean
  @SuppressWarnings("unused")
  private AgencyUpdatePermissionValidator agencyUpdatePermissionValidator;

  @MockBean
  private ConsultingTypeServiceApiControllerFactory consultingTypeServiceApiControllerFactory;

  @MockBean
  @Qualifier("restTemplate")
  private RestTemplate restTemplate;

  private AgencyDTO agencyDto;

  private UpdateAgencyDTO updateAgencyDTO;

  @AfterEach
  void reset() {
    agencyDto = null;
    updateAgencyDTO = null;
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void createAgencyShouldRespondCreatedAndSaveGivenHasVideoCallTrue() throws Exception {
    givenANewAgencyDto(true);
    givenConsultingTypeServiceResponse();

    var response = mockMvc
        .perform(
            post("/agencyadmin/agencies")
                .cookie(CSRF_COOKIE)
                .header(CSRF_HEADER, CSRF_VALUE)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(agencyDto)))
        .andExpect(status().isCreated())
        .andExpect(jsonPath("_embedded.hasVideoCalls", is(true)))
        .andReturn().getResponse();

    var responseDTO = objectMapper.readValue(response.getContentAsString(), AgencyAdminFullResponseDTO.class);
    var savedAgency = agencyRepository.findById(responseDTO.getEmbedded().getId()).orElseThrow();
    assertTrue(savedAgency.getHasVideoCalls());
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void createAgencyShouldRespondCreatedAndSaveGivenHasVideoCallFalse() throws Exception {
    givenANewAgencyDto(false);
    givenConsultingTypeServiceResponse();

    var response = mockMvc
        .perform(
            post("/agencyadmin/agencies")
                .cookie(CSRF_COOKIE)
                .header(CSRF_HEADER, CSRF_VALUE)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(agencyDto)))
        .andExpect(status().isCreated())
        .andExpect(jsonPath("_embedded.hasVideoCalls", is(false)))
        .andReturn().getResponse();

    var responseDTO = objectMapper.readValue(response.getContentAsString(), AgencyAdminFullResponseDTO.class);
    var savedAgency = agencyRepository.findById(responseDTO.getEmbedded().getId()).orElseThrow();
    assertFalse(savedAgency.getHasVideoCalls());
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void createAgencyShouldRespondCreatedAndSetMissingHasVideoCallWithDefault() throws Exception {
    givenANewAgencyDto(null);
    givenConsultingTypeServiceResponse();

    var response = mockMvc
        .perform(
            post("/agencyadmin/agencies")
                .cookie(CSRF_COOKIE)
                .header(CSRF_HEADER, CSRF_VALUE)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(agencyDto)))
        .andExpect(status().isCreated())
        .andExpect(jsonPath("_embedded.hasVideoCalls", is(true)))
        .andReturn().getResponse();

    var responseDTO = objectMapper.readValue(response.getContentAsString(), AgencyAdminFullResponseDTO.class);
    var savedAgency = agencyRepository.findById(responseDTO.getEmbedded().getId()).orElseThrow();
    assertTrue(savedAgency.getHasVideoCalls());
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void updateAgencyShouldRespondOkAndUpdateGivenHasVideoCall() throws Exception {
    var agencyId = givenAnUpdatedAgencyDto(false);
    givenConsultingTypeServiceResponse();

    mockMvc
        .perform(
            put("/agencyadmin/agencies/{id}", agencyId)
                .cookie(CSRF_COOKIE)
                .header(CSRF_HEADER, CSRF_VALUE)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(updateAgencyDTO)))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.hasVideoCalls", is(updateAgencyDTO.getHasVideoCalls())));

    var savedAgency = agencyRepository.findById(agencyId).orElseThrow();
    assertEquals(updateAgencyDTO.getHasVideoCalls(), savedAgency.getHasVideoCalls());
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void updateAgencyShouldRespondOkAndUpdateToDefaultHasVideoCallIfNotGiven() throws Exception {
    var agencyId = givenAnUpdatedAgencyDto(true);
    givenConsultingTypeServiceResponse();

    mockMvc
        .perform(
            put("/agencyadmin/agencies/{id}", agencyId)
                .cookie(CSRF_COOKIE)
                .header(CSRF_HEADER, CSRF_VALUE)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(updateAgencyDTO)))
        .andExpect(status().isOk())
        .andExpect(jsonPath("_embedded.hasVideoCalls", is(true)));

    var savedAgency = agencyRepository.findById(agencyId).orElseThrow();
    assertTrue(savedAgency.getHasVideoCalls());
  }

  private long givenAnUpdatedAgencyDto(boolean hasVideoCallsNull) {
    var existingAgency = agencyRepository
        .findById((long) easyRandom.nextInt(100))
        .orElseThrow();

    updateAgencyDTO = new UpdateAgencyDTO()
        .dioceseId(existingAgency.getDioceseId())
        .name(existingAgency.getName())
        .description(existingAgency.getDescription())
        .consultingType(existingAgency.getConsultingTypeId())
        .postcode(existingAgency.getPostCode())
        .city(existingAgency.getCity())
        .offline(true)
        .url(existingAgency.getUrl())
        .external(existingAgency.isExternal())
        .hasVideoCalls(hasVideoCallsNull ? null : !existingAgency.getHasVideoCalls());

    return existingAgency.getId();
  }

  private void givenANewAgencyDto(Boolean hasVideoCalls) {
    var diocese = StreamSupport.stream(dioceseRepository.findAll().spliterator(), false)
        .findFirst().orElseThrow();

    agencyDto = easyRandom.nextObject(AgencyDTO.class);
    agencyDto.setDioceseId(diocese.getDioceseId());
    agencyDto.setName(RandomStringUtils.randomAlphanumeric(100));
    agencyDto.setPostcode(RandomStringUtils.randomNumeric(5));
    agencyDto.setCity(RandomStringUtils.randomAlphanumeric(100));
    agencyDto.setConsultingType(easyRandom.nextInt(128));
    agencyDto.setUrl(RandomStringUtils.randomAlphanumeric(128));
    agencyDto.setTopicIds(null);
    agencyDto.setDemographics(null);
    agencyDto.setTenantId(null);
    agencyDto.hasVideoCalls(hasVideoCalls);
  }

  private void givenConsultingTypeServiceResponse() {
    when(consultingTypeServiceApiControllerFactory.createControllerApi())
        .thenReturn(consultingTypeControllerApi);

    consultingTypeControllerApi.getApiClient().setBasePath("https://www.google.de/");
    when(restTemplate.getUriTemplateHandler())
        .thenReturn(
            new UriTemplateHandler() {
              @SneakyThrows
              @Override
              public @NonNull URI expand(
                  @NonNull String uriTemplate, @NonNull Map<String, ?> uriVariables) {
                return new URI("");
              }

              @SneakyThrows
              @Override
              public @NonNull URI expand(
                  @NonNull String uriTemplate, Object @NonNull ... uriVariables) {
                return new URI("");
              }
            });

    var body = new ExtendedConsultingTypeResponseDTO();
    body.setId(1);
    ParameterizedTypeReference<ExtendedConsultingTypeResponseDTO> value =
        new ParameterizedTypeReference<>() {};
    when(restTemplate.exchange(any(RequestEntity.class), eq(value)))
        .thenReturn(ResponseEntity.ok(body));
  }
}
