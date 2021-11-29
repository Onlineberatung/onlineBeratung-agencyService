package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.Assert.assertEquals;

import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import java.util.Set;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;

public class AgencyPostcodeRangeResponseDTOBuilderTest {

  private AgencyPostcodeRange agencyPostCodeRange;

  @Before
  public void init() {
    EasyRandom easyRandom = new EasyRandom();
    this.agencyPostCodeRange = easyRandom.nextObject(AgencyPostcodeRange.class);
  }

  @Test
  public void build_Should_Return_ValidAgencyPostcodeRangeResponseDTO() {

    var result = AgencyPostcodeRangeResponseDTOBuilder
        .getInstance(Set.of(agencyPostCodeRange), agencyPostCodeRange.getAgency().getId())
        .build();

    assertEquals(
        this.agencyPostCodeRange.getPostcodeFrom() + "-" + this.agencyPostCodeRange.getPostcodeTo() + ";",
        result.getEmbedded().getPostcodeRanges());
    assertEquals(this.agencyPostCodeRange.getAgency().getId(), result.getEmbedded().getId());
  }

  @Test
  public void build_Should_Return_ValidHalLinks() {

    var result = AgencyPostcodeRangeResponseDTOBuilder
        .getInstance(Set.of(this.agencyPostCodeRange), this.agencyPostCodeRange.getAgency().getId())
        .build();
    var defaultLinks = result.getLinks();
    var generatedId = result.getEmbedded().getId();

    assertThat(defaultLinks.getSelf().getHref(),
        endsWith("/agencyadmin/postcoderanges/" + generatedId));
    assertEquals(defaultLinks.getSelf().getMethod().getValue(), MethodEnum.GET.getValue());
    assertThat(defaultLinks.getDelete(), notNullValue());
    assertThat(defaultLinks.getDelete().getHref(),
        endsWith("/agencyadmin/postcoderanges/" + generatedId));
    assertEquals(defaultLinks.getDelete().getMethod().getValue(), MethodEnum.DELETE.getValue());
    assertThat(defaultLinks.getUpdate(), notNullValue());
    assertThat(defaultLinks.getUpdate().getHref(),
        endsWith("/agencyadmin/postcoderanges/" + generatedId));
    assertEquals(defaultLinks.getUpdate().getMethod().getValue(), MethodEnum.PUT.getValue());
  }
}
