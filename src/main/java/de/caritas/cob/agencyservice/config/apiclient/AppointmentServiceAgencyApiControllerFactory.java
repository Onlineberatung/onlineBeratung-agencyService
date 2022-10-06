package de.caritas.cob.agencyservice.config.apiclient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import de.caritas.cob.agencyservice.appointmentservice.generated.ApiClient;
import de.caritas.cob.agencyservice.appointmentservice.generated.web.AgencyApi;

@Component
public class AppointmentServiceAgencyApiControllerFactory {

  @Value("${appointment.service.api.url}")
  private String appointmentServiceApiUrl;

  @Autowired
  private RestTemplate restTemplate;

  public AgencyApi createControllerApi() {
    var apiClient = new ApiClient(restTemplate).setBasePath(this.appointmentServiceApiUrl);
    return new de.caritas.cob.agencyservice.appointmentservice.generated.web.AgencyApi(apiClient);
  }
}
