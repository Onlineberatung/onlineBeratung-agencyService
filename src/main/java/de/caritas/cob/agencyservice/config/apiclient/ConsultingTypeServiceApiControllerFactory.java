package de.caritas.cob.agencyservice.config.apiclient;

import de.caritas.cob.agencyservice.consultingtypeservice.generated.ApiClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.ConsultingTypeControllerApi;

@Component
public class ConsultingTypeServiceApiControllerFactory {

  @Value("${consulting.type.service.api.url}")
  private String consultingTypeServiceApiUrl;

  @Autowired
  private RestTemplate restTemplate;

  public ConsultingTypeControllerApi createControllerApi() {
    var apiClient = new ApiClient(restTemplate).setBasePath(this.consultingTypeServiceApiUrl);
    return new ConsultingTypeControllerApi(apiClient);
  }
}
