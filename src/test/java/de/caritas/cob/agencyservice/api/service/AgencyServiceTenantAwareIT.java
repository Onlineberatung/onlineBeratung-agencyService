package de.caritas.cob.agencyservice.api.service;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.annotation.DirtiesContext.ClassMode;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.Sql.ExecutionPhase;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
@DirtiesContext(classMode = ClassMode.BEFORE_CLASS)
@TestPropertySource(properties = "multitenancy.enabled=true")
@Sql(value = "/setTenants.sql", executionPhase = ExecutionPhase.BEFORE_TEST_METHOD)
@Transactional(propagation = Propagation.NEVER)
public class AgencyServiceTenantAwareIT extends AgencyServiceITBase {

  @Autowired
  private PlatformTransactionManager transactionManager;

  @MockBean
  TenantService tenantService;

  @Before
  public void beforeEach() {
    TenantContext.setCurrentTenant(1L);
    Mockito.when(tenantService.getRestrictedTenantDataByTenantId(Mockito.anyLong())).thenReturn(new RestrictedTenantDTO());
  }

  @After
  public void afterEach() {
    TenantContext.clear();
  }

  @Test
  public void getAgencies_Should_returnMatchingAgencies_When_postcodeAndConsultingTypeIsGiven()
      throws MissingConsultingTypeException {
    super.getAgencies_Should_returnMatchingAgencies_When_postcodeAndConsultingTypeIsGiven();
  }

  @Test
  public void setAgencyOffline_Should_FlagAgencyAsOfflineAndSetUpdateDate() {
    super.setAgencyOffline_Should_FlagAgencyAsOfflineAndSetUpdateDate();
  }

  @Test
  public void getAgenciesByConsultingType_Should_returnResults_When_ConsultingTypeIsValid() {
    super.getAgenciesByConsultingType_Should_returnResults_When_ConsultingTypeIsValid();
  }

}
