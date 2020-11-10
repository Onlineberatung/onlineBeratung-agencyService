package de.caritas.cob.agencyservice.api.admin.service;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
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
public class AgencyAdminSearchResultBuilderIT {

  @Autowired
  private AgencyAdminSearchResultBuilder agencyAdminSearchResultBuilder;

  @Test
  public void buildAgencyAdminSearchResult_Should_returnExpectedMappedResponseDTO_When_searchForSpecialAgency() {
    String keyword = "Schwangerschaftsberatungsstelle";

    AgencyAdminResponseDTO firstSearchResult =
        this.agencyAdminSearchResultBuilder
            .buildAgencyAdminSearchResult(keyword, 0, 1).iterator().next();

    assertThat(firstSearchResult.getAgencyId(), is(846L));
    assertThat(firstSearchResult.getCity(), is("Schwelm"));
    assertThat(firstSearchResult.getConsultingType(), is("PREGNANCY"));
    assertThat(firstSearchResult.getCreateDate(), is("2019-08-23T08:52:05"));
    assertThat(firstSearchResult.getUpdateDate(), is("2019-08-23T08:52:05"));
    assertThat(firstSearchResult.getDeleteDate(), is("null"));
    assertThat(firstSearchResult.getDioceseId(), is(10L));
    assertThat(firstSearchResult.getName(), is("Schwangerschaftsberatungsstelle Schwelm"));
    assertThat(firstSearchResult.getOffline(), is(false));
    assertThat(firstSearchResult.getPostcode(), is("58332"));
    assertThat(firstSearchResult.getTeamAgency(), is(false));
    assertThat(firstSearchResult.getPostCodeRanges(), hasSize(3));
    assertThat(firstSearchResult.getPostCodeRanges().get(0).getPostcodeFrom(), is("45536"));
    assertThat(firstSearchResult.getPostCodeRanges().get(0).getPostcodeTo(), is("45549"));
    assertThat(firstSearchResult.getPostCodeRanges().get(1).getPostcodeFrom(), is("58240"));
    assertThat(firstSearchResult.getPostCodeRanges().get(1).getPostcodeTo(), is("58300"));
    assertThat(firstSearchResult.getPostCodeRanges().get(2).getPostcodeFrom(), is("58314"));
    assertThat(firstSearchResult.getPostCodeRanges().get(2).getPostcodeTo(), is("58332"));
  }

}
