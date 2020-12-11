package de.caritas.cob.agencyservice.testHelper;

import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeSettings;
import de.caritas.cob.agencyservice.api.manager.consultingtype.registration.Registration;
import de.caritas.cob.agencyservice.api.manager.consultingtype.whiteSpot.WhiteSpot;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;

public class TestConstants {

  /**
   * ConsultingType
   */

  public static final String INIT_GROUP_NAME = "init";
  public static final Integer INVALID_CONSULTING_TYPE_VALUE = -1;
  public static final ConsultingType CONSULTING_TYPE_SUCHT = ConsultingType.SUCHT;
  public static final ConsultingType CONSULTING_TYPE_U25 = ConsultingType.U25;
  public static final ConsultingType CONSULTING_TYPE_PREGNANCY = ConsultingType.PREGNANCY;
  public static final ConsultingType CONSULTING_TYPE_AIDS = ConsultingType.AIDS;
  public static final ConsultingType CONSULTING_TYPE_CHILDREN = ConsultingType.CHILDREN;
  public static final ConsultingType CONSULTING_TYPE_CURE = ConsultingType.CURE;
  public static final ConsultingType CONSULTING_TYPE_DEBT = ConsultingType.DEBT;
  public static final ConsultingType CONSULTING_TYPE_DISABILITY = ConsultingType.DISABILITY;
  public static final ConsultingType CONSULTING_TYPE_LAW = ConsultingType.LAW;
  public static final ConsultingType CONSULTING_TYPE_OFFENDER = ConsultingType.OFFENDER;
  public static final ConsultingType CONSULTING_TYPE_PARENTING = ConsultingType.PARENTING;
  public static final ConsultingType CONSULTING_TYPE_PLANB = ConsultingType.PLANB;
  public static final ConsultingType CONSULTING_TYPE_REHABILITATION = ConsultingType.REHABILITATION;
  public static final ConsultingType CONSULTING_TYPE_SENIORITY = ConsultingType.SENIORITY;
  public static final ConsultingType CONSULTING_TYPE_SOCIAL = ConsultingType.SOCIAL;
  public static final ConsultingType CONSULTING_TYPE_KREUZBUND = ConsultingType.KREUZBUND;
  public static final ConsultingType CONSULTING_TYPE_MIGRATION = ConsultingType.MIGRATION;
  public static final ConsultingType CONSULTING_TYPE_EMIGRATION = ConsultingType.EMIGRATION;
  public static final ConsultingType CONSULTING_TYPE_HOSPICE = ConsultingType.HOSPICE;
  public static final ConsultingType CONSULTING_TYPE_REGIONAL = ConsultingType.REGIONAL;
  public static final Long WHITESPOT_AGENCY_ID = 100L;
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_AIDS =
      new ConsultingTypeSettings(CONSULTING_TYPE_AIDS, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_CHILDREN =
      new ConsultingTypeSettings(CONSULTING_TYPE_CHILDREN, new WhiteSpot(false, null),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_CURE =
      new ConsultingTypeSettings(CONSULTING_TYPE_CURE, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_DEBT =
      new ConsultingTypeSettings(CONSULTING_TYPE_DEBT, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_DISABILITY =
      new ConsultingTypeSettings(CONSULTING_TYPE_DISABILITY, new WhiteSpot(false, null),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_LAW =
      new ConsultingTypeSettings(CONSULTING_TYPE_LAW, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_OFFENDER =
      new ConsultingTypeSettings(CONSULTING_TYPE_OFFENDER, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_PARENTING =
      new ConsultingTypeSettings(CONSULTING_TYPE_PARENTING, new WhiteSpot(false, null),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_PLANB =
      new ConsultingTypeSettings(CONSULTING_TYPE_PLANB, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_PREGNANCY =
      new ConsultingTypeSettings(CONSULTING_TYPE_PREGNANCY,
          new WhiteSpot(true, WHITESPOT_AGENCY_ID), new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_REHABILITATION =
      new ConsultingTypeSettings(CONSULTING_TYPE_REHABILITATION,
          new WhiteSpot(true, WHITESPOT_AGENCY_ID), new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_SENIORITY =
      new ConsultingTypeSettings(CONSULTING_TYPE_SENIORITY,
          new WhiteSpot(true, WHITESPOT_AGENCY_ID), new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_SOCIAL =
      new ConsultingTypeSettings(CONSULTING_TYPE_SOCIAL, new WhiteSpot(false, null),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_SUCHT =
      new ConsultingTypeSettings(CONSULTING_TYPE_SUCHT, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_U25 =
      new ConsultingTypeSettings(CONSULTING_TYPE_U25, new WhiteSpot(false, null),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_KREUZBUND =
      new ConsultingTypeSettings(CONSULTING_TYPE_KREUZBUND, new WhiteSpot(false, null),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_MIGRATION =
      new ConsultingTypeSettings(CONSULTING_TYPE_MIGRATION, new WhiteSpot(false, null),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_EMIGRATION =
      new ConsultingTypeSettings(CONSULTING_TYPE_EMIGRATION,
          new WhiteSpot(true, WHITESPOT_AGENCY_ID), new Registration(5));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_HOSPICE =
      new ConsultingTypeSettings(CONSULTING_TYPE_HOSPICE, new WhiteSpot(false, null),
          new Registration(3));
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_REGIONAL =
      new ConsultingTypeSettings(CONSULTING_TYPE_REGIONAL, new WhiteSpot(false, null),
          new Registration(3));
  public static final Map<Integer, ConsultingTypeSettings> CONSULTING_TYPE_SETTINGS_MAP =
      new HashMap<Integer, ConsultingTypeSettings>() {
        private static final long serialVersionUID = 1L;
        {
          put(CONSULTING_TYPE_SUCHT.getValue(), CONSULTING_TYPE_SETTINGS_SUCHT);
          put(CONSULTING_TYPE_U25.getValue(), CONSULTING_TYPE_SETTINGS_U25);
          put(CONSULTING_TYPE_PREGNANCY.getValue(), CONSULTING_TYPE_SETTINGS_PREGNANCY);
          put(CONSULTING_TYPE_AIDS.getValue(), CONSULTING_TYPE_SETTINGS_AIDS);
          put(CONSULTING_TYPE_CHILDREN.getValue(), CONSULTING_TYPE_SETTINGS_CHILDREN);
          put(CONSULTING_TYPE_CURE.getValue(), CONSULTING_TYPE_SETTINGS_CURE);
          put(CONSULTING_TYPE_DEBT.getValue(), CONSULTING_TYPE_SETTINGS_DEBT);
          put(CONSULTING_TYPE_DISABILITY.getValue(), CONSULTING_TYPE_SETTINGS_DISABILITY);
          put(CONSULTING_TYPE_LAW.getValue(), CONSULTING_TYPE_SETTINGS_LAW);
          put(CONSULTING_TYPE_OFFENDER.getValue(), CONSULTING_TYPE_SETTINGS_OFFENDER);
          put(CONSULTING_TYPE_PARENTING.getValue(), CONSULTING_TYPE_SETTINGS_PARENTING);
          put(CONSULTING_TYPE_PLANB.getValue(), CONSULTING_TYPE_SETTINGS_PLANB);
          put(CONSULTING_TYPE_REHABILITATION.getValue(), CONSULTING_TYPE_SETTINGS_REHABILITATION);
          put(CONSULTING_TYPE_SENIORITY.getValue(), CONSULTING_TYPE_SETTINGS_SENIORITY);
          put(CONSULTING_TYPE_SOCIAL.getValue(), CONSULTING_TYPE_SETTINGS_SOCIAL);
          put(CONSULTING_TYPE_KREUZBUND.getValue(), CONSULTING_TYPE_SETTINGS_KREUZBUND);
          put(CONSULTING_TYPE_MIGRATION.getValue(), CONSULTING_TYPE_SETTINGS_MIGRATION);
          put(CONSULTING_TYPE_EMIGRATION.getValue(), CONSULTING_TYPE_SETTINGS_EMIGRATION);
          put(CONSULTING_TYPE_HOSPICE.getValue(), CONSULTING_TYPE_SETTINGS_HOSPICE);
          put(CONSULTING_TYPE_REGIONAL.getValue(), CONSULTING_TYPE_SETTINGS_REGIONAL);
        }
      };
  public static final Map<Integer, ConsultingTypeSettings> CONSULTING_TYPE_SETTINGS_MAP_WITH_MISSING_CONSULTING_TYPE_SETTINGS_FOR_U25 =
      new HashMap<Integer, ConsultingTypeSettings>() {
        private static final long serialVersionUID = 1L;
        {
          put(CONSULTING_TYPE_SUCHT.getValue(), CONSULTING_TYPE_SETTINGS_SUCHT);
        }
      };

  public static final String POSTCODE = "postcode";
  public static final String FIELD_AGENCY_ID = "id";
  public static final String VALID_POSTCODE = "12345";
  public static final String AGENCY_CITY = "Test city";
  public static final String VALID_POSTCODE_QUERY = "postcode=88488";
  public static final int VALID_POSTCODE_LENGTH = 5;
  public static final Long AGENCY_ID = 98L;
  public static final String AGENCY_NAME = "Test agency";
  public static final String AGENCY_DESCRIPTION = "Test description";
  public static final Agency AGENCY_SUCHT = new Agency(AGENCY_ID, 10L, AGENCY_NAME, AGENCY_DESCRIPTION,
      POSTCODE, "Test city", false, CONSULTING_TYPE_SUCHT, false, null, null, null,
      null);
  public static final Agency AGENCY_ONLINE_U25 =
      new Agency(AGENCY_ID, 10L, AGENCY_NAME, AGENCY_DESCRIPTION, POSTCODE, "Test city",
          false, CONSULTING_TYPE_U25, false, null, null, null, null);
  public static final Agency AGENCY_OFFLINE = new Agency(AGENCY_ID, 10L, AGENCY_NAME, AGENCY_DESCRIPTION,
      POSTCODE, "Test city", false, CONSULTING_TYPE_SUCHT, true, null, null, null, null);
  public static final Agency TEAM_AGENCY = new Agency(AGENCY_ID, 10L, AGENCY_NAME, AGENCY_DESCRIPTION,
      POSTCODE, "Test city", true, CONSULTING_TYPE_SUCHT, false, null, null, null, null);
  public static final AgencyResponseDTO AGENCY_RESPONSE_DTO =
      new AgencyResponseDTO().id(AGENCY_ID).name(AGENCY_NAME).postcode(POSTCODE)
      .city(AGENCY_CITY).description(AGENCY_DESCRIPTION).teamAgency(false).offline(false)
          .consultingType(CONSULTING_TYPE_SUCHT.getValue());
  public static final List<AgencyResponseDTO> AGENCY_RESPONSE_DTO_LIST = Collections.singletonList(AGENCY_RESPONSE_DTO);
  public static final int MIN_POSTCODE_SIZE_3 = 3;
  public static final int MIN_POSTCODE_SIZE_5 = 5;
  public static final WhiteSpot WHITESPOT_AGENCIES_SUCHT = new WhiteSpot(true, WHITESPOT_AGENCY_ID);
  public static final WhiteSpot WHITESPOT_AGENCIES_U25 = new WhiteSpot(false, WHITESPOT_AGENCY_ID);
  public static final Registration REGISTRATION_SUCHT = new Registration(MIN_POSTCODE_SIZE_3);
  public static final Registration REGISTRATION_U25 = new Registration(MIN_POSTCODE_SIZE_3);
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY =
      new ConsultingTypeSettings(CONSULTING_TYPE_SUCHT, WHITESPOT_AGENCIES_SUCHT,
          REGISTRATION_SUCHT);
  public static final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_WITHOUT_WHITESPOT_AGENCY =
      new ConsultingTypeSettings(CONSULTING_TYPE_U25, WHITESPOT_AGENCIES_U25, REGISTRATION_U25);

  public static final List<Agency> EMPTY_AGENCY_LIST = new ArrayList<>();
  public static final List<Agency> AGENCY_LIST = Collections.singletonList(AGENCY_SUCHT);
  public static final List<Long> AGENCY_IDS_LIST = Collections.singletonList(AGENCY_ID);

  public static final String VALID_CONSULTING_TYPE_QUERY = "consultingType=0";
  public static final String INVALID_POSTCODE_QUERY = "postcode=12";
  public static final String INVALID_CONSULTING_TYPE_QUERY = "consultingType=99999";
  public static final String INVALID_AGENCY_ID = "12xX";

  public static final Long INVALID_DIOCESE_ID = -1L;

  public static final String VALID_AGENCY_DTO = "{\n"
      + "  \"city\": \"City\",\n"
      + "  \"consultingType\": " + CONSULTING_TYPE_AIDS.getValue() + ",\n"
      + "  \"description\": \"Description\",\n"
      + "  \"dioceseId\": 1,\n"
      + "  \"name\": \"Agency\",\n"
      + "  \"postcode\": \"76000\",\n"
      + "  \"teamAgency\": false\n"
      + "}";

}
