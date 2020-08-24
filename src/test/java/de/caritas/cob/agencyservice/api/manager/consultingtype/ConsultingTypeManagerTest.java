package de.caritas.cob.agencyservice.api.manager.consultingtype;

import static de.caritas.cob.agencyservice.testHelper.FieldConstants.FIELD_NAME_CONSULTING_TYPES_SETTINGS_JSON_PATH;
import static de.caritas.cob.agencyservice.testHelper.FieldConstants.FIELD_NAME_CONSULTING_TYPES_SETTINGS_JSON_PATH_VALUE;
import static de.caritas.cob.agencyservice.testHelper.FieldConstants.FIELD_NAME_CONSULTING_TYPE_SETTINGS_MAP;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_AIDS;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_CHILDREN;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_CURE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_DEBT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_DISABILITY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_EMIGRATION;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_HOSPICE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_KREUZBUND;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_LAW;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_MIGRATION;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_OFFENDER;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_PARENTING;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_PLANB;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_PREGNANCY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_REGIONAL;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_REHABILITATION;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SENIORITY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_MAP;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_MAP_WITH_MISSING_CONSULTING_TYPE_SETTINGS_FOR_U25;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_U25;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SOCIAL;
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
import de.caritas.cob.agencyservice.api.helper.WhiteSpotHelper;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.annotation.PostConstruct;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.internal.util.reflection.FieldSetter;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class ConsultingTypeManagerTest {

  @InjectMocks
  ConsultingTypeManager consultingTypeManager;
  @Mock
  WhiteSpotHelper whiteSpotProperties;

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

  @Test
  public void init_Should_InitializeConsultingTypeSettingFromJsonFile()
      throws NoSuchMethodException, SecurityException, IllegalAccessException,
      IllegalArgumentException, InvocationTargetException, NoSuchFieldException, IOException, MissingConsultingTypeException {

    FieldSetter.setField(consultingTypeManager,
        consultingTypeManager.getClass()
            .getDeclaredField(FIELD_NAME_CONSULTING_TYPES_SETTINGS_JSON_PATH),
        FIELD_NAME_CONSULTING_TYPES_SETTINGS_JSON_PATH_VALUE);

    Class<? extends ConsultingTypeManager> classToTest = consultingTypeManager.getClass();
    Method methodToTest = classToTest.getDeclaredMethod(INIT_GROUP_NAME);
    methodToTest.setAccessible(true);
    methodToTest.invoke(consultingTypeManager);

    /**
     * SUCHT
     */

    ConsultingTypeSettings consultantTypeSettingsSucht =
        loadConsultingTypeSettings(CONSULTING_TYPE_SUCHT);
    consultantTypeSettingsSucht.setConsultingType(CONSULTING_TYPE_SUCHT);

    ConsultingTypeSettings result =
        consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_SUCHT);
    assertEquals(consultantTypeSettingsSucht.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsSucht.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * U25
     */

    ConsultingTypeSettings consultantTypeSettingsU25 =
        loadConsultingTypeSettings(CONSULTING_TYPE_U25);
    consultantTypeSettingsU25.setConsultingType(CONSULTING_TYPE_U25);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_U25);
    assertEquals(consultantTypeSettingsU25.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsU25.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * PREGNANCY
     */

    ConsultingTypeSettings consultantTypeSettingsPregnancy =
        loadConsultingTypeSettings(CONSULTING_TYPE_PREGNANCY);
    consultantTypeSettingsPregnancy.setConsultingType(CONSULTING_TYPE_PREGNANCY);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_PREGNANCY);
    assertEquals(consultantTypeSettingsPregnancy.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsPregnancy.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * AIDS
     */

    ConsultingTypeSettings consultantTypeSettingsAids =
        loadConsultingTypeSettings(CONSULTING_TYPE_AIDS);
    consultantTypeSettingsAids.setConsultingType(CONSULTING_TYPE_AIDS);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_AIDS);
    assertEquals(consultantTypeSettingsAids.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsAids.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * CHILDREN
     */

    ConsultingTypeSettings consultantTypeSettingsChildren =
        loadConsultingTypeSettings(CONSULTING_TYPE_CHILDREN);
    consultantTypeSettingsChildren.setConsultingType(CONSULTING_TYPE_CHILDREN);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_CHILDREN);
    assertEquals(consultantTypeSettingsChildren.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsChildren.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * CURE
     */

    ConsultingTypeSettings consultantTypeSettingsCure =
        loadConsultingTypeSettings(CONSULTING_TYPE_CURE);
    consultantTypeSettingsCure.setConsultingType(CONSULTING_TYPE_CURE);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_CURE);
    assertEquals(consultantTypeSettingsCure.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsCure.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * DEBT
     */

    ConsultingTypeSettings consultantTypeSettingsDebt =
        loadConsultingTypeSettings(CONSULTING_TYPE_DEBT);
    consultantTypeSettingsDebt.setConsultingType(CONSULTING_TYPE_DEBT);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_DEBT);
    assertEquals(consultantTypeSettingsDebt.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsDebt.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * DISABILITY
     */

    ConsultingTypeSettings consultantTypeSettingsDisability =
        loadConsultingTypeSettings(CONSULTING_TYPE_DISABILITY);
    consultantTypeSettingsDisability.setConsultingType(CONSULTING_TYPE_DISABILITY);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_DISABILITY);
    assertEquals(consultantTypeSettingsDisability.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsDisability.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * LAW
     */

    ConsultingTypeSettings consultantTypeSettingsLaw =
        loadConsultingTypeSettings(CONSULTING_TYPE_LAW);
    consultantTypeSettingsLaw.setConsultingType(CONSULTING_TYPE_LAW);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_LAW);
    assertEquals(consultantTypeSettingsLaw.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsLaw.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * OFFENDER
     */

    ConsultingTypeSettings consultantTypeSettingsOffender =
        loadConsultingTypeSettings(CONSULTING_TYPE_OFFENDER);
    consultantTypeSettingsOffender.setConsultingType(CONSULTING_TYPE_OFFENDER);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_OFFENDER);
    assertEquals(consultantTypeSettingsOffender.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsOffender.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * PARENTING
     */

    ConsultingTypeSettings consultantTypeSettingsParenting =
        loadConsultingTypeSettings(CONSULTING_TYPE_PARENTING);
    consultantTypeSettingsParenting.setConsultingType(CONSULTING_TYPE_PARENTING);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_PARENTING);
    assertEquals(consultantTypeSettingsParenting.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsParenting.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * PLANB
     */

    ConsultingTypeSettings consultantTypeSettingsPlanB =
        loadConsultingTypeSettings(CONSULTING_TYPE_PLANB);
    consultantTypeSettingsPlanB.setConsultingType(CONSULTING_TYPE_PLANB);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_PLANB);
    assertEquals(consultantTypeSettingsPlanB.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsPlanB.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * REHABILITATION
     */

    ConsultingTypeSettings consultantTypeSettingsRehabilitation =
        loadConsultingTypeSettings(CONSULTING_TYPE_REHABILITATION);
    consultantTypeSettingsRehabilitation.setConsultingType(CONSULTING_TYPE_REHABILITATION);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_REHABILITATION);
    assertEquals(consultantTypeSettingsRehabilitation.getConsultingType(),
        result.getConsultingType());
    assertEquals(consultantTypeSettingsRehabilitation.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * SENIORITY
     */

    ConsultingTypeSettings consultantTypeSettingsSeniority =
        loadConsultingTypeSettings(CONSULTING_TYPE_SENIORITY);
    consultantTypeSettingsSeniority.setConsultingType(CONSULTING_TYPE_SENIORITY);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_SENIORITY);
    assertEquals(consultantTypeSettingsSeniority.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsSeniority.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * SOCIAL
     */

    ConsultingTypeSettings consultantTypeSettingsSocial =
        loadConsultingTypeSettings(CONSULTING_TYPE_SOCIAL);
    consultantTypeSettingsSocial.setConsultingType(CONSULTING_TYPE_SOCIAL);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_SOCIAL);
    assertEquals(consultantTypeSettingsSocial.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsSocial.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * KREUZBUND
     */

    ConsultingTypeSettings consultantTypeSettingsKreuzbund =
        loadConsultingTypeSettings(CONSULTING_TYPE_KREUZBUND);
    consultantTypeSettingsKreuzbund.setConsultingType(CONSULTING_TYPE_KREUZBUND);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_KREUZBUND);
    assertEquals(consultantTypeSettingsKreuzbund.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsKreuzbund.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * MIGRATION
     */

    ConsultingTypeSettings consultantTypeSettingsMigration =
        loadConsultingTypeSettings(CONSULTING_TYPE_MIGRATION);
    consultantTypeSettingsMigration.setConsultingType(CONSULTING_TYPE_MIGRATION);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_MIGRATION);
    assertEquals(consultantTypeSettingsMigration.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsMigration.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * EMIGRATION
     */

    ConsultingTypeSettings consultantTypeSettingsEmigration =
        loadConsultingTypeSettings(CONSULTING_TYPE_EMIGRATION);
    consultantTypeSettingsEmigration.setConsultingType(CONSULTING_TYPE_EMIGRATION);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_EMIGRATION);
    assertEquals(consultantTypeSettingsEmigration.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsEmigration.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * HOSPICE
     */

    ConsultingTypeSettings consultantTypeSettingsHospice =
        loadConsultingTypeSettings(CONSULTING_TYPE_HOSPICE);
    consultantTypeSettingsHospice.setConsultingType(CONSULTING_TYPE_HOSPICE);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_HOSPICE);
    assertEquals(consultantTypeSettingsHospice.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsHospice.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

    /**
     * REGIONAL
     */

    ConsultingTypeSettings consultantTypeSettingsRegional =
        loadConsultingTypeSettings(CONSULTING_TYPE_REGIONAL);
    consultantTypeSettingsRegional.setConsultingType(CONSULTING_TYPE_REGIONAL);

    result = consultingTypeManager.getConsultantTypeSettings(CONSULTING_TYPE_REGIONAL);
    assertEquals(consultantTypeSettingsRegional.getConsultingType(), result.getConsultingType());
    assertEquals(consultantTypeSettingsRegional.getWhiteSpot().isWhiteSpotAgencyAssigned(),
        result.getWhiteSpot().isWhiteSpotAgencyAssigned());

  }

  private ConsultingTypeSettings loadConsultingTypeSettings(ConsultingType consultingType)
      throws IOException {
    ObjectMapper mapper = new ObjectMapper();
    TypeReference<ConsultingTypeSettings> typeReference =
        new TypeReference<ConsultingTypeSettings>() {};
    InputStream inputStream = null;
    inputStream =
        TypeReference.class.getResourceAsStream(FIELD_NAME_CONSULTING_TYPES_SETTINGS_JSON_PATH_VALUE
            + "/" + consultingType.name().toLowerCase() + ".json");
    return mapper.readValue(inputStream, typeReference);
  }

}
