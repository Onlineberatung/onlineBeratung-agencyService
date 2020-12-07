package de.caritas.cob.agencyservice.api.admin.hallink;

import static java.util.Objects.isNull;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.model.CreateLinks;
import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;

public class CreateAgencyLinkBuilder implements HalLinkBuilder {

  private Agency agency;

  private CreateAgencyLinkBuilder() {}

  /**
   * Creates an {@link CreateAgencyLinkBuilder} instance.
   *
   * @return a instance of {@link CreateAgencyLinkBuilder}
   */
  public static CreateAgencyLinkBuilder getInstance() {
    return new CreateAgencyLinkBuilder();
  }

  /**
   * Sets the agency param.
   *
   * @param agency the {@link Agency} for building links
   * @return the current {@link CreateAgencyLinkBuilder}
   */
  public CreateAgencyLinkBuilder withAgency(Agency agency) {
    this.agency = agency;
    return this;
  }

  /**
   * Creates the {@link CreateAgencyLinkBuilder}.
   *
   * @return the generated {@link CreateAgencyLinkBuilder}
   */
  public CreateLinks buildCreateAgencyLinks() {
    ensureNonNullAgency();
    return new CreateLinks()
        .self(buildSelfLink())
        .delete(buildDeleteHalLink())
        .update(buildUpdateHalLink());
  }

  private void ensureNonNullAgency() {
    if (isNull(this.agency)) {
      throw new InternalServerErrorException("Agency must not be null");
    }
  }

  private HalLink buildSelfLink() {
    return buildHalLinkForParams(this.agency);
  }

  private HalLink buildHalLinkForParams(Agency agency) {
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
