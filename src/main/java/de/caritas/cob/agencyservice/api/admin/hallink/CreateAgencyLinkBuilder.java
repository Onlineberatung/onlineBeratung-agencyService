package de.caritas.cob.agencyservice.api.admin.hallink;

import static java.util.Objects.requireNonNull;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import de.caritas.cob.agencyservice.api.model.CreateLinks;
import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;

/**
 * Link builder to create hal links for create agency results.
 */
public class CreateAgencyLinkBuilder implements HalLinkBuilder {

  private final Agency agency;

  private CreateAgencyLinkBuilder(Agency agency) {
    this.agency = agency;
  }

  /**
   * Creates an {@link CreateAgencyLinkBuilder} instance.
   *
   * @return a instance of {@link CreateAgencyLinkBuilder}
   */
  public static CreateAgencyLinkBuilder getInstance(Agency agency) {
    requireNonNull(agency);
    return new CreateAgencyLinkBuilder(agency);
  }

  /**
   * Creates the {@link CreateAgencyLinkBuilder}.
   *
   * @return the generated {@link CreateAgencyLinkBuilder}
   */
  public CreateLinks buildCreateAgencyLinks() {
    return new CreateLinks()
        .self(buildSelfLink())
        .delete(buildDeleteHalLink())
        .update(buildUpdateHalLink());
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
}
