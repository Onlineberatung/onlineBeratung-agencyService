package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangesResultDTO;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import java.util.function.Predicate;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * Service class to handle agency postcode range admin requests.
 */
@Service
@RequiredArgsConstructor
public class AgencyPostCodeRangeAdminService {

  private final @NonNull AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;
  private final @NonNull AgencyService agencyService;

  /**
   * Returns all post code ranges within the given page and perPage offsets by given agency id.
   *
   * @param page     Number of page where to start in the query (1 = first page) (required)
   * @param perPage  Number of items which are being returned per page (required)
   * @param agencyId the agency id
   * @return {@link AgencyPostcodeRangesResultDTO}
   */
  public AgencyPostcodeRangesResultDTO findPostCodeRangesForAgency(Integer page,
      Integer perPage, Long agencyId) {
    Pageable pageable = PageRequest.of(Math.max(page - 1, 0), Math.max(perPage, 1));

    Page<AgencyPostCodeRange> agencyPostCodeRanges =
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
    AgencyPostCodeRange agencyPostCodeRange = this.agencyPostCodeRangeRepository
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

}
