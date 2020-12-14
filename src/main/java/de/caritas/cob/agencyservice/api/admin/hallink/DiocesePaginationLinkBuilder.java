package de.caritas.cob.agencyservice.api.admin.hallink;

import static de.caritas.cob.agencyservice.api.admin.hallink.RootDTOBuilder.DEFAULT_PAGE;
import static de.caritas.cob.agencyservice.api.admin.hallink.RootDTOBuilder.DEFAULT_PER_PAGE;
import static de.caritas.cob.agencyservice.api.admin.hallink.RootDTOBuilder.DEFAULT_TOTAL_PAGES;
import static java.util.Objects.nonNull;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.PaginationLinks;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;

public class DiocesePaginationLinkBuilder implements HalLinkBuilder {

  private Integer page;
  private Integer perPage;
  private Integer totalPages;

  private DiocesePaginationLinkBuilder() {
  }

  /**
   * Creates a {@link DiocesePaginationLinkBuilder} instance.
   *
   * @return an instance of {@link DiocesePaginationLinkBuilder}
   */
  public static DiocesePaginationLinkBuilder getInstance() {
    return new DiocesePaginationLinkBuilder();
  }

  /**
   * Sets the page param.
   *
   * @param page the page value for building links
   * @return the current {@link DiocesePaginationLinkBuilder}
   */
  public DiocesePaginationLinkBuilder withPage(Integer page) {
    this.page = page;
    return this;
  }

  /**
   * Sets the perPage param.
   *
   * @param perPage the amount value of results per page for building links
   * @return the current {@link DiocesePaginationLinkBuilder}
   */
  public DiocesePaginationLinkBuilder withPerPage(Integer perPage) {
    this.perPage = perPage;
    return this;
  }

  /**
   * Sets the totalPages param.
   *
   * @param totalPages the amaount of total page results
   * @return the current {@link DiocesePaginationLinkBuilder}
   */
  public DiocesePaginationLinkBuilder withTotalPages(Integer totalPages) {
    this.totalPages = totalPages;
    return this;
  }

  /**
   * Creates the {@link PaginationLinks}.
   *
   * @return the generated {@link PaginationLinks}
   */
  public PaginationLinks buildPaginationLinks() {
    ensureNonNullPaginationParams();
    return new PaginationLinks()
        .self(buildSelfLink())
        .next(buildNextLink())
        .previous(buildPreviousLink());
  }

  private void ensureNonNullPaginationParams() {
    this.page = nonNull(this.page) ? this.page : DEFAULT_PAGE;
    this.perPage = nonNull(this.perPage) ? this.perPage : DEFAULT_PER_PAGE;
    this.totalPages = nonNull(this.totalPages) ? this.totalPages : DEFAULT_TOTAL_PAGES;
  }

  private HalLink buildSelfLink() {
    return buildHalLinkForParams(this.page, this.perPage);
  }

  private HalLink buildHalLinkForParams(Integer page, Integer perPage) {
    return buildHalLink(methodOn(AgencyadminApi.class).getDioceses(page, perPage),
        MethodEnum.GET);
  }

  private HalLink buildNextLink() {
    return hasNextPage() ? buildHalLinkForParams(this.page + 1, this.perPage) : null;
  }

  private boolean hasNextPage() {
    return nonNull(this.totalPages) && this.page < this.totalPages;
  }

  private HalLink buildPreviousLink() {
    return hasPreviousPage() ? buildHalLinkForParams(this.page - 1, this.perPage) :
        null;
  }

  private boolean hasPreviousPage() {
    return this.page > 1;
  }
}