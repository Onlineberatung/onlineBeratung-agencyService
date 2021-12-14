package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertThrows;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import java.util.List;
import java.util.Set;
import java.util.stream.Stream;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class PostcodeRangeValidatorTest {

  private final PostcodeRangeValidator postcodeRangeValidator = new PostcodeRangeValidator();

  @Test
  void validatePostcodeRange_ShouldNot_ThrowException_WhenPostcodesAreValid() {
    var postcodeRange = new AgencyPostcodeRange();
    postcodeRange.setPostcodeFrom("12345");
    postcodeRange.setPostcodeTo("55555");
    var postcodeRanges = Set.of(postcodeRange);

    assertDoesNotThrow(() -> this.postcodeRangeValidator.validatePostcodeRanges(postcodeRanges));
  }

  @ParameterizedTest
  @MethodSource("invalidPostcodeRanges")
  void validatePostcodeRange_Should_ThrowInvalidPostcodeException_When_PostcodeRangeIsInvalid(
      String postcodeFrom, String postcodeTo) {
    var postcodeRange = AgencyPostcodeRange.builder()
        .postcodeFrom(postcodeFrom)
        .postcodeTo(postcodeTo)
        .build();
    var postcodeRanges = Set.of(postcodeRange);

    assertThrows(InvalidPostcodeException.class,
        () -> this.postcodeRangeValidator.validatePostcodeRanges(postcodeRanges));
  }

  static Stream<Arguments> invalidPostcodeRanges() {
    return Stream.of(
        Arguments.of("1", "1"),
        Arguments.of("1234a", "12345"),
        Arguments.of("12345", "12344"),
        Arguments.of("invalid", "99999"),
        Arguments.of("88660", "897000")
    );
  }

  @Test
  void validatePostcodeRangeForIntersection_ShouldNot_ThrowException_When_rangesAreNotOverlapped() {
    var postcodesToSave = Set.of(
        AgencyPostcodeRange.builder().postcodeFrom("12345").postcodeTo("23456").build());
    var existingPostcodes = List.of(
        AgencyPostcodeRange.builder().postcodeFrom("34567").postcodeTo("45678").build());

    assertDoesNotThrow(() -> this.postcodeRangeValidator
        .validatePostcodeRangeForIntersection(postcodesToSave, existingPostcodes));
  }

  @Test
  void validatePostcodeRangeForIntersection_Should_ThrowInvalidPostcodeException_When_rangesAreOverlapped() {
    var postcodesToSave = Set.of(
        AgencyPostcodeRange.builder().postcodeFrom("12345").postcodeTo("23456").build());
    var existingPostcodes = List.of(
        AgencyPostcodeRange.builder().postcodeFrom("23455").postcodeTo("45678").build());

    assertThrows(InvalidPostcodeException.class, () -> this.postcodeRangeValidator
        .validatePostcodeRangeForIntersection(postcodesToSave, existingPostcodes));
  }

}
