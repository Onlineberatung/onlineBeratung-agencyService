package de.caritas.cob.agencyservice.api.service;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
public class AgencyServiceIT extends AgencyServiceITBase {

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
