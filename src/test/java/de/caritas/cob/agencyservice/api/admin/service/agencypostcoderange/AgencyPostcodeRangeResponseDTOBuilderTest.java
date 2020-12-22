package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.Assert.assertEquals;

import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.model.DefaultLinks;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;

public class AgencyPostcodeRangeResponseDTOBuilderTest {

  private AgencyPostcodeRangeResponseDTOBuilder agencyPostcodeRangeResponseDTOBuilder;
  private AgencyPostCodeRange agencyPostCodeRange;

  @Before
  public void init() {
    EasyRandom easyRandom = new EasyRandom();
    this.agencyPostCodeRange = easyRandom.nextObject(AgencyPostCodeRange.class);
    this.agencyPostcodeRangeResponseDTOBuilder = new AgencyPostcodeRangeResponseDTOBuilder();
    this.agencyPostcodeRangeResponseDTOBuilder.withAgencyPostCodeRange(this.agencyPostCodeRange);
  }

  @Test
  public void build_Should_Return_ValidAgencyPostcodeRangeResponseDTO() {

    AgencyPostcodeRangeResponseDTO result = this.agencyPostcodeRangeResponseDTOBuilder.build();

    assertEquals(this.agencyPostCodeRange.getId(), result.getEmbedded().getId());
    assertEquals(this.agencyPostCodeRange.getPostCodeFrom(),
        result.getEmbedded().getPostcodeFrom());
    assertEquals(this.agencyPostCodeRange.getPostCodeTo(), result.getEmbedded().getPostcodeTo());
    assertEquals(this.agencyPostCodeRange.getCreateDate().toString(),
        result.getEmbedded().getCreateDate());
    assertEquals(this.agencyPostCodeRange.getUpdateDate().toString(),
        result.getEmbedded().getUpdateDate());
    assertEquals(this.agencyPostCodeRange.getAgency().getId(), result.getEmbedded().getAgencyId());
  }

  @Test
  public void build_Should_Return_ValidHalLinks() {

    AgencyPostcodeRangeResponseDTO result = this.agencyPostcodeRangeResponseDTOBuilder.build();
    DefaultLinks defaultLinks = result.getLinks();
    Long generatedId = result.getEmbedded().getId();

    assertThat(defaultLinks.getSelf().getHref(),
        endsWith("/agencyadmin/agency/" + this.agencyPostCodeRange.getAgency().getId()
            + "/postcoderange/" + generatedId));
    assertEquals(defaultLinks.getSelf().getMethod().getValue(), MethodEnum.GET.getValue());
    assertThat(defaultLinks.getDelete(), notNullValue());
    assertThat(defaultLinks.getDelete().getHref(),
        endsWith("/agencyadmin/agency/" + this.agencyPostCodeRange.getAgency().getId()
            + "/postcoderange/" + generatedId));
    assertEquals(defaultLinks.getDelete().getMethod().getValue(), MethodEnum.DELETE.getValue());
    assertThat(defaultLinks.getUpdate(), notNullValue());
    assertThat(defaultLinks.getUpdate().getHref(),
        endsWith("/agencyadmin/agency/" + this.agencyPostCodeRange.getAgency().getId()
            + "/postcoderange/" + generatedId));
    assertEquals(defaultLinks.getUpdate().getMethod().getValue(), MethodEnum.PUT.getValue());
  }
}
