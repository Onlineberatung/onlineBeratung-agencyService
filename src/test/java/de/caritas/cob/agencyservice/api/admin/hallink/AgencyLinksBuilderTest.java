package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.jupiter.api.Assertions.assertThrows;

import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import org.jeasy.random.EasyRandom;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class AgencyLinksBuilderTest {

  @Test
  void buildAgencyLinks_Should_returnAgencyLinks_When_AgencyIsSet() {

    var easyRandom = new EasyRandom();
    var agency = easyRandom.nextObject(Agency.class);

    var agencyLinks = AgencyLinksBuilder.getInstance(agency)
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

  @Test
  void buildAgencyLinks_Should_ThrowNullPointerException_WhenAgencyIsNotSet() {
    assertThrows(NullPointerException.class, () -> AgencyLinksBuilder.getInstance(null));
  }

}
