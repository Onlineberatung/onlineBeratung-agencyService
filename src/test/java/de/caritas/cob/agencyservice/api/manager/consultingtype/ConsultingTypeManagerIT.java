package de.caritas.cob.agencyservice.api.manager.consultingtype;


import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.service.ConsultingTypeService;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.client.RestClientException;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
public class ConsultingTypeManagerIT {

  @Autowired
  private ConsultingTypeManager consultingTypeManager;

  @MockBean
  private ConsultingTypeService consultingTypeService;

  @Test
  public void getConsultantTypeSettings_Should_Throw_MissingConsultingTypeException_When_RestClientException() {
    when(consultingTypeService.getExtendedConsultingTypeResponseDTO(anyInt()))
        .thenThrow(new RestClientException(""));

    assertThrows(MissingConsultingTypeException.class,
        () -> consultingTypeManager.getConsultingTypeSettings(anyInt()));
  }

  @Test
  public void getConsultantTypeSettings_Should_Return_ExtendedConsultingTypeResponseDTO()
      throws MissingConsultingTypeException {
    ExtendedConsultingTypeResponseDTO extendedConsultingTypeResponseDTO = new ExtendedConsultingTypeResponseDTO();
    when(consultingTypeService.getExtendedConsultingTypeResponseDTO(anyInt()))
        .thenReturn(extendedConsultingTypeResponseDTO);

    assertEquals(extendedConsultingTypeResponseDTO,
        consultingTypeManager.getConsultingTypeSettings(anyInt()));

  }

}
