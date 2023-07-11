package de.caritas.cob.agencyservice.api.controller;

import static java.util.Optional.ofNullable;

import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.model.FullAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import de.caritas.cob.agencyservice.generated.api.controller.AgenciesApi;
import io.swagger.annotations.Api;
import java.util.List;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller for agency API requests
 */
@RestController
@Api(tags = "agency-controller")
@RequiredArgsConstructor
public class AgencyController implements AgenciesApi {

  private final @NonNull AgencyService agencyService;

  /**
   * Gets a randomly sorted list of AgencyResponseDTOs (from database) and returns the list and a
   * 200 OK on success depending on the post code that is given via query parameter.
   *
   * @param postcode       the postcode for regarding agencies
   * @param consultingType the type used to filter the agencies
   * @param topicId        the (optional) main topicId to filter the agencies
   * @return the List of agencies with information
   */
  @Override
  public ResponseEntity<List<FullAgencyResponseDTO>> getAgencies(
      @RequestParam String postcode, @RequestParam Integer consultingType,
      @RequestParam(value = "topicId", required = false) Integer topicId,
      @RequestParam(value = "age", required = false) Integer age,
      @RequestParam(value = "gender", required = false) String gender,
      @RequestParam(value = "counsellingRelation", required = false) String counsellingRelation
  ) {

    var agencies = agencyService.getAgencies(postcode, consultingType,
        ofNullable(topicId), ofNullable(age), ofNullable(gender), ofNullable(counsellingRelation));

    return !CollectionUtils.isEmpty(agencies)
        ? new ResponseEntity<>(agencies, HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.NO_CONTENT);
  }

  /**
   * Returns information of the provided agencies.
   *
   * @param agencyIds the List of agency IDs
   * @return the List of agencies with information
   */
  @Override
  public ResponseEntity<List<AgencyResponseDTO>> getAgenciesByIds(
      @PathVariable("agencyIds") List<Long> agencyIds) {

    var agencies = agencyService.getAgencies(agencyIds);

    return agencies.isEmpty() ? new ResponseEntity<>(HttpStatus.NOT_FOUND)
        : new ResponseEntity<>(agencies, HttpStatus.OK);
  }

  /**
   * Returns all agencies by given consulting type id.
   *
   * @param consultingTypeId the consulting type id (required)
   * @return the list of agencies
   */
  @Override
  public ResponseEntity<List<AgencyResponseDTO>> getAgenciesByConsultingType(
      Integer consultingTypeId) {

    var agencies = this.agencyService.getAgencies(consultingTypeId);

    return new ResponseEntity<>(agencies, HttpStatus.OK);
  }
}
