package de.caritas.cob.agencyservice.api.manager.consultingtype;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SUCHT;
import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.service.ConsultingTypeService;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.web.client.RestClientException;

@RunWith(MockitoJUnitRunner.class)
public class ConsultingTypeManagerTest {

  @InjectMocks
  ConsultingTypeManager consultingTypeManager;

  @Mock
  private ConsultingTypeService consultingTypeService;

  @Test
  public void getConsultantTypeSettings_Should_ReturnConsultantTypeSettingsForConsultingType()
      throws MissingConsultingTypeException {
    when(this.consultingTypeService.getExtendedConsultingTypeResponseDTO(anyInt()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_SUCHT);

    ExtendedConsultingTypeResponseDTO result =
        consultingTypeManager.getConsultingTypeSettings(CONSULTING_TYPE_SUCHT);

    assertEquals(CONSULTING_TYPE_SETTINGS_SUCHT, result);
  }

  @Test
  public void getConsultantTypeSettings_Should_thrownMissingConsultingTypeException_When_consultingTypeForIdDoesNotExist() {
    when(this.consultingTypeService.getExtendedConsultingTypeResponseDTO(anyInt()))
        .thenThrow(new RestClientException(""));

    assertThrows(MissingConsultingTypeException.class,
        () -> consultingTypeManager.getConsultingTypeSettings(CONSULTING_TYPE_SUCHT));

  }
}
