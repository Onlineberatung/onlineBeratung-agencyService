package de.caritas.cob.agencyservice.api.manager.consultingtype;

import static de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManagerTest.loadConsultingTypeSettings;
import static org.junit.Assert.assertEquals;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
class ConsultingTypeManagerIT {

  @Autowired
  private ConsultingTypeManager consultingTypeManager;

  @ParameterizedTest
  @EnumSource(ConsultingType.class)
  void init_Should_InitializeConsultingTypeSettingFromJsonFile(ConsultingType consultingType)
      throws Exception {
    ConsultingTypeSettings consultingTypeSettings = loadConsultingTypeSettings(consultingType);
    consultingTypeSettings.setConsultingType(consultingType);

    ConsultingTypeSettings result =
        consultingTypeManager.getConsultantTypeSettings(consultingType);

    assertEquals(consultingTypeSettings.getConsultingType(), result.getConsultingType());
    assertEquals(consultingTypeSettings.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());
  }

}
