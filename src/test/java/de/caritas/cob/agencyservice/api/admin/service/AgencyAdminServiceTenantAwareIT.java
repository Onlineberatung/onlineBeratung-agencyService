package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.annotation.DirtiesContext.ClassMode;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.Sql.ExecutionPhase;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
@DirtiesContext(classMode = ClassMode.BEFORE_CLASS)
@TestPropertySource(properties = "multitenancy.enabled=true")
@Transactional
@Sql(value = "/setTenants.sql", executionPhase = ExecutionPhase.BEFORE_TEST_METHOD)
public class AgencyAdminServiceTenantAwareIT extends AgencyAdminServiceIT {

  @Before
  public void beforeEach() {
    TenantContext.setCurrentTenant(1L);
  }

  @After
  public void afterEach() {
    TenantContext.clear();
  }

  @Test
  public void saveAgency_Should_PersistsAgency() {
    super.saveAgency_Should_PersistsAgency();
  }

  @Test
  public void saveAgency_Should_SetOfflineToTrue_WhenPersistsAgency() {
    super.saveAgency_Should_SetOfflineToTrue_WhenPersistsAgency();
  }

  @Test
  public void saveAgency_Should_ProvideValidAgencyLinks() {
    super.saveAgency_Should_ProvideValidAgencyLinks();
  }

  @Test
  public void updateAgency_Should_PersistsAgencyChanges() {
    super.updateAgency_Should_PersistsAgencyChanges();
  }

  @Test
  public void updateAgency_Should_ProvideValidAgencyLinks() {
    super.updateAgency_Should_ProvideValidAgencyLinks();
  }

  @Test
  public void getAgency_Should_returnExpectedAgency_When_agencyWithIdExists() {
    super.getAgency_Should_returnExpectedAgency_When_agencyWithIdExists();
  }

}


