package de.caritas.cob.agencyservice.api.service;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import de.caritas.cob.agencyservice.config.apiclient.ConsultingTypeServiceApiControllerFactory;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.ApiClient;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.ConsultingTypeControllerApi;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Spy;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpHeaders;
import org.springframework.test.util.ReflectionTestUtils;

@ExtendWith(MockitoExtension.class)
class ConsultingTypeServiceTest {

  @InjectMocks
  ConsultingTypeService consultingTypeService;

  @Mock
  ConsultingTypeControllerApi consultingTypeControllerApi;

  @Mock
  SecurityHeaderSupplier securityHeaderSupplier;

  @Spy
  TenantHeaderSupplier tenantHeaderSupplier;

  @Mock
  ConsultingTypeServiceApiControllerFactory consultingTypeServiceApiControllerFactory;

  @Spy
  ApiClient apiClient;

  @Test
  void getExtendedConsultingTypeResponseDTO_Should_addTenantHeaderForMultiTenancy() {
    TenantContext.setCurrentTenant(1L);
    var headers = new HttpHeaders();
    when(this.consultingTypeServiceApiControllerFactory.createControllerApi()).thenReturn(consultingTypeControllerApi);
    when(this.consultingTypeControllerApi.getApiClient()).thenReturn(apiClient);
    when(this.securityHeaderSupplier.getCsrfHttpHeaders()).thenReturn(headers);
    ReflectionTestUtils.setField(tenantHeaderSupplier, "multitenancy", true);
    this.consultingTypeService.getExtendedConsultingTypeResponseDTO(0);

    HttpHeaders apiClientHeaders = (HttpHeaders) ReflectionTestUtils
        .getField(apiClient, "defaultHeaders");
    assertEquals("1", apiClientHeaders.get("tenantId").get(0));
    TenantContext.clear();
  }

  @Test
  void getExtendedConsultingTypeResponseDTO_Should_addSecurityHeader() {
    var headers = new HttpHeaders();
    headers.add("header1", "header1");
    when(this.consultingTypeServiceApiControllerFactory.createControllerApi()).thenReturn(consultingTypeControllerApi);
    when(this.securityHeaderSupplier.getCsrfHttpHeaders()).thenReturn(headers);
    when(this.consultingTypeControllerApi.getApiClient()).thenReturn(apiClient);
    this.consultingTypeService.getExtendedConsultingTypeResponseDTO(0);
    HttpHeaders apiClientHeaders = (HttpHeaders) ReflectionTestUtils
        .getField(apiClient, "defaultHeaders");
    assertEquals("header1", apiClientHeaders.get("header1").get(0));
    TenantContext.clear();
  }

}
