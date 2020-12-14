package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangesResultDTO;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
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

  /**
   * Returns all post code ranges within the given page and perPage offsets by given agency id.
   *
   * @param page    Number of page where to start in the query (1 = first page) (required)
   * @param perPage Number of items which are being returned per page (required)
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

}
