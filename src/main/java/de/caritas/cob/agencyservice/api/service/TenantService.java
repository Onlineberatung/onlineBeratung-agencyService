package de.caritas.cob.agencyservice.api.service;

import de.caritas.cob.agencyservice.config.CacheManagerConfig;
import de.caritas.cob.agencyservice.tenantservice.generated.web.TenantControllerApi;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TenantService {

  private final @NonNull TenantControllerApi tenantControllerApi;

  @Value("${multitenancy.enabled}")
  private boolean multitenancy;

  @Cacheable(cacheNames = CacheManagerConfig.TENANT_CACHE, key = "#subdomain")
  public RestrictedTenantDTO getRestrictedTenantDataBySubdomain(String subdomain) {
    return tenantControllerApi.getRestrictedTenantDataBySubdomainWithHttpInfo(subdomain).getBody();
  }

  public RestrictedTenantDTO getRestrictedTenantDataByTenantId(Long tenantId) {
    return tenantControllerApi.getRestrictedTenantDataByTenantId(tenantId);
  }

  public RestrictedTenantDTO getRestrictedTenantDataForSingleTenant() {
    return tenantControllerApi.getRestrictedSingleTenantData();
  }
}
