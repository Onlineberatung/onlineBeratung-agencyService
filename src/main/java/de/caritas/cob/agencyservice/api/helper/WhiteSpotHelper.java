package de.caritas.cob.agencyservice.api.helper;

import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * White spot agency properties. Sets the value from application.properties to the corresponding
 * {@link ConsultingType} value
 *
 */
@Component
public class WhiteSpotHelper {

  @Value("${sucht.white.spot.agency.id}")
  private String suchtWhiteSpotAgencyId;

  @Value("${u25.white.spot.agency.id}")
  private String u25WhiteSpotAgencyId;

  @Value("${pregnancy.white.spot.agency.id}")
  private String pregnancyWhiteSpotAgencyId;

  @Value("${parenting.white.spot.agency.id}")
  private String parentingWhiteSpotAgencyId;

  @Value("${cure.white.spot.agency.id}")
  private String cureWhiteSpotAgencyId;

  @Value("${debt.white.spot.agency.id}")
  private String debtWhiteSpotAgencyId;

  @Value("${social.white.spot.agency.id}")
  private String socialWhiteSpotAgencyId;

  @Value("${seniority.white.spot.agency.id}")
  private String seniorityWhiteSpotAgencyId;

  @Value("${disability.white.spot.agency.id}")
  private String disabilityWhiteSpotAgencyId;

  @Value("${planb.white.spot.agency.id}")
  private String planbWhiteSpotAgencyId;

  @Value("${law.white.spot.agency.id}")
  private String lawWhiteSpotAgencyId;

  @Value("${offender.white.spot.agency.id}")
  private String offenderWhiteSpotAgencyId;

  @Value("${aids.white.spot.agency.id}")
  private String aidsWhiteSpotAgencyId;

  @Value("${rehabilitation.white.spot.agency.id}")
  private String rehabilitationWhiteSpotAgencyId;

  @Value("${children.white.spot.agency.id}")
  private String childrenWhiteSpotAgencyId;

  @Value("${kreuzbund.white.spot.agency.id}")
  private String kreuzbundWhiteSpotAgencyId;

  @Value("${migration.white.spot.agency.id}")
  private String migrationWhiteSpotAgencyId;

  @Value("${emigration.white.spot.agency.id}")
  private String emigrationWhiteSpotAgencyId;

  @Value("${hospice.white.spot.agency.id}")
  private String hospiceWhiteSpotAgencyId;

  @Value("${regional.white.spot.agency.id}")
  private String regionalWhiteSpotAgencyId;

  @Value("${men.white.spot.agency.id}")
  private String menWhiteSpotAgencyId;

  /**
   * Builds the mapping between consulting type and white spot agency id.
   *
   * @return the generated {@link Map}
   */
  public Map<Integer, Long> getWhiteSpotAgenciesMap() {
    return WhiteSpotMapBuilder.getInstance()
        .addMappingEntry(ConsultingType.SUCHT, this.suchtWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.U25, this.u25WhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.PREGNANCY, this.pregnancyWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.PARENTING, this.parentingWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.CURE, this.cureWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.DEBT, this.debtWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.SOCIAL, this.socialWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.SENIORITY, this.seniorityWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.DISABILITY, this.disabilityWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.PLANB, this.planbWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.LAW, this.lawWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.OFFENDER, this.offenderWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.AIDS, this.aidsWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.REHABILITATION, this.rehabilitationWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.CHILDREN, this.childrenWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.KREUZBUND, this.kreuzbundWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.MIGRATION, this.migrationWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.EMIGRATION, this.emigrationWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.HOSPICE, this.hospiceWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.REGIONAL, this.regionalWhiteSpotAgencyId)
        .addMappingEntry(ConsultingType.MEN, this.menWhiteSpotAgencyId)
        .getWhiteSpotMapping();
  }

}
