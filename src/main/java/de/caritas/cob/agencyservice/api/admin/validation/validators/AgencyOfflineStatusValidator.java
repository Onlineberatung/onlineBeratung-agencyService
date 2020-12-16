package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static java.util.Objects.nonNull;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDto;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.helper.WhiteSpotHelper;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
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
  private final @NonNull WhiteSpotHelper whiteSpotHelper;

  /**
   * Validates the offline status of an {@link ValidateAgencyDto}.
   *
   * @param validateAgencyDto (required)
   */
  @Override
  public void validate(ValidateAgencyDto validateAgencyDto) {
    if (!isWhiteSpotAgency(validateAgencyDto)
        && !isValidOfflineStatus(validateAgencyDto)) {
      throw new InvalidOfflineStatusException();
    }
  }

  private boolean isValidOfflineStatus(ValidateAgencyDto validateAgencyDto) {
    return Boolean.TRUE.equals(validateAgencyDto.getOffline())
        || agencyPostCodeRangeRepository.countAllByAgencyId(validateAgencyDto.getId()) > 0;
  }

  private boolean isWhiteSpotAgency(ValidateAgencyDto validateAgencyDto) {
    ConsultingType consultingType = obtainConsultingTypeOfAgency(validateAgencyDto);
    return nonNull(getWhiteSpotAgencyIdForConsultingType(consultingType))
        && getWhiteSpotAgencyIdForConsultingType(consultingType)
        .equals(validateAgencyDto.getId());
  }

  private Long getWhiteSpotAgencyIdForConsultingType(ConsultingType consultingType) {
    return whiteSpotHelper.getWhiteSpotAgenciesMap()
        .get(consultingType.getValue());
  }

  private ConsultingType obtainConsultingTypeOfAgency(ValidateAgencyDto validateAgencyDto) {
    return agencyRepository.findById(validateAgencyDto.getId())
        .orElseThrow(NotFoundException::new).getConsultingType();
  }
}
