package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyAdminSearchResultDTO;
import de.caritas.cob.agencyservice.api.model.AgencyLinks;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.SearchResultLinks;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.annotation.DirtiesContext.ClassMode;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
@DirtiesContext(classMode = ClassMode.BEFORE_CLASS)
public class AgencyAdminFullResponseDTOIT {

  @Autowired
  private AgencyAdminSearchService agencyAdminFullResponseDTO;

  @Test
  public void searchAgencies_Should_returnOneResult_When_perPageIsSetToOne() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies("", 0, 1)
        .getEmbedded();

    assertThat(agencies, hasSize(1));
  }

  @Test
  public void searchAgencies_Should_returnOneResult_When_perPageIsSetToOneAndPageIsSetToOne() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies("", 1, 1)
        .getEmbedded();

    assertThat(agencies, hasSize(1));
  }

  @Test
  public void searchAgencies_Should_returnEmptyList_When_paginationParamsAreZero() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies(null, 0, 0)
        .getEmbedded();

    assertThat(agencies, hasSize(0));
  }

  @Test
  public void searchAgencies_Should_returnEmptyList_When_paginationParamsAreNegative() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies(null, -100, -1000)
        .getEmbedded();

    assertThat(agencies, hasSize(0));
  }

  @Test
  public void searchAgencies_Should_returnAllEntities_When_keywordIsNull() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies(null, 0, 1133)
        .getEmbedded();

    assertThat(agencies, hasSize(1133));
  }

  @Test
  public void searchAgencies_Should_returnAllEntities_When_keywordIsEmpty() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies("", 0, 1133)
        .getEmbedded();

    assertThat(agencies, hasSize(1133));
  }

  @Test
  public void searchAgencies_Should_returnPaginatedEntities_When_paginationParamsAreSplitted() {
    List<AgencyAdminFullResponseDTO> firstPage = this.agencyAdminFullResponseDTO
        .searchAgencies("", 1, 1000)
        .getEmbedded();
    List<AgencyAdminFullResponseDTO> secondPage = this.agencyAdminFullResponseDTO
        .searchAgencies("", 2, 1000)
        .getEmbedded();

    assertThat(firstPage, hasSize(1000));
    assertThat(secondPage, hasSize(134));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_nameContainsDashIndexedValues() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies("Oberschwaben", 0, 2)
        .getEmbedded();

    agencies.forEach(agency -> assertThat(agency.getEmbedded().getName(), containsString("Oberschwaben")));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_keywordIsValidPlz() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies("88662", 0, 5)
        .getEmbedded();

    agencies.forEach(agency -> assertThat(agency.getEmbedded().getCity(), is("Überlingen")));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_keywordIsContainedInDifferentFields() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies("1", 0, 500)
        .getEmbedded();

    agencies.forEach(agency -> {
      String resultSet = agency.getEmbedded().getCity()
          + agency.getEmbedded().getName()
          + agency.getEmbedded().getPostcode()
          + agency.getEmbedded().getDioceseId().toString();
      assertThat(resultSet, containsString("1"));
    });
  }

  @Test
  public void searchAgencies_Should_returnFirstMatchOnDioceseId_When_keywordIsValidDioceseId() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies("1", 0, 5)
        .getEmbedded();

    AgencyAdminFullResponseDTO firstResult = agencies.get(0);
    assertThat(firstResult.getEmbedded().getDioceseId(), is(1L));
  }

  @Test
  public void searchAgencies_Should_returnValidResult_When_keywordareSpecialCharacters() {
    String specialChars = "!§$%&/()=?#'*+`^^><";

    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminFullResponseDTO
        .searchAgencies(specialChars, 0, 5)
        .getEmbedded();

    assertThat(agencies, notNullValue());
  }

  @Test
  public void buildAgencyAdminSearchResult_Should_returnExpectedMappedResponseDTO_When_searchForSpecialAgency() {
    String keyword = "Schwangerschaftsberatungsstelle";

    AgencyAdminFullResponseDTO firstSearchResult = this.agencyAdminFullResponseDTO
        .searchAgencies(keyword, 0, 1).getEmbedded().iterator().next();

    assertThat(firstSearchResult.getEmbedded().getId(), is(846L));
    assertThat(firstSearchResult.getEmbedded().getCity(), is("Schwelm"));
    assertThat(firstSearchResult.getEmbedded().getConsultingType(), is(2));
    assertThat(firstSearchResult.getEmbedded().getCreateDate(), is("2019-08-23T06:52:05"));
    assertThat(firstSearchResult.getEmbedded().getUpdateDate(), is("2019-08-23T06:52:05"));
    assertThat(firstSearchResult.getEmbedded().getDeleteDate(), is("null"));
    assertThat(firstSearchResult.getEmbedded().getDioceseId(), is(10L));
    assertThat(firstSearchResult.getEmbedded().getName(), is("Schwangerschaftsberatungsstelle Schwelm"));
    assertThat(firstSearchResult.getEmbedded().getOffline(), is(false));
    assertThat(firstSearchResult.getEmbedded().getPostcode(), is("58332"));
    assertThat(firstSearchResult.getEmbedded().getTeamAgency(), is(false));
    assertThat(firstSearchResult.getEmbedded().getUrl(), is("https://www.domain.com"));
    assertThat(firstSearchResult.getEmbedded().getExternal(), is(true));

  }

  @Test
  public void buildAgencyAdminSearchResult_Should_haveExpectedLinks_When_search() {
    AgencyAdminSearchResultDTO agencyAdminSearchResultDTO = this.agencyAdminFullResponseDTO
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

  @Test
  public void buildAgencyAdminSearchResult_Should_returnExpectedLinksForAgencies() {
    AgencyAdminSearchResultDTO searchResult = this.agencyAdminFullResponseDTO
        .searchAgencies("", 0, 2);

    for (AgencyAdminFullResponseDTO result : searchResult.getEmbedded()) {
      AgencyLinks agencyLinks = result.getLinks();
      assertThat(result, notNullValue());
      assertThat(agencyLinks.getSelf(), notNullValue());
      assertThat(agencyLinks.getSelf().getMethod(), is(MethodEnum.GET));
      assertThat(agencyLinks.getSelf().getHref(),
          endsWith(String.format("/agencyadmin/agencies/%s", result.getEmbedded().getId())));
      assertThat(agencyLinks.getDelete(), notNullValue());
      assertThat(agencyLinks.getDelete().getMethod(), is(MethodEnum.DELETE));
      assertThat(agencyLinks.getDelete().getHref(),
          endsWith(String.format("/agencyadmin/agencies/%s", result.getEmbedded().getId())));
      assertThat(agencyLinks.getUpdate(), notNullValue());
      assertThat(agencyLinks.getUpdate().getMethod(), is(MethodEnum.PUT));
      assertThat(agencyLinks.getUpdate().getHref(),
          endsWith(String.format("/agencyadmin/agencies/%s", result.getEmbedded().getId())));
      assertThat(agencyLinks.getPostcoderanges(), notNullValue());
      assertThat(agencyLinks.getPostcoderanges().getMethod(), is(MethodEnum.GET));
      assertThat(agencyLinks.getPostcoderanges().getHref(),
          endsWith(String.format("/agencyadmin/agencies/%s/postcoderanges?page=%s&perPage=%s", result.getEmbedded().getId(), 1, 20)));
    }
  }
}
