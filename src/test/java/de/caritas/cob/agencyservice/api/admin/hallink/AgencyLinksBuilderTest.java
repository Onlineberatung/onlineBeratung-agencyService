package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.api.model.AgencyLinks;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import org.jeasy.random.EasyRandom;
import org.junit.Test;

public class AgencyLinksBuilderTest {

  @Test
  public void buildAgencyLinks_Should_returnAgencyLinks_When_AgencyIsSet() {

    EasyRandom easyRandom = new EasyRandom();
    Agency agency = easyRandom.nextObject(Agency.class);

    AgencyLinks agencyLinks = AgencyLinksBuilder.getInstance(agency)
        .buildAgencyLinks();

    assertThat(agencyLinks, notNullValue());
    assertThat(agencyLinks.getSelf(), notNullValue());
    assertThat(agencyLinks.getSelf().getMethod(), is(MethodEnum.GET));
    assertThat(agencyLinks.getSelf().getHref(),
        is(String.format("/agencyadmin/agencies/%s", agency.getId())));
    assertThat(agencyLinks.getDelete(), notNullValue());
    assertThat(agencyLinks.getDelete().getMethod(), is(MethodEnum.DELETE));
    assertThat(agencyLinks.getDelete().getHref(),
        is(String.format("/agencyadmin/agencies/%s", agency.getId())));
    assertThat(agencyLinks.getUpdate(), notNullValue());
    assertThat(agencyLinks.getUpdate().getMethod(), is(MethodEnum.PUT));
    assertThat(agencyLinks.getUpdate().getHref(),
        is(String.format("/agencyadmin/agencies/%s", agency.getId())));
    assertThat(agencyLinks.getPostcodeRanges(), notNullValue());
    assertThat(agencyLinks.getPostcodeRanges().getMethod(), is(MethodEnum.GET));
    assertThat(agencyLinks.getPostcodeRanges().getHref(),
        is(String.format("/agencyadmin/postcoderanges/%s", agency.getId())));

  }

  @Test(expected = NullPointerException.class)
  public void buildAgencyLinks_Should_ThrowNullPointerException_WhenAgencyIsNotSet() {

    AgencyLinksBuilder.getInstance(null).buildAgencyLinks();

  }

}
