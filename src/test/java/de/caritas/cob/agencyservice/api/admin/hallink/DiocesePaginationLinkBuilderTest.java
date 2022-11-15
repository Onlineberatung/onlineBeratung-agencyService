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
class DiocesePaginationLinkBuilderTest {

  @Test
  void buildPaginationLinks_Should_returnPaginationLinks_When_allParametersAreSet() {
    var paginationLinks = DiocesePaginationLinkBuilder.getInstance()
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
  void buildPaginationLinks_Should_havePreviousLink_When_currentPageIsNotTheFirst() {
    var paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(2)
        .withPerPage(20)
        .withTotalPages(5)
        .buildPaginationLinks();

    assertThat(paginationLinks.getPrevious(), notNullValue());
    assertThat(paginationLinks.getPrevious().getHref(),
        endsWith("/agencyadmin/dioceses?page=1&perPage=20"));
  }

  @Test
  void buildPaginationLinks_ShouldNot_havePreviousLink_When_currentPageIsTheFirst() {
    var paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(1)
        .withPerPage(20)
        .withTotalPages(5)
        .buildPaginationLinks();

    assertThat(paginationLinks.getPrevious(), nullValue());
  }

  @Test
  void buildPaginationLinks_Should_haveNextLink_When_currentPageIsNotTheLast() {
    var paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(2)
        .withPerPage(20)
        .withTotalPages(5)
        .buildPaginationLinks();

    assertThat(paginationLinks.getNext(), notNullValue());
    assertThat(paginationLinks.getNext().getHref(),
        endsWith("/agencyadmin/dioceses?page=3&perPage=20"));
  }

  @Test
  void buildPaginationLinks_ShouldNot_haveNextLink_When_currentPageIsTheLast() {
    var paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(5)
        .withPerPage(20)
        .withTotalPages(5)
        .buildPaginationLinks();

    assertThat(paginationLinks.getNext(), nullValue());
  }

  @Test
  void buildPaginationLinks_Should_returnSelfLink() {
    var paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .withPage(1)
        .withPerPage(20)
        .buildPaginationLinks();

    assertThat(paginationLinks, notNullValue());
    assertThat(paginationLinks.getSelf().getHref(),
        is("/agencyadmin/dioceses?page=1&perPage=20"));
  }

  @Test
  void buildPaginationLinks_Should_returnDefaultPaginationValues_When_noParametersAreSet() {
    var paginationLinks = DiocesePaginationLinkBuilder.getInstance()
        .buildPaginationLinks();

    assertThat(paginationLinks, notNullValue());
    assertThat(paginationLinks.getSelf().getHref(),
        is("/agencyadmin/dioceses?page=1&perPage=20"));
  }
}
