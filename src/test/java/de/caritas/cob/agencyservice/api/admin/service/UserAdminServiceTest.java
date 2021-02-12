package de.caritas.cob.agencyservice.api.admin.service;

import static de.caritas.cob.agencyservice.useradminservice.generated.web.model.AgencyTypeDTO.AgencyTypeEnum.TEAM_AGENCY;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.useradminservice.generated.ApiClient;
import de.caritas.cob.agencyservice.useradminservice.generated.web.AdminUserControllerApi;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.AgencyTypeDTO;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.ConsultantFilter;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.ConsultantSearchResultDTO;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.http.HttpHeaders;

@RunWith(MockitoJUnitRunner.class)
public class UserAdminServiceTest {

  @InjectMocks
  private UserAdminService userAdminService;

  @Mock
  private AdminUserControllerApi adminUserControllerApi;

  @Mock
  private SecurityHeaderSupplier securityHeaderSupplier;

  @Mock
  private ApiClient apiClient;

  private final HttpHeaders httpHeaders = new EasyRandom().nextObject(HttpHeaders.class);

  @Before
  public void setup() {
    when(this.adminUserControllerApi.getApiClient()).thenReturn(this.apiClient);
    when(this.securityHeaderSupplier.getKeycloakAndCsrfHttpHeaders())
        .thenReturn(this.httpHeaders);
  }

  @Test
  public void adaptRelatedConsultantsForChange_Should_callServicesCorrectly() {
    Long agencyId = 1L;

    this.userAdminService.adaptRelatedConsultantsForChange(agencyId, TEAM_AGENCY.getValue());

    verify(this.adminUserControllerApi, times(1)).changeAgencyType(eq(agencyId),
        eq(new AgencyTypeDTO().agencyType(TEAM_AGENCY)));
    verify(this.apiClient, times(this.httpHeaders.size())).addDefaultHeader(any(), any());
  }

  @Test
  public void getConsultantsOfAgency_Should_callServicesCorrectly() {
    Long agencyId = 1L;
    int currentPage = 1;
    int perPage = 1;
    when(this.adminUserControllerApi.getConsultants(any(), any(), any()))
        .thenReturn(new EasyRandom().nextObject(ConsultantSearchResultDTO.class));

    this.userAdminService.getConsultantsOfAgency(agencyId, currentPage, perPage);

    verify(this.adminUserControllerApi, times(1))
        .getConsultants(eq(currentPage), eq(perPage),
            eq(new ConsultantFilter().agencyId(agencyId)));
    verify(this.apiClient, times(this.httpHeaders.size())).addDefaultHeader(any(), any());
  }

}
