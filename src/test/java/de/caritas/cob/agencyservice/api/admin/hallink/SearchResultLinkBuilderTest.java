package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;

import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.SearchResultLinks;
import org.junit.Test;

public class SearchResultLinkBuilderTest {

  @Test
  public void buildSearchResultLinks_Should_returnSearchResultLinks_When_allParametersAreSet() {
    SearchResultLinks searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withKeyword("keyword")
        .withPage(2)
        .withPerPage(20)
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
  public void buildSearchResultLinks_Should_returnNoPreviousLink_When_pageIsTheFirst() {
    SearchResultLinks searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withKeyword("keyword")
        .withPage(1)
        .withPerPage(20)
        .buildSearchResultLinks();

    assertThat(searchResultLinks, notNullValue());
    assertThat(searchResultLinks.getPrevious(), nullValue());
  }

  @Test
  public void buildSearchResultLinks_Should_returnPlaceHolderSelfLink_When_keywordIsNotSet() {
    SearchResultLinks searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withPage(1)
        .withPerPage(20)
        .buildSearchResultLinks();

    assertThat(searchResultLinks, notNullValue());
    assertThat(searchResultLinks.getSelf().getHref(), is("/agencyadmin/agencies?page=1&perPage=20{&q}"));
  }

  @Test
  public void buildSearchResultLinks_Should_returnDefaultPaginationValues_When_noParametersAreSet() {
    SearchResultLinks searchResultLinks = SearchResultLinkBuilder.getInstance()
        .buildSearchResultLinks();

    assertThat(searchResultLinks, notNullValue());
    assertThat(searchResultLinks.getSelf().getHref(), is("/agencyadmin/agencies?page=1&perPage=20{&q}"));
  }

}
