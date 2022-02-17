package de.caritas.cob.agencyservice.api.service;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.ApiClient;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.ConsultingTypeControllerApi;
import java.util.Collections;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpHeaders;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@ExtendWith(MockitoExtension.class)
class ConsultingTypeServiceTest {

  @InjectMocks
  ConsultingTypeService consultingTypeService;

  @Mock
  ConsultingTypeControllerApi consultingTypeControllerApi;

  @Mock
  ApiClient apiClient;

  @Mock
  SecurityHeaderSupplier securityHeaderSupplier;

  @Mock
  HttpServletRequest httpServletRequest;

  Enumeration<String> headers;
  ServletRequestAttributes requestAttributes;

  @BeforeEach
  void setup() {
    RequestContextHolder.setRequestAttributes(null);
    requestAttributes = new ServletRequestAttributes(httpServletRequest);
    when(consultingTypeControllerApi.getApiClient()).thenReturn(apiClient);
    RequestContextHolder.setRequestAttributes(requestAttributes);
  }

  @Test
  void getExtendedConsultingTypeResponseDTO_Should_useServicesCorrectly() {
    when(this.securityHeaderSupplier.getCsrfHttpHeaders()).thenReturn(new HttpHeaders());
    headers = Collections.enumeration(Collections.emptyList());
    when(httpServletRequest.getHeaderNames()).thenReturn(headers);

    this.consultingTypeService.getExtendedConsultingTypeResponseDTO(0);

    verify(this.consultingTypeControllerApi).getExtendedConsultingTypeById(0);
  }

  @Test
  void getExtendedConsultingTypeResponseDTO_Should_addOriginHeader_When_originHeaderIsPresent() {
    headers = Collections.enumeration(Collections.singletonList("origin"));
    when(httpServletRequest.getHeaderNames()).thenReturn(headers);
    when(httpServletRequest.getHeader("origin")).thenReturn("valid origin");
    when(this.securityHeaderSupplier.getCsrfHttpHeaders()).thenReturn(new HttpHeaders());

    this.consultingTypeService.getExtendedConsultingTypeResponseDTO(0);

    verify(apiClient).addDefaultHeader("origin", "valid origin");
  }

  @Test
  void getExtendedConsultingTypeResponseDTO_Should_addHostHeader_When_originHeaderIsNotPresent() {
    headers = Collections.enumeration(Collections.singletonList("host"));
    when(httpServletRequest.getHeaderNames()).thenReturn(headers);
    when(httpServletRequest.getHeader("host")).thenReturn("valid host");
    when(this.securityHeaderSupplier.getCsrfHttpHeaders()).thenReturn(new HttpHeaders());

    this.consultingTypeService.getExtendedConsultingTypeResponseDTO(0);

    verify(apiClient).addDefaultHeader("origin", "valid host");
  }

}
