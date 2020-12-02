package de.caritas.cob.agencyservice.api.admin.controller;

import de.caritas.cob.agencyservice.api.admin.hallink.RootDTOBuilder;
import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminSearchService;
import de.caritas.cob.agencyservice.api.admin.service.DioceseAdminService;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
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
   * @param page    Number of page where to start in the query (1 = first page) (required)
   * @param perPage Number of items which are being returned per page (required)
   * @param q       The query parameter to search for (optional)
   * @return an entity containing the search result
   */
  @Override
  public ResponseEntity<AgencyAdminSearchResultDTO> searchAgencies(@NotNull @Valid Integer page,
      @NotNull @Valid Integer perPage, @Valid String q) {

    AgencyAdminSearchResultDTO agencyAdminSearchResultDTO =
        this.agencyAdminSearchService.searchAgencies(q, page, perPage);

    return new ResponseEntity<>(agencyAdminSearchResultDTO, HttpStatus.OK);
  }

  /**
   * Entry point to return all dioceses.
   *
   * @param page    Number of page where to start in the query (1 = first page) (required)
   * @param perPage Number of items which are being returned per page (required)
   * @return {@link DioceseAdminResultDTO}
   */
  @Override
  public ResponseEntity<DioceseAdminResultDTO> getDioceses(@NotNull @Valid Integer page,
      @NotNull @Valid Integer perPage) {

    DioceseAdminResultDTO dioceseAdminResultDTO = dioceseAdminService
        .findAllDioceses(page, perPage);

    return new ResponseEntity<>(dioceseAdminResultDTO, HttpStatus.OK);
  }

  /**
   * Entry point for creating an agency.
   *
   * @param agencyDTO  (required)
   * @return {@link AgencyAdminResponseDTO}
   */
  @Override
  public ResponseEntity<CreateAgencyResponseDTO> createAgency(@Valid AgencyDTO agencyDTO) {
    return null;
  }

  /**
   * Entry point for deleting an agency.
   *
   * @param agencyId  (required)
   */
  @Override
  public ResponseEntity<Void> deleteAgency(@PathVariable Long agencyId) {
    return null;
  }

  /**
   *
   * @param agencyId Agency Id (required)
   * @param updateAgencyDTO  (required)
   * @return {@link UpdateAgencyResponseDTO}
   */
  @Override
  public ResponseEntity<UpdateAgencyResponseDTO> updateAgency(@PathVariable Long agencyId,
      @Valid UpdateAgencyDTO updateAgencyDTO) {
    return null;
  }

  /**
   * Entry point for getting an agency.
   *
   * @param agencyId Agency Id (required)
   * @return {@link GetAgencyResponseDTO}
   */
  @Override
  public ResponseEntity<GetAgencyResponseDTO> getAgency(@PathVariable Long agencyId) {
    return null;
  }

  /**
   * Entry point for creating a postcode range.
   *
   * @param agencyId Agency Id (required)
   * @param postCodeRangeDTO  (required)
   * @return {@link CreateAgencyPostcodeRangeResponseDTO}
   */
  @Override
  public ResponseEntity<CreateAgencyPostcodeRangeResponseDTO> createAgencyPostcodeRange(
      @PathVariable Long agencyId, @Valid PostCodeRangeDTO postCodeRangeDTO) {
    return null;
  }

  /**
   * Entry point to get the postcode ranges for a specific agency.
   *
   * @param agencyId Agency Id (required)
   * @param page Number of page where to start (1 &#x3D; first page) (required)
   * @param perPage Number of items which are being returned per page (required)
   * @return an entity containing the search result
   */
  @Override
  public ResponseEntity<AgencyPostcodeRangesResultDTO> getAgencyPostcodeRanges(@PathVariable Long agencyId,
      @NotNull @Valid Integer page, @NotNull @Valid Integer perPage) {
    return null;
  }
}
