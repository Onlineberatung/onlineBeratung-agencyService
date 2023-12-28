package de.caritas.cob.agencyservice.api.admin.validation.validators;

import de.caritas.cob.agencyservice.api.admin.validation.validators.annotation.UpdateAgencyValidator;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;
import de.caritas.cob.agencyservice.api.service.ApplicationSettingsService;
import de.caritas.cob.agencyservice.api.service.TenantService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@UpdateAgencyValidator
@Slf4j
public class AgencyDataProtectionValidator implements ConcreteAgencyValidator {

  private final @NonNull TenantService tenantService;

  private final @NonNull ApplicationSettingsService applicationSettingsService;

  private final @NonNull AgencyDataProtectionValidationService agencyDataProtectionValidationService;

  @Value("${feature.multitenancy.with.single.domain.enabled}")
  private boolean multitenancyWithSingleDomain;

  @Override
  public void validate(ValidateAgencyDTO validateAgencyDto) {

    var tenant = tenantService.getRestrictedTenantDataByTenantId(validateAgencyDto.getTenantId());

    if (Boolean.TRUE.equals(tenant.getSettings().getFeatureCentralDataProtectionTemplateEnabled())) {
      log.info("Validating agency data protection for agency with id {}.", validateAgencyDto.getId());
      agencyDataProtectionValidationService.validate(validateAgencyDto);
    }

    if (multitenancyWithSingleDomain) {
      var mainTenantSubdomainForSingleDomainMultitenancy = applicationSettingsService.getApplicationSettings()
          .getMainTenantSubdomainForSingleDomainMultitenancy();
      de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO mainTenant = tenantService.getRestrictedTenantDataBySubdomain(
          mainTenantSubdomainForSingleDomainMultitenancy.getValue());
      if (Boolean.TRUE.equals(mainTenant.getSettings().getFeatureCentralDataProtectionTemplateEnabled())) {
        agencyDataProtectionValidationService.validate(validateAgencyDto);
      }
    }
  }
}
