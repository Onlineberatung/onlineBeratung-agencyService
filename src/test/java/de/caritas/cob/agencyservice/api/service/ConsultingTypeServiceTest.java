package de.caritas.cob.agencyservice.api.service;

import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.ApiClient;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.ConsultingTypeControllerApi;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import org.junit.Test;
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
  private ConsultingTypeService consultingTypeService;

  @Mock
  private ConsultingTypeControllerApi consultingTypeControllerApi;

  @Mock
  private SecurityHeaderSupplier securityHeaderSupplier;

  @Mock
  private ServletRequestAttributes requestAttributes;

  @Mock
  private HttpServletRequest httpServletRequest;

  @Mock
  private Enumeration<String> headers;

  @Test
  void getExtendedConsultingTypeResponseDTO_Should_useServicesCorrectly() {
    givenRequestContextIsSet();
    when(this.consultingTypeControllerApi.getApiClient()).thenReturn(new ApiClient());
    when(this.securityHeaderSupplier.getCsrfHttpHeaders()).thenReturn(new HttpHeaders());

    this.consultingTypeService.getExtendedConsultingTypeResponseDTO(0);

    verify(this.consultingTypeControllerApi, times(1)).getExtendedConsultingTypeById(0);
    resetRequestAttributes();
  }

  private void resetRequestAttributes() {
    RequestContextHolder.setRequestAttributes(null);
  }

  private void givenRequestContextIsSet() {
    when(requestAttributes.getRequest()).thenReturn(httpServletRequest);
    when(httpServletRequest.getHeaderNames()).thenReturn(headers);
    RequestContextHolder.setRequestAttributes(requestAttributes);
  }


}
