package de.caritas.cob.agencyservice.api.helper;

import static org.apache.commons.lang3.StringUtils.isNotBlank;

import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import java.util.HashMap;
import java.util.Map;

/**
 * Builder class for mapping of consulting type and white spot agency id.
 */
public class WhiteSpotMapBuilder {

  private final Map<Integer, Long> whiteSpotMapping;

  private WhiteSpotMapBuilder() {
    this.whiteSpotMapping = new HashMap<>();
  }

  /**
   * Creates the {@link WhiteSpotMapBuilder} instance.
   *
   * @return the {@link WhiteSpotMapBuilder} instance
   */
  public static WhiteSpotMapBuilder getInstance() {
    return new WhiteSpotMapBuilder();
  }

  /**
   * Checks the agency id and puts the mapping entry into curretn map.
   *
   * @param consultingType the consulting type used for the key of the map
   * @param whiteSpotAgencyId the agency id of the regaring white spot agency
   * @return the current {@link WhiteSpotMapBuilder}
   */
  public WhiteSpotMapBuilder addMappingEntry(ConsultingType consultingType,
      String whiteSpotAgencyId) {
    Long whiteSpotAgencyValue = isNotBlank(whiteSpotAgencyId) ?
        Long.parseLong(whiteSpotAgencyId) : null;
    this.whiteSpotMapping.put(consultingType.getValue(), whiteSpotAgencyValue);
    return this;
  }

  /**
   * Retrieves the builded map.
   *
   * @return the generated {@link Map}
   */
  public Map<Integer, Long> getWhiteSpotMapping() {
    return this.whiteSpotMapping;
  }

}
