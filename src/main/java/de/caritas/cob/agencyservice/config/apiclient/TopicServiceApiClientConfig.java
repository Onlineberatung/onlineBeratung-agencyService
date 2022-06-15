package de.caritas.cob.agencyservice.config.apiclient;

import de.caritas.cob.agencyservice.topicservice.generated.web.TopicControllerApi;
import de.caritas.cob.agencyservice.topicservice.generated.ApiClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class TopicServiceApiClientConfig {

  @Value("${consulting.type.service.api.url}")
  private String topicServiceApiUrl;

  @Bean
  public TopicControllerApi topicControllerApi(ApiClient apiClient) {
    apiClient.setDebugging(true);
    return new de.caritas.cob.agencyservice.topicservice.generated.web.TopicControllerApi(apiClient);
  }

  @Bean
  @Primary
  public ApiClient topicApiClient(RestTemplate restTemplate) {
    de.caritas.cob.agencyservice.topicservice.generated.ApiClient apiClient = new ApiClient(restTemplate);
    apiClient.setBasePath(this.topicServiceApiUrl);
    return apiClient;
  }
}