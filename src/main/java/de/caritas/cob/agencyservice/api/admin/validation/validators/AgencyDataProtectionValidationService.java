package de.caritas.cob.agencyservice.api.admin.validation.validators;

import static de.caritas.cob.agencyservice.api.model.DataProtectionDTO.DataProtectionResponsibleEntityEnum.AGENCY_RESPONSIBLE;
import static de.caritas.cob.agencyservice.api.model.DataProtectionDTO.DataProtectionResponsibleEntityEnum.ALTERNATIVE_REPRESENTATIVE;
import static de.caritas.cob.agencyservice.api.model.DataProtectionDTO.DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER;
import static org.apache.commons.lang3.StringUtils.isBlank;

import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;
import de.caritas.cob.agencyservice.api.repository.agency.DataProtectionPlaceHolderType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class AgencyDataProtectionValidationService {

  public void validate(ValidateAgencyDTO validateAgencyDto) {
    validateThatDataProtectionDtoExists(validateAgencyDto);
    validateIfDataProtectionOfficer(validateAgencyDto);
    validateIfAgencyResponsible(validateAgencyDto);
    validateIfAlternativeRepresentative(validateAgencyDto);
  }

  private void validateThatDataProtectionDtoExists(ValidateAgencyDTO validateAgencyDto) {
    if (validateAgencyDto.getDataProtectionDTO() == null) {
      log.warn(
          "Could not save agency with id {} status. Required fields for data protection officer is empty.",
          validateAgencyDto.getId());
      throw new InvalidOfflineStatusException(
          HttpStatusExceptionReason.DATA_PROTECTION_DTO_IS_NULL);
    }
  }

  private void validateIfDataProtectionOfficer(ValidateAgencyDTO validateAgencyDto) {
    if (DATA_PROTECTION_OFFICER.equals(
        validateAgencyDto.getDataProtectionDTO().getDataProtectionResponsibleEntity())
        && areFieldsEmpty(
        validateAgencyDto.getDataProtectionDTO().getDataProtectionOfficerContact())) {
      log.warn(
          "Could not save agency with id {}. Required fields for data protection officer is empty.",
          validateAgencyDto.getId());
      throw new InvalidOfflineStatusException(
          HttpStatusExceptionReason.DATA_PROTECTION_OFFICER_IS_EMPTY);
    }
  }

  private void validateIfAgencyResponsible(ValidateAgencyDTO validateAgencyDto) {
    if (AGENCY_RESPONSIBLE.equals(
        validateAgencyDto.getDataProtectionDTO().getDataProtectionResponsibleEntity())
        && areFieldsEmpty(
        validateAgencyDto.getDataProtectionDTO().getAgencyDataProtectionResponsibleContact())) {
      log.warn(
          "Could not save agency with id {} status. Required fields for agency responsible is empty.",
          validateAgencyDto.getId());
      throw new InvalidOfflineStatusException(
          HttpStatusExceptionReason.DATA_PROTECTION_RESPONSIBLE_IS_EMPTY);
    }
  }

  private void validateIfAlternativeRepresentative(ValidateAgencyDTO validateAgencyDto) {
    if (ALTERNATIVE_REPRESENTATIVE.equals(
        validateAgencyDto.getDataProtectionDTO().getDataProtectionResponsibleEntity())
        && areFieldsEmpty(validateAgencyDto.getDataProtectionDTO()
        .getAlternativeDataProtectionRepresentativeContact())) {
      log.warn(
          "Could not save agency with id {} status. Required fields for alternative responsible is empty.",
          validateAgencyDto.getId());
      throw new InvalidOfflineStatusException(
          HttpStatusExceptionReason.DATA_PROTECTION_ALTERNATIVE_RESPONSIBLE_IS_EMPTY);
    }
  }

  private boolean areFieldsEmpty(DataProtectionContactDTO dataProtectionOfficerContact) {
    return dataProtectionOfficerContact == null
        || isBlank(dataProtectionOfficerContact.getNameAndLegalForm())
        || isBlank(dataProtectionOfficerContact.getCity())
        || isBlank(dataProtectionOfficerContact.getPostcode())
        || isBlank(dataProtectionOfficerContact.getEmail());
  }
}
