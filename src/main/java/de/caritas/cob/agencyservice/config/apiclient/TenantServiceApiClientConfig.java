package de.caritas.cob.agencyservice.config.apiclient;

import de.caritas.cob.agencyservice.tenantservice.generated.ApiClient;
import de.caritas.cob.agencyservice.tenantservice.generated.web.TenantControllerApi;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class TenantServiceApiClientConfig {

  @Value("${tenant.service.api.url}")
  private String tenantServiceApiUrl;

  @Bean
  @Primary
  public TenantControllerApi tenantControllerApi(ApiClient apiClient) {
    return new TenantControllerApi(apiClient);
  }

  @Bean
  @Primary
  public ApiClient tenantApiClient(RestTemplate restTemplate) {
    ApiClient apiClient = new TenantServiceApiClient(restTemplate);
    apiClient.setBasePath(this.tenantServiceApiUrl);
    return apiClient;
  }
}