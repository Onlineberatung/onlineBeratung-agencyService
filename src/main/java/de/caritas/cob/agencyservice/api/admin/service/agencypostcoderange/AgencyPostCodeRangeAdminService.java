package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.create.PostcodeRangeValidator;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangesResultDTO;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.function.Predicate;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service class to handle agency postcode range admin requests.
 */
@Service
@RequiredArgsConstructor
public class AgencyPostCodeRangeAdminService {

  private final @NonNull AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;
  private final @NonNull AgencyService agencyService;
  private final @NonNull AgencyAdminService agencyAdminService;
  private final @NonNull PostcodeRangeValidator postcodeRangeValidator;

  /**
   * Returns all post code ranges within the given page and perPage offsets by given agency id.
   *
   * @param page     Number of page where to start in the query (1 = first page) (required)
   * @param perPage  Number of items which are being returned per page (required)
   * @param agencyId the agency id
   * @return {@link AgencyPostcodeRangesResultDTO}
   */
  public AgencyPostcodeRangesResultDTO findPostcodeRangesForAgency(Integer page,
      Integer perPage, Long agencyId) {
    var pageable = PageRequest.of(Math.max(page - 1, 0), Math.max(perPage, 1));

    var agencyPostCodeRanges =
        this.agencyPostCodeRangeRepository.findAllByAgencyId(agencyId, pageable);

    return AgencyPostCodeRangesResultDTOBuilder.getInstance()
        .withPage(page)
        .withPerPage(perPage)
        .withResultPage(agencyPostCodeRanges)
        .withAgencyId(agencyId)
        .build();
  }

  /**
   * Deletes a {@link AgencyPostCodeRange} by given id.
   *
   * @param postcodeRangeId the postcode range id
   */
  public void deleteAgencyPostcodeRange(Long postcodeRangeId) {
    markAgencyOfflineIfPostcodeRangeIsLast(postcodeRangeId);
    this.agencyPostCodeRangeRepository.deleteById(postcodeRangeId);
  }

  private void markAgencyOfflineIfPostcodeRangeIsLast(Long postcodeRangeId) {
    var agencyPostCodeRange = this.agencyPostCodeRangeRepository
        .findById(postcodeRangeId)
        .orElseThrow(NotFoundException::new);

    if (isTheLastPostcodeRangeOfAgency(agencyPostCodeRange)) {
      this.agencyService.setAgencyOffline(agencyPostCodeRange.getAgency().getId());
    }
  }

  private boolean isTheLastPostcodeRangeOfAgency(AgencyPostCodeRange agencyPostCodeRange) {
    return agencyPostCodeRange.getAgency()
        .getAgencyPostCodeRanges()
        .stream()
        .noneMatch(otherRangeThan(agencyPostCodeRange));
  }

  private Predicate<AgencyPostCodeRange> otherRangeThan(AgencyPostCodeRange agencyPostCodeRange) {
    return range -> !range.equals(agencyPostCodeRange);
  }

  /**
   * Saves the given postcode range for the provided agency.
   *
   * @param agencyId         agency ID to save the postcode range for
   * @param postCodeRangeDTO {@link PostCodeRangeDTO}
   * @return {@link AgencyPostcodeRangeResponseDTO}
   */
  @Transactional
  public AgencyPostcodeRangeResponseDTO createPostcodeRange(Long agencyId,
      PostCodeRangeDTO postCodeRangeDTO) {
    var agency = agencyAdminService.findAgencyById(agencyId);

    return validateAndSavePostcodeRange(postCodeRangeDTO, agency, null);
  }

  private AgencyPostcodeRangeResponseDTO validateAndSavePostcodeRange(
      PostCodeRangeDTO postCodeRangeDTO, Agency agency, Long postcodeId) {
    postcodeRangeValidator.validatePostcodeRange(postCodeRangeDTO,
        agency.getAgencyPostCodeRanges());
    var agencyPostCodeRange = agencyPostCodeRangeRepository
        .save(fromPostcodeRangeDTO(postCodeRangeDTO, agency, postcodeId));

    return AgencyPostcodeRangeResponseDTOBuilder.getInstance(agencyPostCodeRange)
        .build();
  }

  private AgencyPostCodeRange fromPostcodeRangeDTO(PostCodeRangeDTO postCodeRangeDTO,
      Agency agency, Long postcodeId) {
    return AgencyPostCodeRange.builder()
        .id(postcodeId)
        .postCodeFrom(postCodeRangeDTO.getPostcodeFrom())
        .postCodeTo(postCodeRangeDTO.getPostcodeTo())
        .agency(agency)
        .createDate(LocalDateTime.now(ZoneOffset.UTC))
        .updateDate(LocalDateTime.now(ZoneOffset.UTC))
        .build();
  }

  /**
   * Updates the postcode range for the given postcode range Id.
   *
   * @param postcodeRangeId  Postcode range Id
   * @param postCodeRangeDTO {@link PostCodeRangeDTO}
   * @return {@link AgencyPostcodeRangeResponseDTO}
   */
  public AgencyPostcodeRangeResponseDTO updatePostcodeRange(Long postcodeRangeId,
      PostCodeRangeDTO postCodeRangeDTO) {
    var agencyPostCodeRange = agencyPostCodeRangeRepository
        .findById(postcodeRangeId)
        .orElseThrow(NotFoundException::new);
    agencyPostCodeRange.getAgency().getAgencyPostCodeRanges()
        .removeIf(range -> range.equals(agencyPostCodeRange));

    return validateAndSavePostcodeRange(postCodeRangeDTO, agencyPostCodeRange.getAgency(),
        agencyPostCodeRange.getId());
  }

  /**
   * Retrieves a postcoderange by given id.
   *
   * @param postcodeRangeId the id of the postcoderange
   * @return the created {@link AgencyPostcodeRangeResponseDTO}
   */
  public AgencyPostcodeRangeResponseDTO findPostcodeRangeById(Long postcodeRangeId) {
    var postCodeRange = this.agencyPostCodeRangeRepository.findById(postcodeRangeId)
        .orElseThrow(NotFoundException::new);

    return AgencyPostcodeRangeResponseDTOBuilder
        .getInstance(postCodeRange)
        .build();
  }
}
