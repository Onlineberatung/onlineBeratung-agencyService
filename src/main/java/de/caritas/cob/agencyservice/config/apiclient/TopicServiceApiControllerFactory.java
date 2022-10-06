package de.caritas.cob.agencyservice.config.apiclient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import de.caritas.cob.agencyservice.topicservice.generated.ApiClient;
import de.caritas.cob.agencyservice.topicservice.generated.web.TopicControllerApi;

@Component
public class TopicServiceApiControllerFactory {

  @Value("${consulting.type.service.api.url}")
  private String topicServiceApiUrl;

  @Autowired
  private RestTemplate restTemplate;

  public TopicControllerApi createControllerApi() {
    var apiClient = new ApiClient(restTemplate).setBasePath(this.topicServiceApiUrl);
    return new TopicControllerApi(apiClient);
  }
}
