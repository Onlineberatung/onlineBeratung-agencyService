package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_SUCHT;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.lenient;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRangeRepository;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.ConsultantAdminResponseDTO;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.stream.Stream;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
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

  @Mock
  AgencyRepository agencyRepository;

  @Mock
  AgencyPostcodeRangeRepository agencyPostCodeRangeRepository;

  @Mock
  UserAdminService userAdminService;

  @Mock
  ConsultingTypeManager consultingTypeManager;

  ValidateAgencyDTO validateAgencyDto;

  ExtendedConsultingTypeResponseDTO consultingTypeSettings;

  static Stream<Arguments> validate_Should_ThrowInvalidOfflineStatusException_Arguments() {
    return Stream.of(
        Arguments.of(IS_NOT_OFFLINE, NO_POSTCODE_RANGES, IS_NOT_WHITE_SPOT_AGENCY, NO_CONSULTANT,
            AGENCY_SUCHT),
        Arguments.of(IS_NOT_OFFLINE, WITH_POSTCODE_RANGES, IS_WHITE_SPOT_AGENCY, NO_CONSULTANT,
            AGENCY_SUCHT)
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
    this.consultingTypeSettings = easyRandom.nextObject(ExtendedConsultingTypeResponseDTO.class);
    this.consultingTypeSettings.setWhiteSpot(easyRandom.nextObject(de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTOAllOfWhiteSpot.class));
  }

  @ParameterizedTest
  @MethodSource("validate_Should_ThrowInvalidOfflineStatusException_Arguments")
  void validate_Should_ThrowInvalidOfflineStatusException(boolean isOffline,
      long numberOfAgencyPostcodeRanges, boolean isWhiteSpotAgency,
      List<ConsultantAdminResponseDTO> assignedConsultants, Agency agency)
      throws MissingConsultingTypeException {

    this.validateAgencyDto.setOffline(isOffline);
    this.validateAgencyDto.setId((long) new Random().nextInt());

    consultingTypeSettings.getWhiteSpot().setWhiteSpotAgencyAssigned(isWhiteSpotAgency);
    consultingTypeSettings.getWhiteSpot().setWhiteSpotAgencyId(isWhiteSpotAgency ? validateAgencyDto.getId().intValue() : validateAgencyDto.getId().intValue() + 1);
    consultingTypeSettings.setId(agency.getConsultingTypeId());

    lenient().when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(numberOfAgencyPostcodeRanges);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(agency));
    lenient().when(this.userAdminService.getConsultantsOfAgency(anyLong(), anyInt(), anyInt()))
        .thenReturn(assignedConsultants);
    when(consultingTypeManager.getConsultingTypeSettings(anyInt())).thenReturn(consultingTypeSettings);

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
    this.validateAgencyDto.setId((long) new Random().nextInt());

    consultingTypeSettings.getWhiteSpot().setWhiteSpotAgencyAssigned(isWhiteSpotAgency);
    consultingTypeSettings.getWhiteSpot().setWhiteSpotAgencyId(isWhiteSpotAgency ? validateAgencyDto.getId().intValue() : validateAgencyDto.getId().intValue() + 1);
    consultingTypeSettings.setId(AGENCY_SUCHT.getConsultingTypeId());
    lenient().when(agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()))
        .thenReturn(numberOfAgencyPostcodeRanges);
    when(agencyRepository.findById(validateAgencyDto.getId()))
        .thenReturn(Optional.of(AGENCY_SUCHT));
    lenient().when(this.userAdminService.getConsultantsOfAgency(anyLong(), anyInt(), anyInt()))
        .thenReturn(assignedConsultants);
    when(consultingTypeManager.getConsultingTypeSettings(anyInt())).thenReturn(consultingTypeSettings);

    assertDoesNotThrow(() -> new AgencyOfflineStatusValidator(agencyRepository,
        agencyPostCodeRangeRepository, userAdminService, consultingTypeManager)
        .validate(validateAgencyDto));
  }

  @Test
  public void agencyOfflineStatusValidator_Should_HaveUpdateAgencyValidatorAnnotation() {
    assertTrue(AgencyOfflineStatusValidator.class.isAnnotationPresent(UpdateAgencyValidator.class));
  }

}
