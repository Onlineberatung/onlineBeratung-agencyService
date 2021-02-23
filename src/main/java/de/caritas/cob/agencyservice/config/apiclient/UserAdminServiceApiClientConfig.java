package de.caritas.cob.agencyservice.config.apiclient;

import de.caritas.cob.agencyservice.useradminservice.generated.ApiClient;
import de.caritas.cob.agencyservice.useradminservice.generated.web.AdminUserControllerApi;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class UserAdminServiceApiClientConfig {

  @Value("${user.admin.service.api.url}")
  private String userAdminServiceApiUrl;

  @Bean
  public AdminUserControllerApi adminUserControllerApi(ApiClient apiClient) {
    return new AdminUserControllerApi(apiClient);
  }

  @Bean
  @Primary
  public ApiClient adminAgencyApiClient(RestTemplate restTemplate) {
    ApiClient apiClient = new UserAdminApiClient(restTemplate);
    apiClient.setBasePath(this.userAdminServiceApiUrl);
    return apiClient;
  }
}