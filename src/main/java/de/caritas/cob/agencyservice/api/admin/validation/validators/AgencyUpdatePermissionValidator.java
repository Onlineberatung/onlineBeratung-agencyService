package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.exception.httpresponses.AgencyAccessDeniedException;
import de.caritas.cob.agencyservice.api.util.AuthenticatedUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@UpdateAgencyValidator
@Slf4j
public class AgencyUpdatePermissionValidator implements ConcreteAgencyValidator {

  @Autowired
  AuthenticatedUser authenticatedUser;

  @Autowired
  UserAdminService userAdminService;

  public void validate(ValidateAgencyDTO validateAgencyDto) {
    if (authenticatedUser.hasRestrictedAgencyPriviliges()) {
      var adminAgencyIds = userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId());
      if (!adminAgencyIds.contains(validateAgencyDto.getId())) {
        log.warn("Admin user with id does not have permission to this agency: {}", authenticatedUser.getUserId(), validateAgencyDto.getId());
        throw new AgencyAccessDeniedException();
      }
    }
  }
}
