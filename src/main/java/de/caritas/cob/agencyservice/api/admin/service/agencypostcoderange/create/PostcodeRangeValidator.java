package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.create;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import java.util.List;
import org.apache.commons.lang3.Range;
import org.springframework.stereotype.Component;

/**
 * Postcode range validation class.
 */
@Component
public class PostcodeRangeValidator {

  /**
   * Validates if the given postcode range is valid (postcodeFrom is smaller than postcodeTo) and if
   * the given postcode range already exists or intersects with the given {@link * Agency}'s data.
   *
   * @param postCodeRangeDTO {@link PostCodeRangeDTO}
   */
  public void validatePostcodeRange(PostCodeRangeDTO postCodeRangeDTO,
      List<AgencyPostCodeRange> postCodeRangeList) {
    if (isPostcodeFromBiggerThanPostcodeTo(postCodeRangeDTO)) {
      throw new InvalidPostcodeException();
    }

    validatePostcodeRangeForAgency(postCodeRangeDTO, postCodeRangeList);
  }

  private boolean isPostcodeFromBiggerThanPostcodeTo(PostCodeRangeDTO postCodeRangeDTO) {
    try {
      return Integer.parseInt(postCodeRangeDTO.getPostcodeFrom()) > Integer
          .parseInt(postCodeRangeDTO.getPostcodeTo());
    } catch (NumberFormatException exception) {
      throw new InvalidPostcodeException();
    }
  }

  private void validatePostcodeRangeForAgency(PostCodeRangeDTO postCodeRangeDTO,
      List<AgencyPostCodeRange> postCodeRangeList) {
    Range<Integer> providedRange = Range
        .between(Integer.valueOf(postCodeRangeDTO.getPostcodeFrom()),
            Integer.valueOf(postCodeRangeDTO.getPostcodeTo()));

    if (rangeOverlapsRangeList(postCodeRangeList, providedRange)) {
      throw new InvalidPostcodeException();
    }
  }

  private boolean rangeOverlapsRangeList(List<AgencyPostCodeRange> postCodeRangeList,
      Range<Integer> providedRange) {
    return postCodeRangeList.stream()
        .map(range -> fromAgencyPostCodeRange(range.getPostCodeFrom(), range.getPostCodeTo()))
        .anyMatch(range -> Range.between(range.getPostCodeFrom(), range.getPostCodeTo())
            .isOverlappedBy(providedRange));
  }

  private PostcodeRangeDTO fromAgencyPostCodeRange(String postCodeFrom, String postCodeTo) {
    return PostcodeRangeDTO
        .builder()
        .postCodeFrom(Integer.parseInt(postCodeFrom))
        .postCodeTo(Integer.parseInt(postCodeTo))
        .build();
  }
}
