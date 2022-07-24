package de.caritas.cob.agencyservice.api.service;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.appointmentservice.generated.web.AgencyApi;
import de.caritas.cob.agencyservice.appointmentservice.generated.web.model.AgencyMasterDataSyncRequestDTO;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AppointmentService {

  private final @NonNull AgencyApi appointmentAgencyApi;

  @Value("${feature.appointment.enabled}")
  private boolean appointmentFeatureEnabled;

  public void syncAgencyDataToAppointmentService(Agency agency) {
    if (!appointmentFeatureEnabled) {
      return;
    }
    AgencyMasterDataSyncRequestDTO request = new AgencyMasterDataSyncRequestDTO();
    request.setId(agency.getId());
    request.setName(agency.getName());
    appointmentAgencyApi.agencyMasterDataSync(request);
  }

  public void deleteAgency(Agency agency) {
    if (!appointmentFeatureEnabled) {
      return;
    }
    appointmentAgencyApi.deleteAgency(agency.getId());
  }


}
