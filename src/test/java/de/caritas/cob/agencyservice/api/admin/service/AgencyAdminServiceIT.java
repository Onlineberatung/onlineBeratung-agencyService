package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.annotation.DirtiesContext.ClassMode;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
@DirtiesContext(classMode = ClassMode.BEFORE_CLASS)
@Transactional
@TestPropertySource(properties = "multitenancy.enabled=false")
public class AgencyAdminServiceIT extends AgencyAdminServiceITBase {

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
