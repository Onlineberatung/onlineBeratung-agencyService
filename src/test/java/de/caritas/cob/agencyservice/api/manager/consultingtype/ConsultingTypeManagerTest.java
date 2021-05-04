package de.caritas.cob.agencyservice.api.manager.consultingtype;

import static de.caritas.cob.agencyservice.testHelper.FieldConstants.FIELD_NAME_CONSULTING_TYPES_SETTINGS_JSON_PATH_VALUE;
import static de.caritas.cob.agencyservice.testHelper.FieldConstants.FIELD_NAME_CONSULTING_TYPE_SETTINGS_MAP;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_MAP;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_MAP_WITH_MISSING_CONSULTING_TYPE_SETTINGS_FOR_U25;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_U25;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_U25;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INIT_GROUP_NAME;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import javax.annotation.PostConstruct;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.internal.util.reflection.FieldSetter;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.core.io.ClassPathResource;

@RunWith(MockitoJUnitRunner.class)
public class ConsultingTypeManagerTest {

  @InjectMocks
  ConsultingTypeManager consultingTypeManager;

  @Test
  public void test_Should_Fail_WhenMethodInitDoesNotHavePostConstructAnnotation()
      throws NoSuchMethodException, SecurityException {

    Class<? extends ConsultingTypeManager> classToTest = consultingTypeManager.getClass();

    Method methodToTest = classToTest.getDeclaredMethod(INIT_GROUP_NAME);
    methodToTest.setAccessible(true);
    PostConstruct annotation = methodToTest.getAnnotation(PostConstruct.class);

    assertNotNull(annotation);
  }

  @Test
  public void getConsultantTypeSettings_Should_ReturnConsultantTypeSettingsForConsultingType()
      throws NoSuchFieldException, SecurityException, MissingConsultingTypeException {

    FieldSetter.setField(consultingTypeManager,
        consultingTypeManager.getClass().getDeclaredField(FIELD_NAME_CONSULTING_TYPE_SETTINGS_MAP),
        CONSULTING_TYPE_SETTINGS_MAP);

    ConsultingTypeSettings result =
        consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_SUCHT);
    assertEquals(CONSULTING_TYPE_SETTINGS_SUCHT, result);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_U25);
    assertEquals(CONSULTING_TYPE_SETTINGS_U25, result);
  }

  @Test
  public void getConsultantTypeSettings_Should_ThrowMissingConsultingTypeException_WhenSettingsForGivenConsultingTypeAreMissing()
      throws NoSuchFieldException, SecurityException {

    FieldSetter.setField(consultingTypeManager,
        consultingTypeManager.getClass().getDeclaredField(FIELD_NAME_CONSULTING_TYPE_SETTINGS_MAP),
        CONSULTING_TYPE_SETTINGS_MAP_WITH_MISSING_CONSULTING_TYPE_SETTINGS_FOR_U25);

    try {
      consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_U25);
      fail("Expected exception: MissingConsultingTypeException");
    } catch (MissingConsultingTypeException missingConsultingTypeException) {
      assertTrue("Excepted MissingConsultingTypeException thrown", true);
    }

  }

  protected static ConsultingTypeSettings loadConsultingTypeSettings(int consultingTypeId)
      throws IOException {
    ObjectMapper mapper = new ObjectMapper();
    TypeReference<ConsultingTypeSettings> typeReference = new TypeReference<>() {};
    File dir = new ClassPathResource(FIELD_NAME_CONSULTING_TYPES_SETTINGS_JSON_PATH_VALUE).getFile();
    File[] directoryListing = dir.listFiles((FilenameFilter) new WildcardFileFilter("*.json"));
    if (directoryListing != null) {
      for (File settingsFile : directoryListing) {
        InputStream inputStream = new FileInputStream(settingsFile);
        ConsultingTypeSettings consultingTypeSettings = mapper
            .readValue(inputStream, typeReference);
        if (consultingTypeSettings.getConsultingTypeId() == consultingTypeId) {
          return consultingTypeSettings;
        }
      }
    }
    throw new InvalidConsultingTypeException();
  }

}
