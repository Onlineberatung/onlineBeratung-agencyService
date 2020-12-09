package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyAdminSearchService;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyAdminSearchResultDTO;
import de.caritas.cob.agencyservice.api.model.SearchResultLinks;
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
public class AgencyAdminSearchServiceIT {

  @Autowired
  private AgencyAdminSearchService agencyAdminSearchService;

  @Test
  public void searchAgencies_Should_returnOneResult_When_perPageIsSetToOne() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("", 0, 1)
        .getEmbedded();

    assertThat(agencies, hasSize(1));
  }

  @Test
  public void searchAgencies_Should_returnOneResult_When_perPageIsSetToOneAndPageIsSetToOne() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("", 1, 1)
        .getEmbedded();

    assertThat(agencies, hasSize(1));
  }

  @Test
  public void searchAgencies_Should_returnEmptyList_When_paginationParamsAreZero() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies(null, 0, 0)
        .getEmbedded();

    assertThat(agencies, hasSize(0));
  }

  @Test
  public void searchAgencies_Should_returnEmptyList_When_paginationParamsAreNegative() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies(null, -100, -1000)
        .getEmbedded();

    assertThat(agencies, hasSize(0));
  }

  @Test
  public void searchAgencies_Should_returnAllEntities_When_keywordIsNull() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies(null, 0, 1133)
        .getEmbedded();

    assertThat(agencies, hasSize(1133));
  }

  @Test
  public void searchAgencies_Should_returnAllEntities_When_keywordIsEmpty() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("", 0, 1133)
        .getEmbedded();

    assertThat(agencies, hasSize(1133));
  }

  @Test
  public void searchAgencies_Should_returnPaginatedEntities_When_paginationParamsAreSplitted() {
    List<AgencyAdminResponseDTO> firstPage = this.agencyAdminSearchService
        .searchAgencies("", 1, 1000)
        .getEmbedded();
    List<AgencyAdminResponseDTO> secondPage = this.agencyAdminSearchService
        .searchAgencies("", 2, 1000)
        .getEmbedded();

    assertThat(firstPage, hasSize(1000));
    assertThat(secondPage, hasSize(133));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_nameContainsDashIndexedValues() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("Oberschwaben", 0, 2)
        .getEmbedded();

    agencies.forEach(agency -> assertThat(agency.getName(), containsString("Oberschwaben")));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_keywordIsValidPlz() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("88662", 0, 5)
        .getEmbedded();

    agencies.forEach(agency -> assertThat(agency.getCity(), is("Überlingen")));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_keywordIsContainedInDifferentFields() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("1", 0, 500)
        .getEmbedded();

    agencies.forEach(agency -> {
      String resultSet = agency.getCity()
          + agency.getName()
          + agency.getPostcode()
          + agency.getDioceseId().toString();
      assertThat(resultSet, containsString("1"));
    });
  }

  @Test
  public void searchAgencies_Should_returnFirstMatchOnDioceseId_When_keywordIsValidDioceseId() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("1", 0, 5)
        .getEmbedded();

    AgencyAdminResponseDTO firstResult = agencies.get(0);
    assertThat(firstResult.getDioceseId(), is(1L));
  }

  @Test
  public void searchAgencies_Should_returnValidResult_When_keywordareSpecialCharacters() {
    String specialChars = "!§$%&/()=?#'*+`^^><";

    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies(specialChars, 0, 5)
        .getEmbedded();

    assertThat(agencies, notNullValue());
  }

  @Test
  public void buildAgencyAdminSearchResult_Should_returnExpectedMappedResponseDTO_When_searchForSpecialAgency() {
    String keyword = "Schwangerschaftsberatungsstelle";

    AgencyAdminResponseDTO firstSearchResult = this.agencyAdminSearchService
        .searchAgencies(keyword, 0, 1).getEmbedded().iterator().next();

    assertThat(firstSearchResult.getAgencyId(), is(846L));
    assertThat(firstSearchResult.getCity(), is("Schwelm"));
    assertThat(firstSearchResult.getConsultingType(), is(2));
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
  public void buildAgencyAdminSearchResult_Should_returnEmptyListForPostCodeRanges_When_searchForAgencyWithoutPostcodeRanges() {
    String keyword = "Kreis-Caritasverband Burghausen e.V.";

    AgencyAdminResponseDTO firstSearchResult = this.agencyAdminSearchService
        .searchAgencies(keyword, 0, 1).getEmbedded().iterator().next();

    assertThat(firstSearchResult.getPostCodeRanges(), hasSize(0));
  }

  @Test
  public void buildAgencyAdminSearchResult_Should_haveExpectedLinks_When_search() {
    AgencyAdminSearchResultDTO agencyAdminSearchResultDTO = this.agencyAdminSearchService
        .searchAgencies("a", 1, 20);

    SearchResultLinks searchResultLinks = agencyAdminSearchResultDTO.getLinks();
    assertThat(searchResultLinks.getSelf(), notNullValue());
    assertThat(searchResultLinks.getSelf().getHref(),
        endsWith("/agencyadmin/agencies?page=1&perPage=20&q=a"));
    assertThat(searchResultLinks.getPrevious(), nullValue());
    assertThat(searchResultLinks.getNext(), notNullValue());
    assertThat(searchResultLinks.getNext().getHref(),
        endsWith("/agencyadmin/agencies?page=2&perPage=20&q=a"));
    assertThat(searchResultLinks.getSearch(), notNullValue());
    assertThat(searchResultLinks.getSearch().getHref(),
        endsWith("/agencyadmin/agencies?page=1&perPage=20{&q}"));
  }
}
