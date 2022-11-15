package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;

import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class SearchResultLinkBuilderTest {

  @Test
  void buildSearchResultLinks_Should_returnSearchResultLinks_When_allParametersAreSet() {
    var searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withKeyword("keyword")
        .withPage(2)
        .withPerPage(20)
        .withTotalResults(50)
        .buildSearchResultLinks();

    assertThat(searchResultLinks, notNullValue());
    assertThat(searchResultLinks.getSelf(), notNullValue());
    assertThat(searchResultLinks.getSelf().getMethod(), is(MethodEnum.GET));
    assertThat(searchResultLinks.getSelf().getHref(),
        is("/agencyadmin/agencies?page=2&perPage=20&q=keyword"));
    assertThat(searchResultLinks.getPrevious(), notNullValue());
    assertThat(searchResultLinks.getPrevious().getMethod(), is(MethodEnum.GET));
    assertThat(searchResultLinks.getPrevious().getHref(),
        is("/agencyadmin/agencies?page=1&perPage=20&q=keyword"));
    assertThat(searchResultLinks.getNext(), notNullValue());
    assertThat(searchResultLinks.getNext().getMethod(), is(MethodEnum.GET));
    assertThat(searchResultLinks.getNext().getHref(),
        is("/agencyadmin/agencies?page=3&perPage=20&q=keyword"));
    assertThat(searchResultLinks.getSearch(), notNullValue());
    assertThat(searchResultLinks.getSearch().getMethod(), is(MethodEnum.GET));
    assertThat(searchResultLinks.getSearch().getHref(),
        is("/agencyadmin/agencies?page=2&perPage=20{&q}"));
  }

  @Test
  void buildAgencyAdminSearchResult_Should_havePreviousLink_When_currentPageIsNotTheFirst() {
    var searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withKeyword("keyword")
        .withPage(2)
        .withPerPage(20)
        .withTotalResults(50)
        .buildSearchResultLinks();

    assertThat(searchResultLinks.getPrevious(), notNullValue());
    assertThat(searchResultLinks.getPrevious().getHref(),
        endsWith("/agencyadmin/agencies?page=1&perPage=20&q=keyword"));
  }

  @Test
  void buildAgencyAdminSearchResult_ShouldNot_havePreviousLink_When_currentPageIsTheFirst() {
    var searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withKeyword("keyword")
        .withPage(1)
        .withPerPage(20)
        .withTotalResults(50)
        .buildSearchResultLinks();

    assertThat(searchResultLinks.getPrevious(), nullValue());
  }

  @Test
  void buildAgencyAdminSearchResult_Should_haveNextLink_When_currentPageIsNotTheLast() {
    var searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withKeyword("keyword")
        .withPage(2)
        .withPerPage(20)
        .withTotalResults(50)
        .buildSearchResultLinks();

    assertThat(searchResultLinks.getNext(), notNullValue());
    assertThat(searchResultLinks.getNext().getHref(),
        endsWith("/agencyadmin/agencies?page=3&perPage=20&q=keyword"));
  }

  @Test
  void buildAgencyAdminSearchResult_ShouldNot_haveNextLink_When_currentPageIsTheLast() {
    var searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withKeyword("keyword")
        .withPage(3)
        .withPerPage(20)
        .withTotalResults(50)
        .buildSearchResultLinks();

    assertThat(searchResultLinks.getNext(), nullValue());
  }

  @Test
  void buildSearchResultLinks_Should_returnPlaceHolderSelfLink_When_keywordIsNotSet() {
    var searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withPage(1)
        .withPerPage(20)
        .buildSearchResultLinks();

    assertThat(searchResultLinks, notNullValue());
    assertThat(searchResultLinks.getSelf().getHref(),
        is("/agencyadmin/agencies?page=1&perPage=20{&q}"));
  }

  @Test
  void buildSearchResultLinks_Should_returnDefaultPaginationValues_When_noParametersAreSet() {
    var searchResultLinks = SearchResultLinkBuilder.getInstance()
        .buildSearchResultLinks();

    assertThat(searchResultLinks, notNullValue());
    assertThat(searchResultLinks.getSelf().getHref(),
        is("/agencyadmin/agencies?page=1&perPage=20{&q}"));
  }

}
