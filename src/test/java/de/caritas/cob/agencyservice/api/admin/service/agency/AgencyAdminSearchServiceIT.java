package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.assertj.core.api.Assertions.assertThat;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.model.Sort;
import org.junit.jupiter.api.Test;
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
class AgencyAdminSearchServiceIT {

  @Autowired
  private AgencyAdminSearchService agencyAdminSearchService;

  @Test
  void searchAgency_Should_FindAgencies() {
    // given, when
    var agencySearchResult = agencyAdminSearchService.searchAgencies("", 1, 10, new Sort());
    // then
    assertThat(agencySearchResult.getEmbedded()).isNotEmpty();
  }


}