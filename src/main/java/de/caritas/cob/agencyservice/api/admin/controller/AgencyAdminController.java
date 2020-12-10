package de.caritas.cob.agencyservice.api.admin.controller;

import de.caritas.cob.agencyservice.api.admin.hallink.RootDTOBuilder;
import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminSearchService;
import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.admin.service.DioceseAdminService;
import de.caritas.cob.agencyservice.api.admin.validation.AgencyValidator;
import de.caritas.cob.agencyservice.api.model.AgencyAdminSearchResultDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangesResultDTO;
import de.caritas.cob.agencyservice.api.model.CreateAgencyPostcodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.model.CreateAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.model.DioceseAdminResultDTO;
import de.caritas.cob.agencyservice.api.model.GetAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
import de.caritas.cob.agencyservice.api.model.RootDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyResponseDTO;
import de.caritas.cob.agencyservice.generated.api.admin.controller.AgencyadminApi;
import io.swagger.annotations.Api;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller to handle all agency admin requests.
 */
@RestController
@Api(tags = "admin-agency-controller")
@RequiredArgsConstructor
public class AgencyAdminController implements AgencyadminApi {

  private final @NonNull AgencyAdminSearchService agencyAdminSearchService;
  private final @NonNull DioceseAdminService dioceseAdminService;
  private final @NonNull AgencyAdminService agencyAdminService;
  private final @NonNull AgencyValidator agencyValidator;

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
   * @param perPage Number of items which are being returned per page (required)
   * @param q The query parameter to search for (optional)
   * @return an entity containing the search result
   */
  @Override
  public ResponseEntity<AgencyAdminSearchResultDTO> searchAgencies(
      @NotNull @Valid Integer page, @NotNull @Valid Integer perPage, @Valid String q) {

    AgencyAdminSearchResultDTO agencyAdminSearchResultDTO =
        this.agencyAdminSearchService.searchAgencies(q, page, perPage);

    return new ResponseEntity<>(agencyAdminSearchResultDTO, HttpStatus.OK);
  }

  /**
   * Entry point to return all dioceses.
   *
   * @param page Number of page where to start in the query (1 = first page) (required)
   * @param perPage Number of items which are being returned per page (required)
   * @return {@link DioceseAdminResultDTO}
   */
  @Override
  public ResponseEntity<DioceseAdminResultDTO> getDioceses(
      @NotNull @Valid Integer page, @NotNull @Valid Integer perPage) {

    DioceseAdminResultDTO dioceseAdminResultDTO =
        dioceseAdminService.findAllDioceses(page, perPage);

    return new ResponseEntity<>(dioceseAdminResultDTO, HttpStatus.OK);
  }

  /**
   * Entry point for creating an agency.
   *
   * @param agencyDTO (required)
   * @return {@link CreateAgencyResponseDTO}
   */
  @Override
  public ResponseEntity<CreateAgencyResponseDTO> createAgency(@Valid AgencyDTO agencyDTO) {

    agencyValidator.validate(agencyDTO);
    CreateAgencyResponseDTO createAgencyResponseDTO = agencyAdminService.saveAgency(agencyDTO);

    return new ResponseEntity<>(createAgencyResponseDTO, HttpStatus.CREATED);
  }

}
