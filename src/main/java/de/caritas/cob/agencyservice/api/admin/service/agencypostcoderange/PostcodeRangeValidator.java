package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import java.util.List;
import java.util.Set;
import org.apache.commons.lang3.Range;
import org.apache.commons.lang3.math.NumberUtils;

/**
 * Postcode range validation class.
 */
public class PostcodeRangeValidator {

  /**
   * Validates if the given postcode range is valid (postcodeFrom is smaller than postcodeTo)..
   *
   * @param newAgencyPostcodeRanges {@link AgencyPostcodeRange}s to be validated
   */
  public void validatePostcodeRanges(Set<AgencyPostcodeRange> newAgencyPostcodeRanges) {
    if (havePostcodesExpectedDigits(newAgencyPostcodeRanges)
        || arePostcodesFromBiggerThanPostcodesTo(newAgencyPostcodeRanges)) {
      throw new InvalidPostcodeException();
    }
  }

  private boolean havePostcodesExpectedDigits(Set<AgencyPostcodeRange> postcodeRanges) {
    return postcodeRanges.stream()
        .anyMatch(range -> doesNotMatchExpectedFormat(range.getPostcodeFrom())
            || doesNotMatchExpectedFormat(range.getPostcodeTo()));
  }

  private boolean doesNotMatchExpectedFormat(String postcode) {
    return postcode.length() != 5 || !NumberUtils.isParsable(postcode);
  }

  private boolean arePostcodesFromBiggerThanPostcodesTo(Set<AgencyPostcodeRange> postcodeRanges) {
    return postcodeRanges.stream()
        .anyMatch(this::arePostcodesFromBiggerThanPostcodesTo);
  }

  private boolean arePostcodesFromBiggerThanPostcodesTo(AgencyPostcodeRange range) {
    return Integer.parseInt(range.getPostcodeFrom()) > Integer.parseInt(range.getPostcodeTo());
  }

  /**
   * validates if the given postcode range intersects with the given {@link AgencyPostcodeRange} 's
   * of agency.
   *
   * @param postcodeRangesToSave         the postcoderanges to be saved
   * @param existingAgencyPostcodeRanges the currently persisted postcoderanges
   */
  public void validatePostcodeRangeForIntersection(Set<AgencyPostcodeRange> postcodeRangesToSave,
      List<AgencyPostcodeRange> existingAgencyPostcodeRanges) {
    var rangeOverlapsExistingRange = postcodeRangesToSave.stream()
        .map(this::fromAgencyPostCodeRange)
        .anyMatch(range -> rangeOverlapsRangeList(existingAgencyPostcodeRanges, range));

    if (rangeOverlapsExistingRange) {
      throw new InvalidPostcodeException();
    }
  }

  private boolean rangeOverlapsRangeList(List<AgencyPostcodeRange> postCodeRangeList,
      Range<Integer> providedRange) {
    return postCodeRangeList.stream()
        .map(this::fromAgencyPostCodeRange)
        .anyMatch(range -> range.isOverlappedBy(providedRange));
  }

  private Range<Integer> fromAgencyPostCodeRange(AgencyPostcodeRange range) {
    return Range.between(Integer.parseInt(range.getPostcodeFrom()),
        Integer.parseInt(range.getPostcodeTo()));
  }
}
