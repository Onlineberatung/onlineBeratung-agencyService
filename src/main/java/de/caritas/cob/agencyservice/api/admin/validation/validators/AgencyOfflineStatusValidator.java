package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_CONTAINS_NO_CONSULTANTS;
import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_IS_LOCKED;
import static java.util.Objects.nonNull;
import static org.apache.commons.lang3.BooleanUtils.isFalse;


import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
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

    if (isFalse(validateAgencyDto.getOffline())) {

      if (!isWhiteSpotAgency(validateAgencyDto) && !hasPostCodeRanges(validateAgencyDto)) {
        throw new InvalidOfflineStatusException();
      }

      if (hasNoConsultant(validateAgencyDto)) {
        throw new InvalidOfflineStatusException(AGENCY_CONTAINS_NO_CONSULTANTS);
      }

    } else {

      if (isLocked(validateAgencyDto)) {
        throw new InvalidOfflineStatusException(AGENCY_IS_LOCKED);
      }

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
      return Long.valueOf(consultingTypeManager.getConsultingTypeSettings(consultingTypeId).getWhiteSpot()
          .getWhiteSpotAgencyId());
  }

  private boolean hasPostCodeRanges(ValidateAgencyDTO validateAgencyDto) {
    return agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()) > 0;
  }

  private boolean isLocked(ValidateAgencyDTO validateAgencyDTO) {
    Agency agency = this.agencyRepository.findById(validateAgencyDTO.getId())
        .orElseThrow(NotFoundException::new);
    ExtendedConsultingTypeResponseDTO consultantTypeSettings = consultingTypeManager.getConsultingTypeSettings(agency.getConsultingTypeId());
    return consultantTypeSettings.getLockedAgencies();
  }

  private boolean hasNoConsultant(ValidateAgencyDTO validateAgencyDto) {
    return this.userAdminService.getConsultantsOfAgency(validateAgencyDto.getId(), 1, 1)
        .isEmpty();
  }
}
