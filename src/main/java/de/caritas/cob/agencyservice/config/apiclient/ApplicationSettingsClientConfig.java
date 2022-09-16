package de.caritas.cob.agencyservice.config.apiclient;

import de.caritas.cob.agencyservice.applicationsettingsservice.generated.ApiClient;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.ApplicationsettingsControllerApi;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class ApplicationSettingsClientConfig {

  @Value("${consulting.type.service.api.url}")
  private String applicationsettingsServiceApiUrl;

  @Bean
  @Primary
  @Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
  public ApplicationsettingsControllerApi applicationsettingsControllerApi(ApiClient apiClient) {
    return new ApplicationsettingsControllerApi(apiClient);
  }

  @Bean
  @Primary
  @Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
  public ApiClient adminAgencyApiClient(RestTemplate restTemplate) {
    ApiClient apiClient = new ApplicationSettingsApiClient(restTemplate);
    apiClient.setBasePath(this.applicationsettingsServiceApiUrl);
    return apiClient;
  }
}