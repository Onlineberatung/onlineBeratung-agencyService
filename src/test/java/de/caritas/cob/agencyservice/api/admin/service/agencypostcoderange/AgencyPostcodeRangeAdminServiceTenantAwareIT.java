package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRangeRepository;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
public class AgencyPostcodeRangeAdminServiceTenantAwareIT extends AgencyPostcodeRangeAdminServiceITBase {

  final static long AGENCY_WITH_TENANT_ID_2 = 1734L;

  @Before
  public void beforeEach() {
    TenantContext.setCurrentTenant(1L);
  }

  @After
  public void afterEach() {
    TenantContext.clear();
  }

  @Autowired
  private AgencyPostcodeRangeAdminService agencyPostcodeRangeAdminService;

  @Autowired
  private AgencyPostcodeRangeRepository agencyPostcodeRangeRepository;

  @Test
  public void findPostcodeRangesForAgency_Should_returnExpectedResult_When_postcodeRangesExists() {
    super.findPostcodeRangesForAgency_Should_returnExpectedResult_When_postcodeRangesExists();
  }

  @Test
  public void findPostcodeRangesForAgency_Should_returnExpectedResult_When_postcodeRangesExists_ButDifferentTenant() {

    var postcodeRange = this.agencyPostcodeRangeAdminService
        .findPostcodeRangesForAgency(AGENCY_WITH_TENANT_ID_2)
        .getEmbedded();
    assertThat(postcodeRange, notNullValue());
    assertThat(postcodeRange.getId(), notNullValue());
    Assert.assertEquals("", postcodeRange.getPostcodeRanges());
  }

  @Test
  public void findPostcodeRangesForAgency_Should_haveExpectedLinks_When_postcodeRangesExists() {
    super.findPostcodeRangesForAgency_Should_haveExpectedLinks_When_postcodeRangesExists();
  }

  @Test
  @Transactional
  public void deleteAgencyPostcodeRange_Should_deletePostcodeRange_When_agencyIdExists() {
    super.deleteAgencyPostcodeRange_Should_deletePostcodeRange_When_agencyIdExists();
  }

  @Test
  public void deleteAgencyPostcodeRange_Should_accept_When_agencyIdNotExists() {
    super.deleteAgencyPostcodeRange_Should_throwNotFound_When_agencyIdNotExists();
  }

}
