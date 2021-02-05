package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.create;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_POSTCODE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE_2;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE_3;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE_4;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE_5;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE_6;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import java.util.Arrays;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class PostcodeRangeValidatorTest {

  private PostcodeRangeValidator postcodeRangeValidator;
  private List<AgencyPostCodeRange> agencyPostCodeRangeList;

  @Before
  public void setup() {
    AgencyPostCodeRange agencyPostCodeRange = AgencyPostCodeRange.builder()
        .postCodeFrom(VALID_POSTCODE)
        .postCodeTo(VALID_POSTCODE_2)
        .build();
    AgencyPostCodeRange agencyPostCodeRange2 = AgencyPostCodeRange.builder()
        .postCodeFrom(VALID_POSTCODE_3)
        .postCodeTo(VALID_POSTCODE_4)
        .build();
    this.agencyPostCodeRangeList = Arrays.asList(agencyPostCodeRange, agencyPostCodeRange2);
    this.postcodeRangeValidator = new PostcodeRangeValidator();
  }

  @Test
  public void validatePostcodeRange_ShouldNot_ThrowException_WhenPostcodeFromIsSmallerThanPostcodeTo() {
    PostCodeRangeDTO postCodeRangeDTO = new PostCodeRangeDTO().postcodeFrom(VALID_POSTCODE)
        .postcodeTo(VALID_POSTCODE_2);

    this.postcodeRangeValidator.validatePostcodeRange(postCodeRangeDTO);
  }

  @Test(expected = InvalidPostcodeException.class)
  public void validatePostcodeRange_Should_ThrowInvalidPostcodeException_WhenPostcodeFromIsBiggerThanPostcodeTo() {
    PostCodeRangeDTO postCodeRangeDTO = new PostCodeRangeDTO().postcodeFrom(VALID_POSTCODE_2)
        .postcodeTo(VALID_POSTCODE);

    this.postcodeRangeValidator.validatePostcodeRange(postCodeRangeDTO);
  }

  @Test(expected = InvalidPostcodeException.class)
  public void validatePostcodeRange_Should_ThrowInvalidPostcodeException_WhenPostcodeFromIsInvalid() {
    PostCodeRangeDTO postCodeRangeDTO = new PostCodeRangeDTO().postcodeFrom(INVALID_POSTCODE)
        .postcodeTo(VALID_POSTCODE);

    this.postcodeRangeValidator.validatePostcodeRange(postCodeRangeDTO);
  }

  @Test(expected = InvalidPostcodeException.class)
  public void validatePostcodeRange_Should_ThrowInvalidPostcodeException_WhenPostcodeToIsInvalid() {
    PostCodeRangeDTO postCodeRangeDTO = new PostCodeRangeDTO().postcodeFrom(VALID_POSTCODE)
        .postcodeTo(INVALID_POSTCODE);

    this.postcodeRangeValidator.validatePostcodeRange(postCodeRangeDTO);
  }

  @Test
  public void validatePostcodeRangeForAgency_ShouldNot_ThrowException_WhenPostcodeIsNotWithinRangeList() {
    PostCodeRangeDTO postCodeRangeDTO = new PostCodeRangeDTO().postcodeFrom(VALID_POSTCODE_5)
        .postcodeTo(VALID_POSTCODE_5);

    this.postcodeRangeValidator
        .validatePostcodeRangeForAgency(postCodeRangeDTO, agencyPostCodeRangeList);
  }

  @Test(expected = InvalidPostcodeException.class)
  public void validatePostcodeRangeForAgency_Should_ThrowInvalidPostcodeException_WhenPostcodeIsWithinRangeList() {
    PostCodeRangeDTO postCodeRangeDTO = new PostCodeRangeDTO().postcodeFrom(VALID_POSTCODE_6)
        .postcodeTo(VALID_POSTCODE_6);

    this.postcodeRangeValidator
        .validatePostcodeRangeForAgency(postCodeRangeDTO, agencyPostCodeRangeList);
  }
}
