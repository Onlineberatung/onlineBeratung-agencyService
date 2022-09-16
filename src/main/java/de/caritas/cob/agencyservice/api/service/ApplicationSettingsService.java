package de.caritas.cob.agencyservice.api.service;

import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTO;
import de.caritas.cob.agencyservice.config.CacheManagerConfig;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.ApiClient;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.ApplicationsettingsControllerApi;

/**
 * Service class to communicate with the ConsultingTypeService.
 */
@Component
@RequiredArgsConstructor
public class ApplicationSettingsService {

  private final @NonNull ApplicationsettingsControllerApi applicationsettingsControllerApi;
  private final @NonNull SecurityHeaderSupplier securityHeaderSupplier;
  private final @NonNull TenantHeaderSupplier tenantHeaderSupplier;


  @Cacheable(value = CacheManagerConfig.APPLICATION_SETTINGS_CACHE)
  public ApplicationSettingsDTO getApplicationSettings() {
    addDefaultHeaders(this.applicationsettingsControllerApi.getApiClient());
    return this.applicationsettingsControllerApi.getApplicationSettings();
  }

  private void addDefaultHeaders(ApiClient apiClient) {
    var headers = this.securityHeaderSupplier.getCsrfHttpHeaders();
    tenantHeaderSupplier.addTenantHeader(headers);
    headers.forEach((key, value) -> apiClient.addDefaultHeader(key, value.iterator().next()));
  }

}
