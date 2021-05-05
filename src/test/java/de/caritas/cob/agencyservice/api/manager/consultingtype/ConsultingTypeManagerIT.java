/*package de.caritas.cob.agencyservice.api.manager.consultingtype;


import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_MAP;
import static org.junit.Assert.assertEquals;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
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
  @MethodSource("generateConsultingTypeIds")
  void init_Should_InitializeConsultingTypeSettingFromJsonFile(int consultingTypeId)
      throws Exception {
    ConsultingTypeSettings consultingTypeSettings = loadConsultingTypeSettings(consultingTypeId);
    consultingTypeSettings.setConsultingTypeId(consultingTypeId);

    ConsultingTypeSettings result =
        consultingTypeManager.getConsultantTypeSettings(consultingTypeId);

    assertEquals(consultingTypeSettings.getConsultingTypeId(), result.getConsultingTypeId());
    assertEquals(consultingTypeSettings.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());
  }

  static Stream<Integer> generateConsultingTypeIds() {
    return CONSULTING_TYPE_SETTINGS_MAP.keySet().stream();
  }

}*/
