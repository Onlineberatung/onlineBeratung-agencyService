package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.SearchResultLinks;
import de.caritas.cob.agencyservice.generated.api.controller.AdminApi;

/**
 * Link builder to create hal links for search results.
 */
public class SearchResultLinkBuilder implements HalLinkBuilder {

  private Integer page;
  private Integer perPage;
  private String keyword;

  private SearchResultLinkBuilder() {}

  /**
   * Creates an {@link SearchResultLinkBuilder} instance.
   *
   * @return a instance of {@link SearchResultLinkBuilder}
   */
  public static SearchResultLinkBuilder getInstance() {
    return new SearchResultLinkBuilder();
  }

  /**
   * Sets the page param.
   *
   * @param page the page value for building links
   * @return the current {@link SearchResultLinkBuilder}
   */
  public SearchResultLinkBuilder withPage(Integer page) {
    this.page = page;
    return this;
  }

  /**
   * Sets the perPage param.
   *
   * @param perPage the amount value of results per page for building links
   * @return the current {@link SearchResultLinkBuilder}
   */
  public SearchResultLinkBuilder withPerPage(Integer perPage) {
    this.perPage = perPage;
    return this;
  }

  /**
   * Sets the keyword search param.
   *
   * @param keyword the keyword value for building links
   * @return the current {@link SearchResultLinkBuilder}
   */
  public SearchResultLinkBuilder withKeyword(String keyword) {
    this.keyword = keyword;
    return this;
  }

  /**
   * Creates the {@link SearchResultLinks}.
   *
   * @return the generated {@link SearchResultLinks}
   */
  public SearchResultLinks buildSearchResultLinks() {
    return new SearchResultLinks()
        .self(buildSelfLink())
        .next(buildNextLink())
        .previous(buildPreviousLink())
        .search(buildSearchLink());
  }

  private HalLink buildSelfLink() {
    return buildHalLinkForParams(this.page, this.perPage, this.keyword);
  }

  private HalLink buildHalLinkForParams(Integer page, Integer perPage, String keyword) {
    return buildHalLink(methodOn(AdminApi.class).searchAgencies(page, perPage, keyword),
        MethodEnum.GET);
  }

  private HalLink buildNextLink() {
    return buildHalLinkForParams(this.page + 1, this.perPage, this.keyword);
  }

  private HalLink buildPreviousLink() {
    if (this.page > 1) {
      return buildHalLinkForParams(this.page - 1, this.perPage, this.keyword);
    }
    return null;
  }

  private HalLink buildSearchLink() {
    return buildHalLinkForParams(this.page, this.perPage, null);
  }

}
