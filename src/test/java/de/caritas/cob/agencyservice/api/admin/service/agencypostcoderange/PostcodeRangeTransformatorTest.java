package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.hamcrest.MatcherAssert.assertThat;
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
class PostcodeRangeTransformatorTest {

  private final PostcodeRangeTransformator postcodeRangeTransformator =
      new PostcodeRangeTransformator();

  @ParameterizedTest
  @NullAndEmptySource
  void extractPostcodeRanges_Should_returnEmptySet_When_inputIsEmptyOrNull(String input) {
    var result = this.postcodeRangeTransformator.extractPostcodeRanges(input);

    assertThat(result, notNullValue());
    assertThat(result, hasSize(0));
  }

  @Test
  void extractPostcodeRanges_Should_returnExpectedRanges_When_inputIsValid() {
    var validInput = "11111;22222-33333;44444-55555;66666;77777-99999";

    var result = this.postcodeRangeTransformator.extractPostcodeRanges(validInput);

    assertThat(result, hasSize(5));
    var iterator = result.iterator();
    var next = iterator.next();
    assertThat(next.getPostcodeFrom(), is("11111"));
    assertThat(next.getPostcodeTo(), is("11111"));
    next = iterator.next();
    assertThat(next.getPostcodeFrom(), is("22222"));
    assertThat(next.getPostcodeTo(), is("33333"));
    next = iterator.next();
    assertThat(next.getPostcodeFrom(), is("44444"));
    assertThat(next.getPostcodeTo(), is("55555"));
    next = iterator.next();
    assertThat(next.getPostcodeFrom(), is("77777"));
    assertThat(next.getPostcodeTo(), is("99999"));
    next = iterator.next();
    assertThat(next.getPostcodeFrom(), is("66666"));
    assertThat(next.getPostcodeTo(), is("66666"));
  }

  @ParameterizedTest
  @NullAndEmptySource
  void buildPostcodeRange_Should_returnEmptyString_When_inputIsEmptyOrNull(
      Set<AgencyPostcodeRange> postcodeRanges) {
    var result = this.postcodeRangeTransformator.buildPostcodeRange(postcodeRanges);

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
    var result = this.postcodeRangeTransformator.buildPostcodeRange(postcodeRanges);

    assertThat(result, is("11111-22222;33333;44444-55555;66666;"));
  }

}
