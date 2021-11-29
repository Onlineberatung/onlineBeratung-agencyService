package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static java.util.Collections.emptySet;
import static org.apache.commons.lang3.StringUtils.isNotBlank;
import static org.springframework.util.CollectionUtils.isEmpty;

import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import joptsimple.internal.Strings;

/**
 * Transformator to represent postcode range strings as entity objects and vice versa.
 */
public class PostcodeRangeTransformer {

  /**
   * Extracts a postcode range string e.g. 79100-79112;80437;56342-46440 into a {@link Set} of
   * {@link AgencyPostcodeRange} representation.
   *
   * @param postcodeRange the input string to be parsed
   * @return the extracted {@link AgencyPostcodeRange}s
   */
  public Set<AgencyPostcodeRange> extractPostcodeRanges(String postcodeRange) {
    if (isNotBlank(postcodeRange)) {
      return Stream.of(postcodeRange.split(";"))
          .map(this::toAgencyPostcodeRange)
          .collect(Collectors.toSet());
    }
    return emptySet();
  }

  private AgencyPostcodeRange toAgencyPostcodeRange(String postcodeRange) {
    if (postcodeRange.contains("-")) {
      var split = postcodeRange.split("-");
      return AgencyPostcodeRange.builder()
          .postcodeFrom(split[0])
          .postcodeTo(split[1])
          .build();
    } else {
      return AgencyPostcodeRange.builder()
          .postcodeFrom(postcodeRange)
          .postcodeTo(postcodeRange)
          .build();
    }
  }

  /**
   * Transforms {@link AgencyPostcodeRange}s into a string representation.
   *
   * @param postcodeRanges the {@link AgencyPostcodeRange}s to be transformed
   * @return the transformed string representation
   */
  public String buildPostcodeRange(Set<AgencyPostcodeRange> postcodeRanges) {
    if (isEmpty(postcodeRanges)) {
      return Strings.EMPTY;
    }
    var orderedRanges = orderPostcodeRanges(postcodeRanges);
    var builder = new StringBuilder();
    orderedRanges.forEach(postcodeRange -> {
      if (postcodeRange.getPostcodeTo().equals(postcodeRange.getPostcodeFrom())) {
        builder.append(postcodeRange.getPostcodeFrom());
        builder.append(";");
      } else {
        builder.append(postcodeRange.getPostcodeFrom());
        builder.append("-");
        builder.append(postcodeRange.getPostcodeTo());
        builder.append(";");
      }
    });
    return builder.toString();
  }

  private Set<AgencyPostcodeRange> orderPostcodeRanges(Set<AgencyPostcodeRange> postcodeRanges) {
    return postcodeRanges.stream()
        .sorted(Comparator.comparingInt(coderange -> Integer.parseInt(coderange.getPostcodeFrom())))
        .collect(Collectors.toCollection(LinkedHashSet::new));
  }

}
