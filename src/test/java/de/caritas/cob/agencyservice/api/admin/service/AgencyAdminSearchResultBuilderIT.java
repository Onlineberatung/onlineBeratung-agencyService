package de.caritas.cob.agencyservice.api.admin.service;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyAdminSearchResultDTO;
import de.caritas.cob.agencyservice.api.model.SearchResultLinks;
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
            .buildAgencyAdminSearchResult(keyword, 0, 1).getEmbedded().iterator().next();

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

  @Test
  public void buildAgencyAdminSearchResult_Should_haveExpectedLinks_When_search() {
    AgencyAdminSearchResultDTO agencyAdminSearchResultDTO = this.agencyAdminSearchResultBuilder
        .buildAgencyAdminSearchResult("q", 1, 20);

    SearchResultLinks searchResultLinks = agencyAdminSearchResultDTO.getLinks();
    assertThat(searchResultLinks.getSelf(), notNullValue());
    assertThat(searchResultLinks.getSelf().getHref(),
        endsWith("/admin/agencies?page=1&perPage=20&q=q"));
    assertThat(searchResultLinks.getPrevious(), nullValue());
    assertThat(searchResultLinks.getNext(), notNullValue());
    assertThat(searchResultLinks.getNext().getHref(),
        endsWith("/admin/agencies?page=2&perPage=20&q=q"));
    assertThat(searchResultLinks.getSearch(), notNullValue());
    assertThat(searchResultLinks.getSearch().getHref(),
        endsWith("/admin/agencies?page=1&perPage=20{&q}"));
  }

  @Test
  public void buildAgencyAdminSearchResult_Should_havePreviousLink_When_currentPageIsNotTheFirst() {
    AgencyAdminSearchResultDTO agencyAdminSearchResultDTO = this.agencyAdminSearchResultBuilder
        .buildAgencyAdminSearchResult("q", 10, 20);

    SearchResultLinks searchResultLinks = agencyAdminSearchResultDTO.getLinks();
    assertThat(searchResultLinks.getPrevious(), notNullValue());
    assertThat(searchResultLinks.getPrevious().getHref(),
        endsWith("/admin/agencies?page=9&perPage=20&q=q"));
  }

}
