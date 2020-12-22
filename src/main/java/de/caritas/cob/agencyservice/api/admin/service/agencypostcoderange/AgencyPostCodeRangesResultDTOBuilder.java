package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import de.caritas.cob.agencyservice.api.admin.hallink.HalLinkBuilder;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangesResultDTO;
import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.PaginationLinks;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.data.domain.Page;

/**
 * Builder class to generate a {@link AgencyPostcodeRangesResultDTO} containing navigation hal
 * links.
 */
public class AgencyPostCodeRangesResultDTOBuilder implements HalLinkBuilder {

  private Integer page;
  private Integer perPage;
  private Long agencyId;
  private Page<AgencyPostCodeRange> resultPage;

  private AgencyPostCodeRangesResultDTOBuilder() {
  }

  /**
   * Creates a builder instance of {@link AgencyPostCodeRangesResultDTOBuilder}.
   *
   * @return a instance of {@link AgencyPostCodeRangesResultDTOBuilder}
   */
  public static AgencyPostCodeRangesResultDTOBuilder getInstance() {
    return new AgencyPostCodeRangesResultDTOBuilder();
  }

  /**
   * Sets the page param.
   *
   * @param page the current page
   * @return the current {@link AgencyPostCodeRangesResultDTOBuilder}
   */
  public AgencyPostCodeRangesResultDTOBuilder withPage(Integer page) {
    this.page = page;
    return this;
  }

  /**
   * Sets the per page param.
   *
   * @param perPage the current limit for one page
   * @return the current {@link AgencyPostCodeRangesResultDTOBuilder}
   */
  public AgencyPostCodeRangesResultDTOBuilder withPerPage(Integer perPage) {
    this.perPage = perPage;
    return this;
  }

  /**
   * Sets agency id.
   *
   * @param agencyId the current agency id
   * @return the current {@link AgencyPostCodeRangesResultDTOBuilder}
   */
  public AgencyPostCodeRangesResultDTOBuilder withAgencyId(Long agencyId) {
    this.agencyId = agencyId;
    return this;
  }

  /**
   * Sets result page.
   *
   * @param resultPage the paginated result of {@link AgencyPostCodeRange}
   * @return the current {@link AgencyPostCodeRangesResultDTOBuilder}
   */
  public AgencyPostCodeRangesResultDTOBuilder withResultPage(Page<AgencyPostCodeRange> resultPage) {
    this.resultPage = resultPage;
    return this;
  }

  /**
   * Generates the {@link AgencyPostcodeRangesResultDTO} containing navigation hal links.
   *
   * @return the created {@link AgencyPostcodeRangesResultDTO}
   */
  public AgencyPostcodeRangesResultDTO build() {
    List<AgencyPostcodeRangeResponseDTO> postCodeRanges = this.resultPage.get()
        .map(AgencyPostcodeRangeResponseDTOBuilder::getInstance)
        .map(AgencyPostcodeRangeResponseDTOBuilder::build)
        .collect(Collectors.toList());

    PaginationLinks postCodeRangeLinks = new PaginationLinks()
        .self(buildSelfLink())
        .next(buildNextLink())
        .previous(buildPreviousLink());

    return new AgencyPostcodeRangesResultDTO()
        .embedded(postCodeRanges)
        .links(postCodeRangeLinks);
  }

  private HalLink buildSelfLink() {
    return buildLinkWithParams(this.page, this.perPage);
  }

  private HalLink buildLinkWithParams(Integer page, Integer perPage) {
    return buildHalLink(methodOn(AgencyadminApi.class).getAgencyPostcodeRanges(this.agencyId,
        page, perPage), MethodEnum.GET);
  }

  private HalLink buildNextLink() {
    return hasNextPage() ? buildLinkWithParams(this.page + 1, this.perPage) : null;
  }

  private boolean hasNextPage() {
    return this.resultPage.getTotalElements() > (long) this.page * this.perPage;
  }

  private HalLink buildPreviousLink() {
    return this.page > 1 ? buildLinkWithParams(this.page - 1, this.perPage) : null;
  }


}
