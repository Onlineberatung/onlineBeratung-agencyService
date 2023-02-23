package de.caritas.cob.agencyservice.api.tenant;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class TenantContextProvider {

  private static final Long TECHNICAL_TENANT_ID = 0L;
  @Value("${multitenancy.enabled}")
  private boolean multiTenancyEnabled;

  public void setTechnicalContextIfMultiTenancyIsEnabled() {
    if (multiTenancyEnabled) {
      TenantContext.setCurrentTenant(TECHNICAL_TENANT_ID);
    }
  }
}
