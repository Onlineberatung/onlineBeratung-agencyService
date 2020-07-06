package de.caritas.cob.AgencyService.api.controller;

import java.util.List;
import java.util.Optional;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import de.caritas.cob.AgencyService.api.exception.BadRequestException;
import de.caritas.cob.AgencyService.api.model.AgencyResponseDTO;
import de.caritas.cob.AgencyService.api.repository.agency.ConsultingType;
import de.caritas.cob.AgencyService.api.service.AgencyService;
import de.caritas.cob.AgencyService.generated.api.controller.AgenciesApi;
import io.swagger.annotations.Api;

/**
 * Controller for agency API requests
 *
 */
@RestController
@Api(tags = "agency-controller")
public class AgencyController implements AgenciesApi {

  private final AgencyService agencyService;

  @Autowired
  public AgencyController(AgencyService agencyService) {
    this.agencyService = agencyService;
  }

  /**
   * Gets a list of AgencyResponseDTOs (from database) and returns the list and a 200 OK on success
   * depending on the post code that is given via query parameter
   */
  @Override
  public ResponseEntity<List<AgencyResponseDTO>> getAgencies(@Valid String postcode,
      @Valid @NotNull @RequestParam Integer consultingType) {
    if (postcode == null || postcode.length() < 3 || postcode.length() > 5) {
      throw new BadRequestException("Postcode size is invalid");
    }

    Optional<ConsultingType> optionalConsultingType = ConsultingType.valueOf(consultingType);
    if (!optionalConsultingType.isPresent()) {
      throw new BadRequestException("Consulting type is invalid");
    }

    List<AgencyResponseDTO> agencies =
        agencyService.getAgencies(postcode, optionalConsultingType.get());

    return (agencies != null && agencies.size() > 0)
        ? new ResponseEntity<List<AgencyResponseDTO>>(agencies, HttpStatus.OK)
        : new ResponseEntity<List<AgencyResponseDTO>>(HttpStatus.NO_CONTENT);
  }

  /**
   * Returns information of the provided agencies
   * @param agencyIds the List of agencies Ids
   * @return the List of agencies with information
   */
  @Override
  public ResponseEntity<List<AgencyResponseDTO>> getAgencies(@PathVariable("agencyIds") List<Long> agencyIds) {

    List<AgencyResponseDTO> agencies = agencyService.getAgencies(agencyIds);

    return agencies.isEmpty() || agencies.contains(null) ? new ResponseEntity<>(HttpStatus.NOT_FOUND)
        : new ResponseEntity<>(agencies, HttpStatus.OK);
  }
}
