package de.caritas.cob.AgencyService.api.helper;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import de.caritas.cob.AgencyService.api.repository.agency.ConsultingType;

/**
 * White spot agency properties. Sets the value from application.properties to the corresponding
 * {@link ConsultingType} value
 *
 */

@Component
public class WhiteSpotHelper {

  @Value("${sucht.white.spot.agency.id}")
  private String SUCHT_WHITE_SPOT_AGENCY_ID;

  @Value("${u25.white.spot.agency.id}")
  private String U25_WHITE_SPOT_AGENCY_ID;

  @Value("${pregnancy.white.spot.agency.id}")
  private String PREGNANCY_WHITE_SPOT_AGENCY_ID;

  @Value("${parenting.white.spot.agency.id}")
  private String PARENTING_WHITE_SPOT_AGENCY_ID;

  @Value("${cure.white.spot.agency.id}")
  private String CURE_WHITE_SPOT_AGENCY_ID;

  @Value("${debt.white.spot.agency.id}")
  private String DEBT_WHITE_SPOT_AGENCY_ID;

  @Value("${social.white.spot.agency.id}")
  private String SOCIAL_WHITE_SPOT_AGENCY_ID;

  @Value("${seniority.white.spot.agency.id}")
  private String SENIORITY_WHITE_SPOT_AGENCY_ID;

  @Value("${disability.white.spot.agency.id}")
  private String DISABILITY_WHITE_SPOT_AGENCY_ID;

  @Value("${planb.white.spot.agency.id}")
  private String PLANB_WHITE_SPOT_AGENCY_ID;

  @Value("${law.white.spot.agency.id}")
  private String LAW_WHITE_SPOT_AGENCY_ID;

  @Value("${offender.white.spot.agency.id}")
  private String OFFENDER_WHITE_SPOT_AGENCY_ID;

  @Value("${aids.white.spot.agency.id}")
  private String AIDS_WHITE_SPOT_AGENCY_ID;

  @Value("${rehabilitation.white.spot.agency.id}")
  private String REHABILITATION_WHITE_SPOT_AGENCY_ID;

  @Value("${children.white.spot.agency.id}")
  private String CHILDREN_WHITE_SPOT_AGENCY_ID;

  @Value("${kreuzbund.white.spot.agency.id}")
  private String KREUZBUND_WHITE_SPOT_AGENCY_ID;

  @Value("${migration.white.spot.agency.id}")
  private String MIGRATION_WHITE_SPOT_AGENCY_ID;

  @Value("${emigration.white.spot.agency.id}")
  private String EMIGRATION_WHITE_SPOT_AGENCY_ID;

  @Value("${hospice.white.spot.agency.id}")
  private String HOSPICE_WHITE_SPOT_AGENCY_ID;

  @Value("${regional.white.spot.agency.id}")
  private String REGIONAL_WHITE_SPOT_AGENCY_ID;


  public Map<Integer, Long> getWhiteSpotAgenciesMap() {
    return new HashMap<Integer, Long>() {
      private static final long serialVersionUID = 3979251936090245077L;
      {
        put(ConsultingType.SUCHT.getValue(),
            !SUCHT_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(SUCHT_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.U25.getValue(),
            !U25_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(U25_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.PREGNANCY.getValue(),
            !PREGNANCY_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(PREGNANCY_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.PARENTING.getValue(),
            !PARENTING_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(PARENTING_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.CURE.getValue(),
            !CURE_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(CURE_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.DEBT.getValue(),
            !DEBT_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(DEBT_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.SOCIAL.getValue(),
            !SOCIAL_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(SOCIAL_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.SENIORITY.getValue(),
            !SENIORITY_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(SENIORITY_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.DISABILITY.getValue(),
            !DISABILITY_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(DISABILITY_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.PLANB.getValue(),
            !PLANB_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(PLANB_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.LAW.getValue(),
            !LAW_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(LAW_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.OFFENDER.getValue(),
            !OFFENDER_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(OFFENDER_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.AIDS.getValue(),
            !AIDS_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(AIDS_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.REHABILITATION.getValue(),
            !REHABILITATION_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(REHABILITATION_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.CHILDREN.getValue(),
            !CHILDREN_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(CHILDREN_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.KREUZBUND.getValue(),
            !KREUZBUND_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(KREUZBUND_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.MIGRATION.getValue(),
            !MIGRATION_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(MIGRATION_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.EMIGRATION.getValue(),
            !EMIGRATION_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(EMIGRATION_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.HOSPICE.getValue(),
            !HOSPICE_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(HOSPICE_WHITE_SPOT_AGENCY_ID)
                : null);
        put(ConsultingType.REGIONAL.getValue(),
            !REGIONAL_WHITE_SPOT_AGENCY_ID.equals(StringUtils.EMPTY)
                ? Long.parseLong(REGIONAL_WHITE_SPOT_AGENCY_ID)
                : null);
      }
    };
  }

}
