package de.caritas.cob.agencyservice.api.service;

import de.caritas.cob.agencyservice.config.CacheManagerConfig;
import de.caritas.cob.agencyservice.tenantservice.generated.web.TenantControllerApi;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TenantService {

  private final @NonNull TenantControllerApi tenantControllerApi;

  @Cacheable(cacheNames = CacheManagerConfig.TENANT_CACHE, key = "#subdomain")
  public RestrictedTenantDTO getRestrictedTenantDataBySubdomain(String subdomain) {
    return tenantControllerApi.getRestrictedTenantDataBySubdomainWithHttpInfo(subdomain).getBody();
  }

  @Cacheable(cacheNames = CacheManagerConfig.TENANT_ID_CACHE, key = "#tenantId")
  public RestrictedTenantDTO getRestrictedTenantDataByTenantId(Long tenantId) {
    return tenantControllerApi.getRestrictedTenantDataByTenantId(tenantId);
  }

  @Cacheable(cacheNames = CacheManagerConfig.SINGLE_TENANT_CACHE)
  public RestrictedTenantDTO getRestrictedTenantDataForSingleTenant() {
    return tenantControllerApi.getRestrictedSingleTenantData();
  }
}
