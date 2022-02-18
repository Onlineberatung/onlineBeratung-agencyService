package de.caritas.cob.agencyservice.api.service;

import static org.apache.commons.lang3.StringUtils.isNotBlank;

import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.config.ConsultingTypeCachingConfig;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.ApiClient;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.ConsultingTypeControllerApi;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import java.util.Collections;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * Service class to communicate with the ConsultingTypeService.
 */
@Component
@RequiredArgsConstructor
public class ConsultingTypeService {

  private static final String ORIGIN_HEADER_NAME = "origin";
  private static final String HOST_HEADER_NAME = "host";

  private final @NonNull ConsultingTypeControllerApi consultingTypeControllerApi;
  private final @NonNull SecurityHeaderSupplier securityHeaderSupplier;

  /**
   * Returns the {@link ExtendedConsultingTypeResponseDTO} for the provided consulting type ID. the
   * ExtendedConsultingTypeResponseDTO will be cached for further requests.
   *
   * @param consultingTypeId the consulting type ID for the extended consulting type response DTO
   * @return ExtendedConsultingTypeResponseDTO {@link ExtendedConsultingTypeResponseDTO}
   */
  @Cacheable(value = ConsultingTypeCachingConfig.CONSULTING_TYPE_CACHE, key = "#consultingTypeId")
  public ExtendedConsultingTypeResponseDTO getExtendedConsultingTypeResponseDTO(
      int consultingTypeId) {
    addDefaultHeaders(this.consultingTypeControllerApi.getApiClient());
    return this.consultingTypeControllerApi.getExtendedConsultingTypeById(consultingTypeId);
  }

  private void addDefaultHeaders(ApiClient apiClient) {
    var headers = this.securityHeaderSupplier.getCsrfHttpHeaders();
    addOriginHeader(headers);
    headers.forEach((key, value) -> apiClient.addDefaultHeader(key, value.iterator().next()));
  }

  private void addOriginHeader(HttpHeaders headers) {
    String originHeaderValue = getOriginHeaderValue();
    if (originHeaderValue != null) {
      headers.add(ORIGIN_HEADER_NAME, originHeaderValue);
    }
  }

  private String getOriginHeaderValue() {
    HttpServletRequest request =
        ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
            .getRequest();

    var requestHeaders = Collections.list(request.getHeaderNames())
        .stream()
        .collect(Collectors.toMap(headerName -> headerName, request::getHeader));
    return isNotBlank(requestHeaders.get(ORIGIN_HEADER_NAME)) ? requestHeaders
        .get(ORIGIN_HEADER_NAME) : requestHeaders.get(HOST_HEADER_NAME);
  }


}
