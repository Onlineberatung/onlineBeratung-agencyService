package de.caritas.cob.agencyservice.api.service;

import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.config.CacheManagerConfig;
import de.caritas.cob.agencyservice.config.apiclient.ConsultingTypeServiceApiControllerFactory;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.ApiClient;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.ConsultingTypeControllerApi;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

/**
 * Service class to communicate with the ConsultingTypeService.
 */
@Component
@RequiredArgsConstructor
public class ConsultingTypeService {

  private final @NonNull ConsultingTypeServiceApiControllerFactory consultingTypeServiceApiControllerFactory;
  private final @NonNull SecurityHeaderSupplier securityHeaderSupplier;
  private final @NonNull TenantHeaderSupplier tenantHeaderSupplier;

  /**
   * Returns the {@link ExtendedConsultingTypeResponseDTO} for the provided consulting type ID. the
   * ExtendedConsultingTypeResponseDTO will be cached for further requests.
   *
   * @param consultingTypeId the consulting type ID for the extended consulting type response DTO
   * @return ExtendedConsultingTypeResponseDTO {@link ExtendedConsultingTypeResponseDTO}
   */
  @Cacheable(value = CacheManagerConfig.CONSULTING_TYPE_CACHE, key = "#consultingTypeId")
  public ExtendedConsultingTypeResponseDTO getExtendedConsultingTypeResponseDTO(
      int consultingTypeId) {
    ConsultingTypeControllerApi controllerApi = consultingTypeServiceApiControllerFactory.createControllerApi();
    addDefaultHeaders(controllerApi.getApiClient());
    return controllerApi.getExtendedConsultingTypeById(consultingTypeId);
  }

  private void addDefaultHeaders(ApiClient apiClient) {
    var headers = this.securityHeaderSupplier.getCsrfHttpHeaders();
    tenantHeaderSupplier.addTenantHeader(headers);
    headers.forEach((key, value) -> apiClient.addDefaultHeader(key, value.iterator().next()));
  }

}
