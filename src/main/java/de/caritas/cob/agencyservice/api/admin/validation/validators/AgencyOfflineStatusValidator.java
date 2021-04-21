package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_CONTAINS_NO_CONSULTANTS;
import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_KREUZBUND_IS_LOCKED_TO_SET_OFFLINE;
import static java.util.Objects.nonNull;
import static org.apache.commons.lang3.BooleanUtils.isFalse;
import static org.apache.commons.lang3.BooleanUtils.isTrue;

import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeSettings;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/*
 * Offline status validator for an {@link ValidateAgencyDto}.
 */
@Component
@RequiredArgsConstructor
@UpdateAgencyValidator
public class AgencyOfflineStatusValidator implements ConcreteAgencyValidator {

  private final @NonNull AgencyRepository agencyRepository;
  private final @NonNull AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;
  private final @NonNull UserAdminService userAdminService;
  private final @NonNull ConsultingTypeManager consultingTypeManager;

  /**
   * Validates the offline status of an {@link ValidateAgencyDTO}.
   *
   * @param validateAgencyDto (required)
   */
  @Override
  public void validate(ValidateAgencyDTO validateAgencyDto) {
    if (!isWhiteSpotAgency(validateAgencyDto) && !isValidOfflineStatus(validateAgencyDto)) {
      throw new InvalidOfflineStatusException();
    }
    if (isKreuzbundAgency(validateAgencyDto)) {
      throw new InvalidOfflineStatusException(AGENCY_KREUZBUND_IS_LOCKED_TO_SET_OFFLINE);
    }
    if (doesAgencyContainNoConsultant(validateAgencyDto)) {
      throw new InvalidOfflineStatusException(AGENCY_CONTAINS_NO_CONSULTANTS);
    }
  }

  private boolean isWhiteSpotAgency(ValidateAgencyDTO validateAgencyDto) {
    int consultingTypeId = obtainConsultingTypeOfAgency(validateAgencyDto);
    return nonNull(getWhiteSpotAgencyIdForConsultingType(consultingTypeId))
        && getWhiteSpotAgencyIdForConsultingType(consultingTypeId)
        .equals(validateAgencyDto.getId());
  }

  private int obtainConsultingTypeOfAgency(ValidateAgencyDTO validateAgencyDto) {
    return agencyRepository.findById(validateAgencyDto.getId())
        .orElseThrow(NotFoundException::new).getConsultingTypeId();
  }

  private Long getWhiteSpotAgencyIdForConsultingType(int consultingTypeId) {
    try {
      return consultingTypeManager.getConsultantTypeSettings(consultingTypeId).getWhiteSpot()
          .getWhiteSpotAgencyId();
    } catch (MissingConsultingTypeException e) {
      throw new NotFoundException();
    }
  }

  private boolean isValidOfflineStatus(ValidateAgencyDTO validateAgencyDto) {
    return isTrue(validateAgencyDto.getOffline())
        || agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()) > 0;
  }

  // TODO: remove hard-coded reference to "kreuzbund"
  private boolean isKreuzbundAgency(ValidateAgencyDTO validateAgencyDTO) {
    Agency agency = this.agencyRepository.findById(validateAgencyDTO.getId())
        .orElseThrow(NotFoundException::new);
    ConsultingTypeSettings consultantTypeSettings;
    try {
      consultantTypeSettings = consultingTypeManager
          .getConsultantTypeSettings(agency.getConsultingTypeId());
    } catch (MissingConsultingTypeException e) {
      throw new InvalidConsultingTypeException();
    }
    return consultantTypeSettings.getConsultingTypeId() == 15 && isTrue(
        validateAgencyDTO.getOffline());
  }

  private boolean doesAgencyContainNoConsultant(ValidateAgencyDTO validateAgencyDto) {
    return this.userAdminService.getConsultantsOfAgency(validateAgencyDto.getId(), 1, 1)
        .isEmpty() && isFalse(validateAgencyDto.getOffline());
  }
}
