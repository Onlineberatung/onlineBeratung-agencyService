package de.caritas.cob.agencyservice.api.admin.controller;

import de.caritas.cob.agencyservice.api.admin.hallink.RootDTOBuilder;
import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.model.AgencyAdminSearchResultDTO;
import de.caritas.cob.agencyservice.api.model.RootDTO;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;
import io.swagger.annotations.Api;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller to handle all agency admin requests.
 */
@RestController
@Api(tags = "agency-admin-controller")
@RequiredArgsConstructor
public class AgencyAdminController implements AgencyadminApi {

  private final @NonNull AgencyAdminService agencyAdminService;

  /**
   * Creates the root hal based navigation entity.
   *
   * @return a entity containing the available navigation hal links
   */
  @Override
  public ResponseEntity<RootDTO> getRoot() {
    RootDTO rootDTO = new RootDTOBuilder().buildRootDTO();
    return new ResponseEntity<>(rootDTO, HttpStatus.OK);
  }

  /**
   * Entry point to search for agencies.
   *
   * @param page Number of page where to start in the query (1 = first page) (required)
   * @param perPage Number of items which are being returned (required)
   * @param q The query parameter to search for (optional)
   * @return a entity conatining the search result
   */
  @Override
  public ResponseEntity<AgencyAdminSearchResultDTO> searchAgencies(@NotNull @Valid Integer page,
      @NotNull @Valid Integer perPage, @Valid String q) {

    AgencyAdminSearchResultDTO agencyAdminSearchResultDTO = this.agencyAdminService
        .buildAgencyAdminSearchResult(q, page, perPage);

    return new ResponseEntity<>(agencyAdminSearchResultDTO, HttpStatus.OK);
  }

}
