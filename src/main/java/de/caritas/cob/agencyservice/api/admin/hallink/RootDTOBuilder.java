package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.RootDTO;
import de.caritas.cob.agencyservice.api.model.RootLinks;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;

/**
 * Builder to create the root navigation hal DTO.
 */
public class RootDTOBuilder implements HalLinkBuilder {

  public static final Integer DEFAULT_PAGE = 1;
  public static final Integer DEFAULT_PER_PAGE = 20;
  public static final Integer DEFAULT_TOTAL_PAGES = 0;

  /**
   * Builds the root navigation DTO.
   *
   * @return the {@link RootDTO} containing hal links
   */
  public RootDTO buildRootDTO() {
    return new RootDTO()
        .links(new RootLinks()
            .self(buildSelfLink())
            .agencies(buildSearchLink())
            .agency(buildCreateLink()));
  }

  private HalLink buildSelfLink() {
    return buildHalLink(methodOn(AgencyadminApi.class).getRoot(), MethodEnum.GET);
  }

  private HalLink buildSearchLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).searchAgencies(DEFAULT_PAGE, DEFAULT_PER_PAGE, null),
        MethodEnum.GET);
  }

  private HalLink buildCreateLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).createAgency(new AgencyDTO()),
        MethodEnum.POST);
  }

}
