package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SUCHT;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDto;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.helper.WhiteSpotHelper;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class AgencyOfflineStatusValidatorTest {

  @InjectMocks
  private ValidateAgencyDto validateAgencyDto;
  @Mock
  private WhiteSpotHelper whiteSpotHelper;
  @Mock
  private AgencyRepository agencyRepository;
  @Mock
  private AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;

  private Map<Integer, Long> whiteSpotMap;


  @Before
  public void setup() {
    EasyRandom easyRandom = new EasyRandom();
    this.validateAgencyDto = easyRandom.nextObject(ValidateAgencyDto.class);
  }

  @Test(expected = InvalidOfflineStatusException.class)
  public void validate_Should_ThrowInvalidOfflineStatusException_WhenOfflineFalseAndNoWhiteSpotAgencyAndNoPostcodeRanges() {
    whiteSpotMap = new HashMap<>();
    whiteSpotMap.put(CONSULTING_TYPE_SUCHT.getValue(), validateAgencyDto.getId() + 1);
    this.validateAgencyDto.setOffline(false);
    when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(0L);
    when(whiteSpotHelper.getWhiteSpotAgenciesMap()).thenReturn(whiteSpotMap);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(AGENCY_SUCHT));
    new AgencyOfflineStatusValidator(agencyRepository, agencyPostCodeRangeRepository,
        whiteSpotHelper).validate(validateAgencyDto);
  }

  @Test
  public void validate_Should_NotThrowInvalidOfflineStatusException_WhenOfflineFalseAndNoWhiteSpotAgencyAndPostcodeRanges() {
    whiteSpotMap = new HashMap<>();
    whiteSpotMap.put(CONSULTING_TYPE_SUCHT.getValue(), validateAgencyDto.getId() + 1);
    this.validateAgencyDto.setOffline(false);
    when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(10L);
    when(whiteSpotHelper.getWhiteSpotAgenciesMap()).thenReturn(whiteSpotMap);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(AGENCY_SUCHT));
    new AgencyOfflineStatusValidator(agencyRepository, agencyPostCodeRangeRepository,
        whiteSpotHelper).validate(validateAgencyDto);
  }

  @Test
  public void validate_Should_NotThrowInvalidOfflineStatusException_WhenOfflineFalseAndWhiteSpotAgencyAndNoPostcodeRanges() {
    whiteSpotMap = new HashMap<>();
    whiteSpotMap.put(CONSULTING_TYPE_SUCHT.getValue(), validateAgencyDto.getId());
    this.validateAgencyDto.setOffline(false);
    when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(0L);
    when(whiteSpotHelper.getWhiteSpotAgenciesMap()).thenReturn(whiteSpotMap);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(AGENCY_SUCHT));
    new AgencyOfflineStatusValidator(agencyRepository, agencyPostCodeRangeRepository,
        whiteSpotHelper).validate(validateAgencyDto);
  }

  @Test
  public void validate_Should_NotThrowInvalidOfflineStatusException_WhenOfflineTrueAndWhiteSpotAgencyAndNoPostcodeRanges() {
    whiteSpotMap = new HashMap<>();
    whiteSpotMap.put(CONSULTING_TYPE_SUCHT.getValue(), validateAgencyDto.getId());
    this.validateAgencyDto.setOffline(true);
    when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(0L);
    when(whiteSpotHelper.getWhiteSpotAgenciesMap()).thenReturn(whiteSpotMap);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(AGENCY_SUCHT));
    new AgencyOfflineStatusValidator(agencyRepository, agencyPostCodeRangeRepository,
        whiteSpotHelper).validate(validateAgencyDto);
  }

  @Test
  public void validate_Should_NotThrowInvalidOfflineStatusException_WhenOfflineTrueAndNoWhiteSpotAgencyAndPostcodeRanges() {
    whiteSpotMap = new HashMap<>();
    whiteSpotMap.put(CONSULTING_TYPE_SUCHT.getValue(), validateAgencyDto.getId() + 1);
    this.validateAgencyDto.setOffline(true);
    when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(5L);
    when(whiteSpotHelper.getWhiteSpotAgenciesMap()).thenReturn(whiteSpotMap);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(AGENCY_SUCHT));
    new AgencyOfflineStatusValidator(agencyRepository, agencyPostCodeRangeRepository,
        whiteSpotHelper).validate(validateAgencyDto);
  }

}
