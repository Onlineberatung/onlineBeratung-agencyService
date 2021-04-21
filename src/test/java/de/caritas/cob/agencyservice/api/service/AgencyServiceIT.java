package de.caritas.cob.agencyservice.api.service;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_PREGNANCY;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
public class AgencyServiceIT {

  @Autowired
  private AgencyService agencyService;
  @Autowired
  private AgencyRepository agencyRepository;

  @Test
  public void getAgencies_Should_returnMatchingAgencies_When_postcodeAndConsultingTypeIsGiven() {
    String postCode = "88662";

    List<AgencyResponseDTO> resultAgencies = agencyService
        .getAgencies(postCode, CONSULTING_TYPE_PREGNANCY);

    assertThat(resultAgencies, hasSize(1));
    AgencyResponseDTO resultAgency = resultAgencies.get(0);
    assertThat(resultAgency.getId(), is(883L));
  }

  @Test
  public void setAgencyOffline_Should_FlagAgencyAsOfflineAndSetUpdateDate() {

    Agency agencyBefore = agencyRepository.findById(883L)
        .orElseThrow(RuntimeException::new);
    agencyService.setAgencyOffline(883L);
    Agency agencyAfter = agencyRepository.findById(883L)
        .orElseThrow(RuntimeException::new);
    assertTrue(agencyAfter.isOffline());
    assertNotEquals(agencyBefore.getUpdateDate(), agencyAfter.getUpdateDate());

  }

}
