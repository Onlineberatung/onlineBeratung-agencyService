package de.caritas.cob.agencyservice.api.controller;

import static de.caritas.cob.agencyservice.testHelper.PathConstants.PATH_GET_LIST_OF_AGENCIES;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_AGE_QUERY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_CONSULTING_TYPE_QUERY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_GENDER_QUERY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE_QUERY;
import static org.hamcrest.Matchers.hasSize;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;

import de.caritas.cob.agencyservice.api.tenant.TenantContext;

import jakarta.transaction.Transactional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@SpringBootTest
@TestPropertySource(properties = "feature.demographics.enabled=true")
@AutoConfigureMockMvc(addFilters = false)
@ActiveProfiles("testing")
@Transactional
class AgencyControllerWithDemographicsIT {

  private MockMvc mvc;

  @BeforeEach
  public void setup() {
    TenantContext.clear();
    mvc = MockMvcBuilders
        .webAppContextSetup(context)
        .apply(springSecurity())
        .build();
  }

  @MockBean
  private ConsultingTypeManager consultingTypeManager;

  @Autowired
  private WebApplicationContext context;

  @BeforeEach
  public void setUp() throws MissingConsultingTypeException {
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(new de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO());
  }

  @Test
  void getAgencies_Should_ReturnBadRequest_When_NoAgeOrGenderParamsAreProvided() throws Exception {
    mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_POSTCODE_QUERY + "&"
            + VALID_CONSULTING_TYPE_QUERY)
            .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  void getAgencies_Should_ReturnBadRequest_When_NoGenderParamsIsProvided() throws Exception {
    mvc.perform(
            get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_POSTCODE_QUERY + "&"
                + VALID_CONSULTING_TYPE_QUERY + "&" + VALID_AGE_QUERY)
                .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
  }

  @Test
  void getAgencies_Should_ReturnNoContent_When_GenderParamsIsProvidedButNotMatching() throws Exception {
    mvc.perform(
            get(PATH_GET_LIST_OF_AGENCIES + "?" + VALID_POSTCODE_QUERY + "&"
                + VALID_CONSULTING_TYPE_QUERY + "&" + VALID_AGE_QUERY + "&" + VALID_GENDER_QUERY)
                .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isNoContent());
  }

  @Test
  void getAgencies_Should_ReturnOk_When_MatchingSearchParametersAreProvided() throws Exception {
    ResultActions perform = mvc.perform(
        get(PATH_GET_LIST_OF_AGENCIES + "?" + "postcode=99999" + "&"
            + "consultingType=19" + "&" + VALID_AGE_QUERY + "&" + VALID_GENDER_QUERY)
            .accept(MediaType.APPLICATION_JSON));
    perform
        .andExpect(status().isOk())
        .andExpect(jsonPath("$", hasSize(1)))
        .andExpect(jsonPath("$[0].id").value(1737))
        .andExpect(jsonPath("$[0].topicIds").isArray())
        .andExpect(jsonPath("$[0].demographics.ageFrom").value(30))
        .andExpect(jsonPath("$[0].demographics.ageTo").value(60))
        .andExpect(jsonPath("$[0].demographics.genders[0]").value("FEMALE"))
        .andExpect(jsonPath("$[0].demographics.genders[1]").value("DIVERS"));

  }


}
