package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;

import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.PaginationLinks;
import org.junit.Test;

public class DiocesePaginationLinkBuilderTest {

  @Test
  public void buildPaginationLinks_Should_returnPaginationLinks_When_allParametersAreSet() {
    PaginationLinks paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(2)
        .withPerPage(20)
        .withTotalPages(5)
        .buildPaginationLinks();

    assertThat(paginationLinks, notNullValue());
    assertThat(paginationLinks.getSelf(), notNullValue());
    assertThat(paginationLinks.getSelf().getMethod(), is(MethodEnum.GET));
    assertThat(paginationLinks.getSelf().getHref(),
        is("/agencyadmin/dioceses?page=2&perPage=20"));
    assertThat(paginationLinks.getPrevious(), notNullValue());
    assertThat(paginationLinks.getPrevious().getMethod(), is(MethodEnum.GET));
    assertThat(paginationLinks.getPrevious().getHref(),
        is("/agencyadmin/dioceses?page=1&perPage=20"));
    assertThat(paginationLinks.getNext(), notNullValue());
    assertThat(paginationLinks.getNext().getMethod(), is(MethodEnum.GET));
    assertThat(paginationLinks.getNext().getHref(),
        is("/agencyadmin/dioceses?page=3&perPage=20"));
  }

  @Test
  public void buildPaginationLinks_Should_havePreviousLink_When_currentPageIsNotTheFirst() {
    PaginationLinks paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(2)
        .withPerPage(20)
        .withTotalPages(5)
        .buildPaginationLinks();

    assertThat(paginationLinks.getPrevious(), notNullValue());
    assertThat(paginationLinks.getPrevious().getHref(),
        endsWith("/agencyadmin/dioceses?page=1&perPage=20"));
  }

  @Test
  public void buildPaginationLinks_ShouldNot_havePreviousLink_When_currentPageIsTheFirst() {
    PaginationLinks paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(1)
        .withPerPage(20)
        .withTotalPages(5)
        .buildPaginationLinks();

    assertThat(paginationLinks.getPrevious(), nullValue());
  }

  @Test
  public void buildPaginationLinks_Should_haveNextLink_When_currentPageIsNotTheLast() {
    PaginationLinks paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(2)
        .withPerPage(20)
        .withTotalPages(5)
        .buildPaginationLinks();

    assertThat(paginationLinks.getNext(), notNullValue());
    assertThat(paginationLinks.getNext().getHref(),
        endsWith("/agencyadmin/dioceses?page=3&perPage=20"));
  }

  @Test
  public void buildPaginationLinks_ShouldNot_haveNextLink_When_currentPageIsTheLast() {
    PaginationLinks paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(5)
        .withPerPage(20)
        .withTotalPages(5)
        .buildPaginationLinks();

    assertThat(paginationLinks.getNext(), nullValue());
  }

  @Test
  public void buildPaginationLinks_Should_returnPlaceHolderSelfLink_When_keywordIsNotSet() {
    PaginationLinks paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(1)
        .withPerPage(20)
        .buildPaginationLinks();

    assertThat(paginationLinks, notNullValue());
    assertThat(paginationLinks.getSelf().getHref(),
        is("/agencyadmin/dioceses?page=1&perPage=20"));
  }

  @Test
  public void buildPaginationLinks_Should_returnDefaultPaginationValues_When_noParametersAreSet() {
    PaginationLinks paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .buildPaginationLinks();

    assertThat(paginationLinks, notNullValue());
    assertThat(paginationLinks.getSelf().getHref(),
        is("/agencyadmin/dioceses?page=1&perPage=20"));
  }
}
