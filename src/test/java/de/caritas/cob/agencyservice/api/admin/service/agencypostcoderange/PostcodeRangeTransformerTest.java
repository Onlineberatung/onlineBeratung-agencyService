package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsInAnyOrder;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import java.util.Set;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.NullAndEmptySource;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class PostcodeRangeTransformerTest {

  private final PostcodeRangeTransformer postcodeRangeTransformer =
      new PostcodeRangeTransformer();

  @ParameterizedTest
  @NullAndEmptySource
  void extractPostcodeRanges_Should_returnEmptySet_When_inputIsEmptyOrNull(String input) {
    var result = this.postcodeRangeTransformer.extractPostcodeRanges(input);

    assertThat(result, notNullValue());
    assertThat(result, hasSize(0));
  }

  @Test
  void extractPostcodeRanges_Should_returnExpectedRanges_When_inputIsValid() {
    var validInput = "01067-11111;22222-33333;44444-55555;66666;77777-99999";

    var result = this.postcodeRangeTransformer.extractPostcodeRanges(validInput);

    assertThat(result, hasSize(5));
    assertThat(result, containsInAnyOrder(
        buildPostcodeRange("01067", "11111"),
        buildPostcodeRange("22222", "33333"),
        buildPostcodeRange("44444", "55555"),
        buildPostcodeRange("66666", "66666"),
        buildPostcodeRange("77777", "99999")
    ));
  }

  private AgencyPostcodeRange buildPostcodeRange(String postcodeFrom, String postcodeTo) {
    return AgencyPostcodeRange.builder()
        .postcodeFrom(postcodeFrom)
        .postcodeTo(postcodeTo)
        .build();
  }

  @ParameterizedTest
  @NullAndEmptySource
  void buildPostcodeRange_Should_returnEmptyString_When_inputIsEmptyOrNull(
      Set<AgencyPostcodeRange> postcodeRanges) {
    var result = this.postcodeRangeTransformer.buildPostcodeRange(postcodeRanges);

    assertThat(result, is(""));
  }

  @Test
  void buildPostcodeRange_Should_returnExpectedORderedString_When_inputIsValid() {
    var postcodeRanges = Set.of(
        AgencyPostcodeRange.builder().postcodeFrom("44444").postcodeTo("55555").build(),
        AgencyPostcodeRange.builder().postcodeFrom("33333").postcodeTo("33333").build(),
        AgencyPostcodeRange.builder().postcodeFrom("66666").postcodeTo("66666").build(),
        AgencyPostcodeRange.builder().postcodeFrom("11111").postcodeTo("22222").build()
    );
    var result = this.postcodeRangeTransformer.buildPostcodeRange(postcodeRanges);

    assertThat(result, is("11111-22222;33333;44444-55555;66666;"));
  }

}
