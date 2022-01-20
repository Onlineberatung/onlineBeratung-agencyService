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
public class DioceseAdminServiceTenantSupportIT extends DioceseAdminServiceITBase {

  @Before
  public void beforeEach() {
    TenantContext.setCurrentTenant(1L);
  }

  @After
  public void afterEach() {
    TenantContext.clear();
  }

  @Test
  public void findAllDioceses_Should_returnOneResult_When_perPageIsSetToOne() {
    super.findAllDioceses_Should_returnOneResult_When_perPageIsSetToOne();
  }

  @Test
  public void findAllDioceses_Should_returnOneResult_When_perPageIsSetToOneAndPageIsSetToOne() {
    super.findAllDioceses_Should_returnOneResult_When_perPageIsSetToOneAndPageIsSetToOne();
  }

  @Test
  public void findAllDioceses_Should_returnOneResult_When_paginationParamsAreZero() {
    super.findAllDioceses_Should_returnOneResult_When_paginationParamsAreZero();
  }

  @Test
  public void findAllDioceses_Should_returnOneResult_When_paginationParamsAreNegative() {
    super.findAllDioceses_Should_returnOneResult_When_paginationParamsAreNegative();
  }

  @Test
  public void findAllDioceses_Should_returnPaginatedEntities_When_paginationParamsAreSplitted() {
    super.findAllDioceses_Should_returnPaginatedEntities_When_paginationParamsAreSplitted();
  }

  @Test
  public void buildAgencyAdminSearchResult_Should_haveExpectedLinks_When_AllParamsAreProvided() {
    super.buildAgencyAdminSearchResult_Should_haveExpectedLinks_When_AllParamsAreProvided();
  }
}
