package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import de.caritas.cob.agencyservice.api.admin.hallink.HalLinkBuilder;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.model.DefaultLinks;
import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;
import lombok.NoArgsConstructor;

/**
 * Builder class to generate a {@link AgencyPostcodeRangeResponseDTO} containing navigation hal
 * links.
 */
@NoArgsConstructor
public class AgencyPostcodeRangeResponseDTOBuilder implements HalLinkBuilder {

  private AgencyPostCodeRange agencyPostCodeRange;

  /**
   * Creates a builder instance of {@link AgencyPostcodeRangeResponseDTOBuilder}.
   *
   * @return a instance of {@link AgencyPostcodeRangeResponseDTOBuilder}
   */
  public static AgencyPostcodeRangeResponseDTOBuilder getInstance() {
    return new AgencyPostcodeRangeResponseDTOBuilder();
  }

  /**
   * Sets the {@link AgencyPostCodeRange}.
   *
   * @param agencyPostCodeRange {@link AgencyPostCodeRange}
   * @return the current {@link AgencyPostcodeRangeResponseDTOBuilder}
   */
  public AgencyPostcodeRangeResponseDTOBuilder withAgencyPostCodeRange(
      AgencyPostCodeRange agencyPostCodeRange) {
    this.agencyPostCodeRange = agencyPostCodeRange;
    return this;
  }

  /**
   * Generates the {@link AgencyPostcodeRangeResponseDTO} containing navigation hal links.
   *
   * @return the created {@link AgencyPostcodeRangeResponseDTO}
   */
  public AgencyPostcodeRangeResponseDTO build() {
    return new AgencyPostcodeRangeResponseDTO()
        .embedded(buildEmbedded())
        .links(buildDefaultLinks());
  }

  private PostCodeRangeResponseDTO buildEmbedded() {
    return new PostCodeRangeResponseDTO()
        .agencyId(this.agencyPostCodeRange.getAgency().getId())
        .id(agencyPostCodeRange.getId())
        .postcodeFrom(agencyPostCodeRange.getPostCodeFrom())
        .postcodeTo(agencyPostCodeRange.getPostCodeTo())
        .createDate(String.valueOf(agencyPostCodeRange.getCreateDate()))
        .updateDate(String.valueOf(agencyPostCodeRange.getUpdateDate()));
  }

  private DefaultLinks buildDefaultLinks() {
    return new DefaultLinks()
        .self(buildSelfLink())
        .update(buildUpdateLink())
        .delete(buildDeleteLink());
  }

  private HalLink buildSelfLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class)
            .getAgencyPostcodeRange(this.agencyPostCodeRange.getId()),
        MethodEnum.GET);
  }

  private HalLink buildUpdateLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class)
            .updateAgencyPostcodeRange(this.agencyPostCodeRange.getId(),
                new PostCodeRangeDTO().postcodeFrom(this.agencyPostCodeRange.getPostCodeFrom())
                    .postcodeTo(this.agencyPostCodeRange.getPostCodeTo())), MethodEnum.PUT);
  }

  private HalLink buildDeleteLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class)
            .deleteAgencyPostcodeRange(this.agencyPostCodeRange.getId()),
        MethodEnum.DELETE);
  }
}