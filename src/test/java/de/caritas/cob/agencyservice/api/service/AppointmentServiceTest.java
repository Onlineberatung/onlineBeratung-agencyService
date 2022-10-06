package de.caritas.cob.agencyservice.api.service;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.util.ReflectionTestUtils.setField;

import com.fasterxml.jackson.core.JsonProcessingException;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.config.apiclient.AppointmentServiceAgencyApiControllerFactory;
import lombok.NonNull;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Spy;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT) // To allow "UnnecessaryStubbing" to keep tests clean
class AppointmentServiceTest {

  private static final String FIELD_NAME_APPOINTMENTS_ENABLED = "appointmentFeatureEnabled";

  @Spy
  @InjectMocks
  AppointmentService appointmentService;

  // Mock dependencies
  @Mock
  de.caritas.cob.agencyservice.appointmentservice.generated.web.AgencyApi appointmentAgencyApi;
  @Mock
  SecurityHeaderSupplier securityHeaderSupplier;
  @Mock
  TenantHeaderSupplier tenantHeaderSupplier;

  // Mock test objects
  @Mock
  org.springframework.http.HttpHeaders httpHeaders;

  @Mock
  Agency agency;

  @Mock
  AppointmentServiceAgencyApiControllerFactory appointmentServiceAgencyApiControllerFactory;

  @BeforeEach
  public void beforeEach() {
    when(securityHeaderSupplier.getKeycloakAndCsrfHttpHeaders()).thenReturn(httpHeaders);
    when(appointmentServiceAgencyApiControllerFactory.createControllerApi()).thenReturn(appointmentAgencyApi);
  }


  @Test
  void syncAgencyDataToAppointmentService_Should_NotCallAppointmentService_WhenAppointmentsIsDisabled() {
    setField(appointmentService, FIELD_NAME_APPOINTMENTS_ENABLED, false);
    appointmentService.syncAgencyDataToAppointmentService(agency);
    verify(appointmentAgencyApi, never()).agencyMasterDataSync(any(
        de.caritas.cob.agencyservice.appointmentservice.generated.web.model.AgencyMasterDataSyncRequestDTO.class));
  }

  @Test
  void deleteAgency_Should_NotCallAppointmentService_WhenAppointmentsIsDisabled() {
    setField(appointmentService, FIELD_NAME_APPOINTMENTS_ENABLED, false);
    appointmentService.deleteAgency(agency);
    verify(appointmentAgencyApi, never()).deleteAgency(anyLong());
  }

  @Test
  void syncAgencyDataToAppointmentService_Should_CallAppointmentService_WhenAppointmentsIsDisabled() {
    setField(appointmentService, FIELD_NAME_APPOINTMENTS_ENABLED, true);
    appointmentService.syncAgencyDataToAppointmentService(agency);
    verify(appointmentAgencyApi, times(1)).agencyMasterDataSync(any(
        de.caritas.cob.agencyservice.appointmentservice.generated.web.model.AgencyMasterDataSyncRequestDTO.class));
  }

  @Test
  void deleteAgency_Should_CallAppointmentService_WhenAppointmentsIsDisabled() {
    setField(appointmentService, FIELD_NAME_APPOINTMENTS_ENABLED, true);
    appointmentService.deleteAgency(agency);
    verify(appointmentAgencyApi, times(1)).deleteAgency(anyLong());
  }
}