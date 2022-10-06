package de.caritas.cob.agencyservice.api.service;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.appointmentservice.generated.ApiClient;
import de.caritas.cob.agencyservice.appointmentservice.generated.web.AgencyApi;
import de.caritas.cob.agencyservice.appointmentservice.generated.web.model.AgencyMasterDataSyncRequestDTO;
import de.caritas.cob.agencyservice.config.apiclient.AppointmentServiceAgencyApiControllerFactory;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AppointmentService {

  private final @NonNull AppointmentServiceAgencyApiControllerFactory appointmentServiceAgencyApiControllerFactory;
  private final @NonNull SecurityHeaderSupplier securityHeaderSupplier;
  private final @NonNull TenantHeaderSupplier tenantHeaderSupplier;

  @Value("${feature.appointment.enabled}")
  private boolean appointmentFeatureEnabled;

  public void syncAgencyDataToAppointmentService(Agency agency) {
    if (!appointmentFeatureEnabled) {
      return;
    }
    AgencyMasterDataSyncRequestDTO request = new AgencyMasterDataSyncRequestDTO();
    request.setId(agency.getId());
    request.setName(agency.getName());
    AgencyApi controllerApi = appointmentServiceAgencyApiControllerFactory.createControllerApi();
    addDefaultHeaders(controllerApi.getApiClient());
    controllerApi.agencyMasterDataSync(request);
  }

  public void deleteAgency(Agency agency) {
    if (!appointmentFeatureEnabled) {
      return;
    }
    AgencyApi controllerApi = appointmentServiceAgencyApiControllerFactory.createControllerApi();
    addDefaultHeaders(controllerApi.getApiClient());
    controllerApi.deleteAgency(agency.getId());
  }


  protected void addDefaultHeaders(ApiClient apiClient) {
    HttpHeaders headers = this.securityHeaderSupplier.getKeycloakAndCsrfHttpHeaders();
    tenantHeaderSupplier.addTenantHeader(headers);
    headers.forEach((key, value) -> apiClient.addDefaultHeader(key, value.iterator().next()));
  }

}
