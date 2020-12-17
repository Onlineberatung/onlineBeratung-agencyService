package de.caritas.cob.agencyservice.api.helper;

import static de.caritas.cob.agencyservice.api.repository.agency.ConsultingType.SUCHT;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.anEmptyMap;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.nullValue;

import java.util.Map;
import org.junit.Test;

public class WhiteSpotMapBuilderTest {

  @Test
  public void getWhiteSpotMapping_Should_returnEmptyMap_When_noEntryIsAdded() {
    Map<Integer, Long> whiteSpotMapping = WhiteSpotMapBuilder.getInstance()
        .getWhiteSpotMapping();

    assertThat(whiteSpotMapping, is(anEmptyMap()));
  }

  @Test
  public void getWhiteSpotMapping_Should_returnMapContainingNullValue_When_addedEntryIsEmptyString() {
    Map<Integer, Long> whiteSpotMapping = WhiteSpotMapBuilder.getInstance()
        .addMappingEntry(SUCHT, "")
        .getWhiteSpotMapping();

    assertThat(whiteSpotMapping.get(SUCHT.getValue()), nullValue());
  }

  @Test
  public void getWhiteSpotMapping_Should_returnMapContainingExpectedValue_When_addedEntryIsNumberString() {
    Map<Integer, Long> whiteSpotMapping = WhiteSpotMapBuilder.getInstance()
        .addMappingEntry(SUCHT, "1")
        .getWhiteSpotMapping();

    assertThat(whiteSpotMapping.get(SUCHT.getValue()), is(1L));
  }

}
