package de.caritas.cob.agencyservice.api.admin.service;

import static java.util.Objects.requireNonNull;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import de.caritas.cob.agencyservice.api.admin.hallink.CreateAgencyLinkBuilder;
import de.caritas.cob.agencyservice.api.admin.hallink.HalLinkBuilder;
import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.UpdateLinks;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;

/**
 * Link builder to create hal links for update agency results.
 */
public class UpdateAgencyLinkBuilder implements HalLinkBuilder {

  private final Agency agency;

  private UpdateAgencyLinkBuilder(Agency agency) {
    this.agency = agency;
  }

  /**
   * Creates an {@link CreateAgencyLinkBuilder} instance.
   *
   * @return a instance of {@link CreateAgencyLinkBuilder}
   */
  public static UpdateAgencyLinkBuilder getInstance(Agency agency) {
    requireNonNull(agency);
    return new UpdateAgencyLinkBuilder(agency);
  }

  /**
   * Creates the {@link CreateAgencyLinkBuilder}.
   *
   * @return the generated {@link CreateAgencyLinkBuilder}
   */
  public UpdateLinks buildUpdateAgencyLinks() {
    return new UpdateLinks()
        .self(buildSelfLink())
        .delete(buildDeleteHalLink())
        .agency(buildAgencyLink());
  }

  private HalLink buildAgencyLink() {
    return buildHalLink(methodOn(AgencyadminApi.class).getAgency(agency.getId()), MethodEnum.GET);
  }

  private HalLink buildDeleteHalLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).deleteAgency(agency.getId()), MethodEnum.DELETE);
  }

  private HalLink buildSelfLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).updateAgency(agency.getId(), null), MethodEnum.PUT);
  }

}
