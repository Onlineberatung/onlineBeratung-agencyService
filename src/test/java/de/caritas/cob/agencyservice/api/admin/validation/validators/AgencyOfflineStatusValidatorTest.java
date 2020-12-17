package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SUCHT;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDto;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.helper.WhiteSpotHelper;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Stream;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
class AgencyOfflineStatusValidatorTest {

  public static boolean IS_OFFLINE = true;
  public static boolean IS_NOT_OFFLINE = false;
  public static boolean IS_WHITE_SPOT_AGENCY = true;
  public static boolean IS_NOT_WHITE_SPOT_AGENCY = false;
  public static long NO_POSTCODE_RANGES = 0L;
  public static long WITH_POSTCODE_RANGES = 5L;
  @InjectMocks
  ValidateAgencyDto validateAgencyDto;
  @Mock
  WhiteSpotHelper whiteSpotHelper;
  @Mock
  AgencyRepository agencyRepository;
  @Mock
  AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;
  Map<Integer, Long> whiteSpotMap;

  static Stream<Arguments> validate_Should_ThrowInvalidOfflineStatusException_Arguments() {
    return Stream.of(
        Arguments.of(IS_NOT_OFFLINE, NO_POSTCODE_RANGES, IS_NOT_WHITE_SPOT_AGENCY)
    );
  }

  static Stream<Arguments> validate_Should_NotThrowInvalidOfflineStatusException_Arguments() {
    return Stream.of(
        Arguments.of(IS_NOT_OFFLINE, NO_POSTCODE_RANGES, IS_WHITE_SPOT_AGENCY),
        Arguments.of(IS_OFFLINE, NO_POSTCODE_RANGES, IS_WHITE_SPOT_AGENCY),
        Arguments.of(IS_NOT_OFFLINE, WITH_POSTCODE_RANGES, IS_NOT_WHITE_SPOT_AGENCY),
        Arguments.of(IS_OFFLINE, WITH_POSTCODE_RANGES, IS_NOT_WHITE_SPOT_AGENCY),
        Arguments.of(IS_OFFLINE, NO_POSTCODE_RANGES, IS_NOT_WHITE_SPOT_AGENCY)
    );
  }

  @BeforeEach
  void init() {
    initMocks(this);
    EasyRandom easyRandom = new EasyRandom();
    this.validateAgencyDto = easyRandom.nextObject(ValidateAgencyDto.class);
  }

  @ParameterizedTest
  @MethodSource("validate_Should_ThrowInvalidOfflineStatusException_Arguments")
  void validate_Should_ThrowInvalidOfflineStatusException(boolean isOffline,
      long numberOfAgencyPostcodeRanges, boolean isWhiteSpotAgency) {
    whiteSpotMap = new HashMap<>();
    whiteSpotMap.put(CONSULTING_TYPE_SUCHT.getValue(),
        isWhiteSpotAgency ? validateAgencyDto.getId() : validateAgencyDto.getId() + 1);
    this.validateAgencyDto.setOffline(isOffline);

    when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(numberOfAgencyPostcodeRanges);
    when(whiteSpotHelper.getWhiteSpotAgenciesMap()).thenReturn(whiteSpotMap);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(AGENCY_SUCHT));

    AgencyOfflineStatusValidator agencyOfflineStatusValidator = new AgencyOfflineStatusValidator(
        agencyRepository, agencyPostCodeRangeRepository,
        whiteSpotHelper);
    assertThrows(InvalidOfflineStatusException.class, () -> {
      agencyOfflineStatusValidator.validate(validateAgencyDto);
    });
  }

  @ParameterizedTest
  @MethodSource("validate_Should_NotThrowInvalidOfflineStatusException_Arguments")
  void validate_Should_NotThrowInvalidOfflineStatusException(
      boolean isOffline, long numberOfAgencyPostcodeRanges, boolean isWhiteSpotAgency) {
    whiteSpotMap = new HashMap<>();
    whiteSpotMap.put(CONSULTING_TYPE_SUCHT.getValue(),
        isWhiteSpotAgency ? validateAgencyDto.getId() : validateAgencyDto.getId() + 1);
    this.validateAgencyDto.setOffline(isOffline);

    when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(numberOfAgencyPostcodeRanges);
    when(whiteSpotHelper.getWhiteSpotAgenciesMap()).thenReturn(whiteSpotMap);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(AGENCY_SUCHT));

    new AgencyOfflineStatusValidator(agencyRepository, agencyPostCodeRangeRepository,
        whiteSpotHelper).validate(validateAgencyDto);
  }

  @Test
  public void agencyOfflineStatusValidator_Should_HaveUpdateAgencyValidatorAnnotation() {
    assertTrue(AgencyOfflineStatusValidator.class.isAnnotationPresent(UpdateAgencyValidator.class));
  }

}
