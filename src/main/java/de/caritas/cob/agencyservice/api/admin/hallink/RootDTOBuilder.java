package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

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
            .agency(buildAgencyLink())
            .agencypostcodes(buildAgencyPostCodeRangesLink()));
  }

  private HalLink buildSelfLink() {
    return buildHalLink(methodOn(AgencyadminApi.class).getRoot(), MethodEnum.GET);
  }

  private HalLink buildSearchLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).searchAgencies(DEFAULT_PAGE, DEFAULT_PER_PAGE, null, null),
        MethodEnum.GET);
  }

  private HalLink buildAgencyLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).getAgency(null),
        MethodEnum.GET);
  }

  private HalLink buildAgencyPostCodeRangesLink() {
    return buildHalLink(
        methodOn(AgencyadminApi.class).getAgencyPostcodeRanges(null), MethodEnum.GET);
  }
}
