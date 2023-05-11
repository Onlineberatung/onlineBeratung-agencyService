package de.caritas.cob.agencyservice.api.controller;

import static org.hamcrest.Matchers.is;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.config.apiclient.ConsultingTypeServiceApiControllerFactory;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.ConsultingTypeControllerApi;
import java.net.URI;
import java.util.Map;
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
class AgencyControllerE2EIT {

  private static final EasyRandom easyRandom = new EasyRandom();
  private static final String CSRF_HEADER = "csrfHeader";
  private static final String CSRF_VALUE = "test";
  private static final Cookie CSRF_COOKIE = new Cookie("csrfCookie", CSRF_VALUE);

  @Autowired private MockMvc mockMvc;

  @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
  @Autowired
  private ConsultingTypeControllerApi consultingTypeControllerApi;

  @Autowired
  private AgencyRepository agencyRepository;

  @MockBean
  private ConsultingTypeServiceApiControllerFactory consultingTypeServiceApiControllerFactory;

  @MockBean
  @Qualifier("restTemplate")
  private RestTemplate restTemplate;

  private Agency existingAgency;

  @AfterEach
  void reset() {
    existingAgency = null;
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void getAgenciesShouldRespondWithOkAndDefaultHasVideoCalls() throws Exception {
    givenAnExistingAgency();
    givenConsultingTypeServiceResponse();

    mockMvc
        .perform(
            get("/agencies")
                .queryParam("postcode", existingAgency.getPostCode())
                .queryParam("consultingType", Integer.toString(existingAgency.getConsultingTypeId()))
                .cookie(CSRF_COOKIE)
                .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk())
        .andExpect(jsonPath("$[0].hasVideoCalls", is(true)));
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void getAgenciesShouldRespondWithNoContentOnNonExistingAgencies() throws Exception {
    givenConsultingTypeServiceResponse();

    mockMvc
        .perform(
            get("/agencies")
                .queryParam("postcode", "00000")
                .queryParam("consultingType", RandomStringUtils.randomNumeric(3))
                .cookie(CSRF_COOKIE)
                .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isNoContent());
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void getAgenciesByConsultingTypeShouldRespondWithOkAndDefaultHasVideoCalls() throws Exception {
    givenAnExistingAgency();
    givenConsultingTypeServiceResponse();

    mockMvc
        .perform(
            get("/agencies/consultingtype/{consultingTypeId}", existingAgency.getConsultingTypeId())
                .cookie(CSRF_COOKIE)
                .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk())
        .andExpect(jsonPath("$[0].hasVideoCalls", is(true)));
  }

  @Test
  @WithMockUser(authorities = "AUTHORIZATION_AGENCY_ADMIN")
  void getAgenciesByIdsShouldRespondWithOkAndDefaultHasVideoCalls() throws Exception {
    givenAnExistingAgency();
    givenConsultingTypeServiceResponse();

    mockMvc
        .perform(
            get("/agencies/{agencyIds}", existingAgency.getId())
                .cookie(CSRF_COOKIE)
                .header(CSRF_HEADER, CSRF_VALUE))
        .andExpect(status().isOk())
        .andExpect(jsonPath("$[0].hasVideoCalls", is(true)));
  }

  private void givenAnExistingAgency() {
    existingAgency = agencyRepository
        .findById((long) easyRandom.nextInt(100))
        .orElseThrow();
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

    var body = new de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO();
    body.setId(1);
    ParameterizedTypeReference<de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO> value =
        new ParameterizedTypeReference<>() {};
    when(restTemplate.exchange(any(RequestEntity.class), eq(value)))
        .thenReturn(ResponseEntity.ok(body));
  }
}
