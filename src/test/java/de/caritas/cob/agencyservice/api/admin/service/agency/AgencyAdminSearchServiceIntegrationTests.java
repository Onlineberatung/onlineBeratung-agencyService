package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.util.AuthenticatedUser;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyAdminSearchResultDTO;
import de.caritas.cob.agencyservice.api.model.AgencyLinks;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.SearchResultLinks;
import de.caritas.cob.agencyservice.api.model.Sort;
import de.caritas.cob.agencyservice.api.model.Sort.FieldEnum;
import de.caritas.cob.agencyservice.api.model.Sort.OrderEnum;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
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
public class AgencyAdminSearchServiceIntegrationTests {

  @Autowired
  private AgencyAdminSearchService agencyAdminSearchService;

  @MockBean
  AuthenticatedUser authenticatedUser;

  @BeforeEach
  public void setUp() {
    Mockito.when(authenticatedUser.hasRestrictedAgencyPriviliges()).thenReturn(false);
  }

  @Test
  public void searchAgencies_Should_returnOneResult_When_perPageIsSetToOne() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("", 0, 1, null)
        .getEmbedded();

    assertThat(agencies, hasSize(1));
  }

  @Test
  public void searchAgencies_Should_returnOneResult_When_perPageIsSetToOneAndPageIsSetToOne() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("", 1, 1, null)
        .getEmbedded();

    assertThat(agencies, hasSize(1));
  }

  @Test
  public void searchAgencies_Should_returnEmptyList_When_paginationParamsAreZero() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies(null, 0, 0, null)
        .getEmbedded();

    assertThat(agencies, hasSize(0));
  }

  @Test
  public void searchAgencies_Should_returnEmptyList_When_paginationParamsAreNegative() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies(null, -100, -1000, null)
        .getEmbedded();

    assertThat(agencies, hasSize(0));
  }

  @Test
  public void searchAgencies_Should_returnAllEntities_When_keywordIsNull() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies(null, 0, 1133, null)
        .getEmbedded();

    assertThat(agencies, hasSize(1133));
  }

  @Test
  public void searchAgencies_Should_returnEntitiesSorted_When_SortParameterGiven() {
    Sort sort = new Sort();
    sort.setField(FieldEnum.NAME);
    sort.setOrder(OrderEnum.ASC);
    List<String> agenciesSorted = this.agencyAdminSearchService
        .searchAgencies(null, 1, 5, sort)
        .getEmbedded().stream().map(el -> el.getEmbedded().getName()).collect(Collectors.toList());

    Set<Character> collect = agenciesSorted.stream().map(e -> e.charAt(0))
        .collect(Collectors.toSet());

    Assertions.assertEquals(collect, Set.of('#', ' '));


    sort.setField(FieldEnum.NAME);
    sort.setOrder(OrderEnum.DESC);
    agenciesSorted = this.agencyAdminSearchService
        .searchAgencies(null, 1, 2, sort)
        .getEmbedded().stream().map(el -> el.getEmbedded().getName())
        .collect(Collectors.toList());

    // cannot force collation for H2, but for MariaDB it will use proper utf8_unicode_ci due to usage of lower function which by default uses utf8_unicode_ci
    agenciesSorted.forEach(el -> {
      Assertions.assertEquals('Ö', el.charAt(0));
    });
  }


  @Test
  public void searchAgencies_Should_returnAllEntities_When_keywordIsEmpty() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("", 0, 1133, null)
        .getEmbedded();

    assertThat(agencies, hasSize(1133));
  }

  @Test
  public void searchAgencies_Should_returnPaginatedEntities_When_paginationParamsAreSplitted() {
    List<AgencyAdminFullResponseDTO> firstPage = this.agencyAdminSearchService
        .searchAgencies("", 1, 1000, null)
        .getEmbedded();
    List<AgencyAdminFullResponseDTO> secondPage = this.agencyAdminSearchService
        .searchAgencies("", 2, 1000, null)
        .getEmbedded();

    assertThat(firstPage, hasSize(1000));
    assertThat(secondPage, hasSize(138));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_nameContainsDashIndexedValues() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("Oberschwaben", 0, 2, null)
        .getEmbedded();

    agencies.forEach(
        agency -> assertThat(agency.getEmbedded().getName(), containsString("Oberschwaben")));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_nameContainsUmlautReplacements() {
    agencyAdminSearchService
        .searchAgencies("Uberlingen", 0, 4, null)
        .getEmbedded()
        .forEach(agency ->
            assertThat(agency.getEmbedded().getName(), containsString("Überlingen"))
        );
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_nameContainsUmlauts() {
    agencyAdminSearchService
        .searchAgencies("Überlingen", 0, 2, null)
        .getEmbedded()
        .forEach(
            agency -> assertThat((agency.getEmbedded().getName().contains("Überlingen") || agency.getEmbedded().getCity().contains("Überlingen")),  is(true))
        );
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_keywordIsValidPlz() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("88662", 0, 5, null)
        .getEmbedded();

    agencies.forEach(agency -> assertThat(agency.getEmbedded().getCity(), is("Überlingen")));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_keywordIsContainedInDifferentFields() {
    List<AgencyAdminFullResponseDTO> agencies = this.agencyAdminSearchService
        .searchAgencies("1", 0, 500, null)
        .getEmbedded();

    agencies.forEach(agency -> {
      String resultSet = agency.getEmbedded().getCity()
          + agency.getEmbedded().getName()
          + agency.getEmbedded().getPostcode();
      assertThat(resultSet, containsString("1"));
    });
  }

  @Test
  public void searchAgencies_Should_returnValidResult_When_keywordContainsOnlySpecialCharacters() {
    var agencies = agencyAdminSearchService
        .searchAgencies("§$%=#'`><", 0, 5, null)
        .getEmbedded();

    assertThat(agencies, notNullValue());
  }

  @Test
  public void searchAgencies_Should_returnValidResult_When_keywordHasSpecialCharacters() {
    var specialChars = "halle§$%=#'`><";

    var agencies = agencyAdminSearchService
        .searchAgencies(specialChars, 0, 5, null)
        .getEmbedded();

    assertThat(agencies, notNullValue());
  }

  @Test
  public void searchAgencies_Should_returnValidResult_When_keywordHasLuceneQuerySyntax() {
    var specialChars = "halle+-&|!(){}[]^\"~*?:\\/";

    var agencies = agencyAdminSearchService
        .searchAgencies(specialChars, 0, 5, null)
        .getEmbedded();

    assertThat(agencies, notNullValue());
  }

  @Test
  public void buildAgencyAdminSearchResult_Should_returnExpectedMappedResponseDTO_When_searchForSpecialAgency() {
    String keyword = "Schwangerschaftsberatungsstelle Sch";

    AgencyAdminFullResponseDTO firstSearchResult = this.agencyAdminSearchService
        .searchAgencies(keyword, 0, 1, new Sort().field(FieldEnum.NAME).order(OrderEnum.DESC)).getEmbedded().iterator().next();

    assertThat(firstSearchResult.getEmbedded().getId(), is(846L));
    assertThat(firstSearchResult.getEmbedded().getCity(), is("Schwelm"));
    assertThat(firstSearchResult.getEmbedded().getConsultingType(), is(2));
    assertThat(firstSearchResult.getEmbedded().getCreateDate(), is("2019-08-23T06:52:05"));
    assertThat(firstSearchResult.getEmbedded().getUpdateDate(), is("2019-08-23T06:52:05"));
    assertThat(firstSearchResult.getEmbedded().getDeleteDate(), is("null"));
    assertThat(firstSearchResult.getEmbedded().getName(),
        is("Schwangerschaftsberatungsstelle Schwelm"));
    assertThat(firstSearchResult.getEmbedded().getOffline(), is(false));
    assertThat(firstSearchResult.getEmbedded().getPostcode(), is("58332"));
    assertThat(firstSearchResult.getEmbedded().getTeamAgency(), is(false));
    assertThat(firstSearchResult.getEmbedded().getUrl(), is("https://www.domain.com"));
    assertThat(firstSearchResult.getEmbedded().getExternal(), is(true));

  }

  @Test
  public void buildAgencyAdminSearchResult_Should_haveExpectedLinks_When_search() {
    AgencyAdminSearchResultDTO agencyAdminSearchResultDTO = this.agencyAdminSearchService
        .searchAgencies("a", 1, 20, null);

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
    AgencyAdminSearchResultDTO searchResult = this.agencyAdminSearchService
        .searchAgencies("", 0, 2, null);

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
      assertThat(agencyLinks.getPostcodeRanges(), notNullValue());
      assertThat(agencyLinks.getPostcodeRanges().getMethod(), is(MethodEnum.GET));
      assertThat(agencyLinks.getPostcodeRanges().getHref(),
          endsWith(String.format("/agencyadmin/postcoderanges/%s", result.getEmbedded().getId())));
    }
  }
}
