package de.caritas.cob.agencyservice.api.admin.hallink;

import static java.util.Objects.requireNonNull;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import de.caritas.cob.agencyservice.api.model.AgencyLinks;
import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;

/**
 * Link builder to create hal links for agency results.
 */
public class AgencyLinksBuilder implements HalLinkBuilder {

  private final Agency agency;

  private AgencyLinksBuilder(Agency agency) {
    this.agency = agency;
  }

  /**
   * Creates an {@link AgencyLinksBuilder} instance.
   *
   * @return a instance of {@link AgencyLinksBuilder}
   */
  public static AgencyLinksBuilder getInstance(Agency agency) {
    requireNonNull(agency);
    return new AgencyLinksBuilder(agency);
  }

  /**
   * Creates the {@link AgencyLinksBuilder}.
   *
   * @return the generated {@link AgencyLinksBuilder}
   */
  public AgencyLinks buildAgencyLinks() {
    return new AgencyLinks()
        .self(buildSelfLink())
        .delete(buildDeleteHalLink())
        .update(buildUpdateHalLink())
        .postcodeRanges(buildPostcodeRangesLink());
  }

  private HalLink buildSelfLink() {
    return buildHalLink(methodOn(AgencyadminApi.class).getAgency(agency.getId()), MethodEnum.GET);
  }

  private HalLink buildDeleteHalLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).deleteAgency(agency.getId()), MethodEnum.DELETE);
  }

  private HalLink buildUpdateHalLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).updateAgency(agency.getId(), null), MethodEnum.PUT);
  }

  private HalLink buildPostcodeRangesLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).getAgencyPostcodeRanges(agency.getId()), MethodEnum.GET);
  }

}
