package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_KREUZBUND;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_SUCHT;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeSettings;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.ConsultantAdminResponseDTO;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
class AgencyOfflineStatusValidatorTest {

  static boolean IS_OFFLINE = true;
  static boolean IS_NOT_OFFLINE = false;
  static boolean IS_WHITE_SPOT_AGENCY = true;
  static boolean IS_NOT_WHITE_SPOT_AGENCY = false;
  static long NO_POSTCODE_RANGES = 0L;
  static long WITH_POSTCODE_RANGES = 5L;
  static List<ConsultantAdminResponseDTO> NO_CONSULTANT = emptyList();
  static List<ConsultantAdminResponseDTO> ONE_CONSULTANT = singletonList(
      new ConsultantAdminResponseDTO());
  static boolean IS_LOCKED_AGENCY = true;
  static boolean IS_NOT_LOCKED_AGENCY = false;

  @Mock
  AgencyRepository agencyRepository;

  @Mock
  AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;

  @Mock
  UserAdminService userAdminService;

  @Mock
  ConsultingTypeManager consultingTypeManager;

  ValidateAgencyDTO validateAgencyDto;

  ConsultingTypeSettings consultingTypeSettings;

  static Stream<Arguments> validate_Should_ThrowInvalidOfflineStatusException_Arguments() {
    return Stream.of(
        Arguments.of(IS_NOT_OFFLINE, NO_POSTCODE_RANGES, IS_NOT_WHITE_SPOT_AGENCY, NO_CONSULTANT,
            IS_NOT_LOCKED_AGENCY, AGENCY_SUCHT),
        Arguments.of(IS_NOT_OFFLINE, WITH_POSTCODE_RANGES, IS_WHITE_SPOT_AGENCY, NO_CONSULTANT,
            IS_NOT_LOCKED_AGENCY, AGENCY_SUCHT),
        Arguments.of(IS_OFFLINE, WITH_POSTCODE_RANGES, IS_WHITE_SPOT_AGENCY, NO_CONSULTANT,
            IS_LOCKED_AGENCY, AGENCY_SUCHT),
        Arguments.of(IS_OFFLINE, WITH_POSTCODE_RANGES, IS_WHITE_SPOT_AGENCY, NO_CONSULTANT,
            IS_LOCKED_AGENCY, AGENCY_KREUZBUND)
    );
  }

  static Stream<Arguments> validate_Should_NotThrowInvalidOfflineStatusException_Arguments() {
    return Stream.of(
        Arguments.of(IS_NOT_OFFLINE, NO_POSTCODE_RANGES, IS_WHITE_SPOT_AGENCY, ONE_CONSULTANT),
        Arguments.of(IS_OFFLINE, NO_POSTCODE_RANGES, IS_WHITE_SPOT_AGENCY, NO_CONSULTANT),
        Arguments.of(IS_NOT_OFFLINE, WITH_POSTCODE_RANGES, IS_NOT_WHITE_SPOT_AGENCY, ONE_CONSULTANT),
        Arguments.of(IS_OFFLINE, WITH_POSTCODE_RANGES, IS_NOT_WHITE_SPOT_AGENCY, NO_CONSULTANT),
        Arguments.of(IS_OFFLINE, NO_POSTCODE_RANGES, IS_NOT_WHITE_SPOT_AGENCY, NO_CONSULTANT)
    );
  }

  @BeforeEach
  void init() {
    initMocks(this);
    EasyRandom easyRandom = new EasyRandom();
    this.validateAgencyDto = easyRandom.nextObject(ValidateAgencyDTO.class);
    this.consultingTypeSettings = easyRandom.nextObject(ConsultingTypeSettings.class);
  }

  @ParameterizedTest
  @MethodSource("validate_Should_ThrowInvalidOfflineStatusException_Arguments")
  void validate_Should_ThrowInvalidOfflineStatusException(boolean isOffline,
      long numberOfAgencyPostcodeRanges, boolean isWhiteSpotAgency,
      List<ConsultantAdminResponseDTO> assignedConsultants, boolean isLockedAgency, Agency agency)
      throws MissingConsultingTypeException {

    this.validateAgencyDto.setOffline(isOffline);

    consultingTypeSettings.getWhiteSpot().setWhiteSpotAgencyAssigned(isWhiteSpotAgency);
    consultingTypeSettings.getWhiteSpot().setWhiteSpotAgencyId(isWhiteSpotAgency ? validateAgencyDto.getId() : validateAgencyDto.getId() + 1);
    consultingTypeSettings.setConsultingTypeId(agency.getConsultingTypeId());
    consultingTypeSettings.setLockedAgency(isLockedAgency);

    when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(numberOfAgencyPostcodeRanges);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(agency));
    when(this.userAdminService.getConsultantsOfAgency(anyLong(), anyInt(), anyInt()))
        .thenReturn(assignedConsultants);
    when(consultingTypeManager.getConsultantTypeSettings(anyInt())).thenReturn(consultingTypeSettings);

    AgencyOfflineStatusValidator agencyOfflineStatusValidator = new AgencyOfflineStatusValidator(
        agencyRepository, agencyPostCodeRangeRepository, userAdminService, consultingTypeManager);
    assertThrows(InvalidOfflineStatusException.class,
        () -> agencyOfflineStatusValidator.validate(validateAgencyDto));
  }

  @ParameterizedTest
  @MethodSource("validate_Should_NotThrowInvalidOfflineStatusException_Arguments")
  void validate_Should_NotThrowInvalidOfflineStatusException(
      boolean isOffline, long numberOfAgencyPostcodeRanges, boolean isWhiteSpotAgency,
      List<ConsultantAdminResponseDTO> assignedConsultants) throws MissingConsultingTypeException {

    this.validateAgencyDto.setOffline(isOffline);

    consultingTypeSettings.getWhiteSpot().setWhiteSpotAgencyAssigned(isWhiteSpotAgency);
    consultingTypeSettings.getWhiteSpot().setWhiteSpotAgencyId(isWhiteSpotAgency ? validateAgencyDto.getId() : validateAgencyDto.getId() + 1);
    consultingTypeSettings.setConsultingTypeId(AGENCY_SUCHT.getConsultingTypeId());

    when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(numberOfAgencyPostcodeRanges);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(AGENCY_SUCHT));
    when(this.userAdminService.getConsultantsOfAgency(anyLong(), anyInt(), anyInt()))
        .thenReturn(assignedConsultants);
    when(consultingTypeManager.getConsultantTypeSettings(anyInt())).thenReturn(consultingTypeSettings);

    assertDoesNotThrow(() -> new AgencyOfflineStatusValidator(agencyRepository,
        agencyPostCodeRangeRepository, userAdminService, consultingTypeManager)
        .validate(validateAgencyDto));
  }

  @Test
  public void agencyOfflineStatusValidator_Should_HaveUpdateAgencyValidatorAnnotation() {
    assertTrue(AgencyOfflineStatusValidator.class.isAnnotationPresent(UpdateAgencyValidator.class));
  }

}
