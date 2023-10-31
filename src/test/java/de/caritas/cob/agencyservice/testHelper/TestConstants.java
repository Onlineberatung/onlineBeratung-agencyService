package de.caritas.cob.agencyservice.testHelper;

import de.caritas.cob.agencyservice.api.manager.consultingtype.registration.Registration;
import de.caritas.cob.agencyservice.api.manager.consultingtype.whiteSpot.WhiteSpot;
import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.model.FullAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestConstants {

  /**
   * ConsultingType
   */

  public static final String INIT_GROUP_NAME = "init";
  public static final Integer INVALID_CONSULTING_TYPE_VALUE = -1;
  public static final int CONSULTING_TYPE_SUCHT = 0;
  public static final int CONSULTING_TYPE_U25 = 1;
  public static final int CONSULTING_TYPE_PREGNANCY = 2;
  public static final int CONSULTING_TYPE_AIDS = 12;
  public static final int CONSULTING_TYPE_CHILDREN = 14;
  public static final int CONSULTING_TYPE_CURE = 4;
  public static final int CONSULTING_TYPE_DEBT = 5;
  public static final int CONSULTING_TYPE_DISABILITY = 8;
  public static final int CONSULTING_TYPE_LAW = 10;
  public static final int CONSULTING_TYPE_OFFENDER = 11;
  public static final int CONSULTING_TYPE_PARENTING = 3;
  public static final int CONSULTING_TYPE_PLANB = 9;
  public static final int CONSULTING_TYPE_REHABILITATION = 13;
  public static final int CONSULTING_TYPE_SENIORITY = 7;
  public static final int CONSULTING_TYPE_SOCIAL = 6;
  public static final int CONSULTING_TYPE_KREUZBUND = 15;
  public static final int CONSULTING_TYPE_MIGRATION = 16;
  public static final int CONSULTING_TYPE_EMIGRATION = 17;
  public static final int CONSULTING_TYPE_HOSPICE = 18;
  public static final int CONSULTING_TYPE_REGIONAL = 19;
  public static final Long WHITESPOT_AGENCY_ID = 100L;
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_AIDS =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_AIDS, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_CHILDREN =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_CHILDREN, new WhiteSpot(false, null),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_CURE =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_CURE, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_DEBT =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_DEBT, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_DISABILITY =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_DISABILITY, new WhiteSpot(false, null),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_LAW =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_LAW, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_OFFENDER =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_OFFENDER, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_PARENTING =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_PARENTING, new WhiteSpot(false, null),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_PLANB =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_PLANB, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_PREGNANCY =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_PREGNANCY,
          new WhiteSpot(true, WHITESPOT_AGENCY_ID), new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_REHABILITATION =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_REHABILITATION,
          new WhiteSpot(true, WHITESPOT_AGENCY_ID), new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_SENIORITY =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_SENIORITY,
          new WhiteSpot(true, WHITESPOT_AGENCY_ID), new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_SOCIAL =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_SOCIAL, new WhiteSpot(false, null),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_SUCHT =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_SUCHT, new WhiteSpot(true, WHITESPOT_AGENCY_ID),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_U25 =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_U25, new WhiteSpot(false, null),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_KREUZBUND =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_KREUZBUND, new WhiteSpot(false, null),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_MIGRATION =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_MIGRATION, new WhiteSpot(false, null),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_EMIGRATION =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_EMIGRATION,
          new WhiteSpot(true, WHITESPOT_AGENCY_ID), new Registration(5));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_HOSPICE =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_HOSPICE, new WhiteSpot(false, null),
          new Registration(3));
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_REGIONAL =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_REGIONAL, new WhiteSpot(false, null),
          new Registration(3));
  public static final Map<Integer, ExtendedConsultingTypeResponseDTO> CONSULTING_TYPE_SETTINGS_MAP =
      new HashMap<>() {
        private static final long serialVersionUID = 1L;
        {
          put(CONSULTING_TYPE_SUCHT, CONSULTING_TYPE_SETTINGS_SUCHT);
          put(CONSULTING_TYPE_U25, CONSULTING_TYPE_SETTINGS_U25);
          put(CONSULTING_TYPE_PREGNANCY, CONSULTING_TYPE_SETTINGS_PREGNANCY);
          put(CONSULTING_TYPE_AIDS, CONSULTING_TYPE_SETTINGS_AIDS);
          put(CONSULTING_TYPE_CHILDREN, CONSULTING_TYPE_SETTINGS_CHILDREN);
          put(CONSULTING_TYPE_CURE, CONSULTING_TYPE_SETTINGS_CURE);
          put(CONSULTING_TYPE_DEBT, CONSULTING_TYPE_SETTINGS_DEBT);
          put(CONSULTING_TYPE_DISABILITY, CONSULTING_TYPE_SETTINGS_DISABILITY);
          put(CONSULTING_TYPE_LAW, CONSULTING_TYPE_SETTINGS_LAW);
          put(CONSULTING_TYPE_OFFENDER, CONSULTING_TYPE_SETTINGS_OFFENDER);
          put(CONSULTING_TYPE_PARENTING, CONSULTING_TYPE_SETTINGS_PARENTING);
          put(CONSULTING_TYPE_PLANB, CONSULTING_TYPE_SETTINGS_PLANB);
          put(CONSULTING_TYPE_REHABILITATION, CONSULTING_TYPE_SETTINGS_REHABILITATION);
          put(CONSULTING_TYPE_SENIORITY, CONSULTING_TYPE_SETTINGS_SENIORITY);
          put(CONSULTING_TYPE_SOCIAL, CONSULTING_TYPE_SETTINGS_SOCIAL);
          put(CONSULTING_TYPE_KREUZBUND, CONSULTING_TYPE_SETTINGS_KREUZBUND);
          put(CONSULTING_TYPE_MIGRATION, CONSULTING_TYPE_SETTINGS_MIGRATION);
          put(CONSULTING_TYPE_EMIGRATION, CONSULTING_TYPE_SETTINGS_EMIGRATION);
          put(CONSULTING_TYPE_HOSPICE, CONSULTING_TYPE_SETTINGS_HOSPICE);
          put(CONSULTING_TYPE_REGIONAL, CONSULTING_TYPE_SETTINGS_REGIONAL);
        }
      };
  public static final Map<Integer, ExtendedConsultingTypeResponseDTO> CONSULTING_TYPE_SETTINGS_MAP_WITH_MISSING_CONSULTING_TYPE_SETTINGS_FOR_U25 =
      new HashMap<>() {
        private static final long serialVersionUID = 1L;

        {
          put(CONSULTING_TYPE_SUCHT, CONSULTING_TYPE_SETTINGS_SUCHT);
        }
      };

  public static final String POSTCODE = "postcode";
  public static final String INVALID_POSTCODE = "inv";
  public static final String FIELD_AGENCY_ID = "id";
  public static final String VALID_POSTCODE = "12345";
  public static final String VALID_POSTCODE_2 = "23456";
  public static final String VALID_POSTCODE_3 = "33333";
  public static final String VALID_POSTCODE_4 = "44444";
  public static final String VALID_POSTCODE_5 = "55555";
  public static final String VALID_POSTCODE_6 = "33445";
  public static final String AGENCY_CITY = "Test city";
  public static final String VALID_POSTCODE_QUERY = "postcode=88488";
  public static final int VALID_POSTCODE_LENGTH = 5;
  public static final Long AGENCY_ID = 98L;
  public static final String AGENCY_NAME = "Test agency";
  public static final String AGENCY_DESCRIPTION = "Test description";
  public static final Agency AGENCY_SUCHT = Agency.builder()
      .id(AGENCY_ID)
      .name(AGENCY_NAME)
      .description(AGENCY_DESCRIPTION)
      .postCode(POSTCODE)
      .city("Test city")
      .teamAgency(false)
      .consultingTypeId(CONSULTING_TYPE_SUCHT)
      .offline(false)
      .isExternal(false)
      .build();

  public static final Agency AGENCY_KREUZBUND = new Agency(AGENCY_ID, AGENCY_NAME,
      AGENCY_DESCRIPTION,
      POSTCODE, "Test city", false, CONSULTING_TYPE_KREUZBUND, false, null, false, null, null, null,
      null, null, null, null, null, null, null, null, null, null, null);
  public static final Agency AGENCY_ONLINE_U25 =
      new Agency(AGENCY_ID, AGENCY_NAME, AGENCY_DESCRIPTION, POSTCODE, "Test city",
          false, CONSULTING_TYPE_U25, false, null, false, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
  public static final Agency AGENCY_OFFLINE = new Agency(AGENCY_ID, AGENCY_NAME,
      AGENCY_DESCRIPTION,
      POSTCODE, "Test city", false, CONSULTING_TYPE_SUCHT, true, null, false, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
  public static final AgencyResponseDTO AGENCY_RESPONSE_DTO =
      new AgencyResponseDTO().id(AGENCY_ID).name(AGENCY_NAME).postcode(POSTCODE)
          .city(AGENCY_CITY).description(AGENCY_DESCRIPTION).teamAgency(false).offline(false)
          .consultingType(CONSULTING_TYPE_SUCHT);
  public static final List<AgencyResponseDTO> AGENCY_RESPONSE_DTO_LIST = Collections.singletonList(
      AGENCY_RESPONSE_DTO);
  public static final FullAgencyResponseDTO FULL_AGENCY_RESPONSE_DTO =
      new FullAgencyResponseDTO().id(AGENCY_ID).name(AGENCY_NAME).postcode(POSTCODE)
          .city(AGENCY_CITY).description(AGENCY_DESCRIPTION).teamAgency(false).offline(false)
          .consultingType(CONSULTING_TYPE_SUCHT).url(null).external(false);
  public static final List<FullAgencyResponseDTO> FULL_AGENCY_RESPONSE_DTO_LIST = Collections.singletonList(
      FULL_AGENCY_RESPONSE_DTO);
  public static final int MIN_POSTCODE_SIZE_3 = 3;
  public static final WhiteSpot WHITESPOT_AGENCIES_SUCHT = new WhiteSpot(true, WHITESPOT_AGENCY_ID);
  public static final WhiteSpot WHITESPOT_AGENCIES_U25 = new WhiteSpot(false, WHITESPOT_AGENCY_ID);
  public static final Registration REGISTRATION_SUCHT = new Registration(MIN_POSTCODE_SIZE_3);
  public static final Registration REGISTRATION_U25 = new Registration(MIN_POSTCODE_SIZE_3);
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_SUCHT, WHITESPOT_AGENCIES_SUCHT,
          REGISTRATION_SUCHT);
  public static final ExtendedConsultingTypeResponseDTO CONSULTING_TYPE_SETTINGS_WITHOUT_WHITESPOT_AGENCY =
      ExtendedConsultingTypeResponseDTOHelper.createExtendedConsultingTypeResponseDTO(CONSULTING_TYPE_U25, WHITESPOT_AGENCIES_U25, REGISTRATION_U25);

  public static final List<Agency> EMPTY_AGENCY_LIST = new ArrayList<>();
  public static final List<Agency> AGENCY_LIST = Collections.singletonList(AGENCY_SUCHT);
  public static final List<Long> AGENCY_IDS_LIST = Collections.singletonList(AGENCY_ID);

  public static final String VALID_CONSULTING_TYPE_QUERY = "consultingType=0";
  public static final String INVALID_POSTCODE_QUERY = "postcode=12";
  public static final String VALID_AGE_QUERY = "age=30";
  public static final String VALID_GENDER_QUERY = "gender=FEMALE";
  public static final String INVALID_CONSULTING_TYPE_QUERY = "consultingType=xyz";
  public static final String INVALID_AGENCY_ID = "12xX";

  public static final String VALID_AGENCY_DTO = "{\n"
      + "  \"city\": \"City\",\n"
      + "  \"consultingType\": " + CONSULTING_TYPE_AIDS + ",\n"
      + "  \"description\": \"Description\",\n"
      + "  \"name\": \"Agency\",\n"
      + "  \"postcode\": \"76000\",\n"
      + "  \"teamAgency\": false,\n"
      + "  \"url\": \"https://www.domain.com\",\n"
      + "  \"external\": true\n"
      + "}";

  public static final String VALID_AGENCY_UPDATE_DTO = "{\n"
      + "  \"city\": \"City\",\n"
      + "  \"description\": \"Description\",\n"
      + "  \"name\": \"Agency\",\n"
      + "  \"postcode\": \"76000\",\n"
      + "  \"offline\": true,\n"
      + "  \"external\": false\n"
      + "}";

  public static final String VALID_POSTCODE_RANGE_DTO = "{\n"
      + "  \"postcodeFrom\": \"51107\",\n"
      + "  \"postcodeTo\": \"51109\"\n"
      + "}";

}
