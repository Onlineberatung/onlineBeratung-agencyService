package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.create.PostcodeRangeValidator;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangesResultDTO;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import java.util.function.Predicate;
import de.caritas.cob.agencyservice.api.service.LogService;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

    postcodeRangeValidator.validatePostcodeRange(postCodeRangeDTO);
    Agency agency = agencyAdminService.findAgencyById(agencyId);
    postcodeRangeValidator.validatePostcodeRangeForAgency(postCodeRangeDTO,
        agency.getAgencyPostCodeRanges());
    AgencyPostCodeRange agencyPostCodeRange = this
        .savePostcodeRange(fromPostCodeRangeDTO(postCodeRangeDTO, agency));

    return AgencyPostcodeRangeResponseDTOBuilder.getInstance()
        .withAgencyPostCodeRange(agencyPostCodeRange)
        .build();
  }

  private AgencyPostCodeRange fromPostCodeRangeDTO(PostCodeRangeDTO postCodeRangeDTO,
      Agency agency) {
    return AgencyPostCodeRange.builder()
        .postCodeFrom(postCodeRangeDTO.getPostcodeFrom())
        .postCodeTo(postCodeRangeDTO.getPostcodeTo())
        .agency(agency)
        .createDate(LocalDateTime.now(ZoneOffset.UTC))
        .updateDate(LocalDateTime.now(ZoneOffset.UTC))
        .build();
  }

  private AgencyPostCodeRange savePostcodeRange(AgencyPostCodeRange agencyPostCodeRange) {
    try {
      return agencyPostCodeRangeRepository.save(agencyPostCodeRange);
    } catch (DataAccessException ex) {
      throw new InternalServerErrorException(
          LogService::logDatabaseError, String
          .format("Could not create postcode range %s-%s for agency id %s",
              agencyPostCodeRange.getPostCodeFrom(), agencyPostCodeRange.getPostCodeTo(),
              agencyPostCodeRange.getAgency().getId()));
    }
  }
}
