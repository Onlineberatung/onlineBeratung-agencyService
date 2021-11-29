package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import de.caritas.cob.agencyservice.api.admin.hallink.HalLinkBuilder;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.model.DefaultLinks;
import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.PostcodeRangeDTO;
import de.caritas.cob.agencyservice.api.model.PostcodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;
import java.util.Set;

/**
 * Builder class to generate a {@link AgencyPostcodeRangeResponseDTO} containing navigation hal
 * links.
 */
public class AgencyPostcodeRangeResponseDTOBuilder implements HalLinkBuilder {

  private final Set<AgencyPostcodeRange> agencyPostcodeRanges;
  private final Long agencyId;
  private final PostcodeRangeTransformer postcodeRangeTransformer =
      new PostcodeRangeTransformer();

  private AgencyPostcodeRangeResponseDTOBuilder(Set<AgencyPostcodeRange> agencyPostcodeRanges,
      Long agencyId) {
    this.agencyPostcodeRanges = agencyPostcodeRanges;
    this.agencyId = agencyId;
  }

  /**
   * Creates a builder instance of {@link AgencyPostcodeRangeResponseDTOBuilder}.
   *
   * @return a instance of {@link AgencyPostcodeRangeResponseDTOBuilder}
   */
  public static AgencyPostcodeRangeResponseDTOBuilder getInstance(
      Set<AgencyPostcodeRange> agencyPostCodeRange, Long agencyId) {
    return new AgencyPostcodeRangeResponseDTOBuilder(agencyPostCodeRange, agencyId);
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

  private PostcodeRangeResponseDTO buildEmbedded() {
    return new PostcodeRangeResponseDTO()
        .id(this.agencyId)
        .postcodeRanges(
            this.postcodeRangeTransformer.buildPostcodeRange(this.agencyPostcodeRanges));
  }

  private DefaultLinks buildDefaultLinks() {
    return new DefaultLinks()
        .self(buildSelfLink())
        .update(buildUpdateLink())
        .delete(buildDeleteLink());
  }

  private HalLink buildSelfLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).getAgencyPostcodeRanges(this.agencyId),
        MethodEnum.GET);
  }

  private HalLink buildUpdateLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class)
            .updateAgencyPostcodeRange(this.agencyId, fromAgencyPostCodeRanges()), MethodEnum.PUT);
  }

  private HalLink buildDeleteLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).deleteAgencyPostcodeRange(this.agencyId),
        MethodEnum.DELETE);
  }

  private PostcodeRangeDTO fromAgencyPostCodeRanges() {
    return new PostcodeRangeDTO()
        .postcodeRanges(
            this.postcodeRangeTransformer.buildPostcodeRange(this.agencyPostcodeRanges));
  }
}
