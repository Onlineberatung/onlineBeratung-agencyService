package de.caritas.cob.agencyservice.api.controller;

import static de.caritas.cob.agencyservice.testHelper.PathConstants.PATH_GET_AGENCIES_WITH_IDS;
import static de.caritas.cob.agencyservice.testHelper.PathConstants.PATH_GET_LIST_OF_AGENCIES;
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
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTO;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.SettingDTO;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
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
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.ApplicationsettingsControllerApi;
import de.caritas.cob.agencyservice.tenantservice.generated.web.TenantControllerApi;

@SpringBootTest
@TestPropertySource(properties = {"feature.multitenancy.with.single.domain.enabled=true",
    "multitenancy.enabled=true"})
@AutoConfigureMockMvc(addFilters = false)
@ActiveProfiles("testing")
@Transactional
class AgencyControllerWithSingleDomainMultitenancyIT {

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

  @MockBean
  private ApplicationsettingsControllerApi applicationsettingsControllerApi;

  @MockBean
  private TenantControllerApi tenantControllerApi;

  @Autowired
  private WebApplicationContext context;

  @BeforeEach
  public void setUp() throws MissingConsultingTypeException {
    when(consultingTypeManager.getConsultingTypeSettings(anyInt()))
        .thenReturn(
            new de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO());
    when(applicationsettingsControllerApi.getApplicationSettings()).thenReturn(new ApplicationSettingsDTO()
        .mainTenantSubdomainForSingleDomainMultitenancy(new SettingDTO().value("app")));
    when(tenantControllerApi.getRestrictedTenantDataBySubdomain("app")).thenReturn(new RestrictedTenantDTO().id(0L));
  }

  @Test
  void getAgencies_Should_ReturnOk_AndSkipConsultingTypeParamInAgencySearch_When_MatchingSearchParametersAreProvided() throws Exception {
    mvc.perform(

            get(PATH_GET_LIST_OF_AGENCIES + "?" + "postcode=99999" + "&"
                + "consultingType=19")
                .accept(MediaType.APPLICATION_JSON))

        .andExpect(status().isOk())
        .andExpect(jsonPath("$", hasSize(6)));
  }

  @Test
  void getAgencies_Should_ReturnOk_GetAgencyById_When_DifferentTenantAgencyIsRequested() throws Exception {
    mvc.perform(

            get(PATH_GET_AGENCIES_WITH_IDS + "1738")
                .header("tenantId", 10)
                .accept(MediaType.APPLICATION_JSON))

        .andExpect(status().isOk())
        .andExpect(jsonPath("$", hasSize(1)));
  }

}
