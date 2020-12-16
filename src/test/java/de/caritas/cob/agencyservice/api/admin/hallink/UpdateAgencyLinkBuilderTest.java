package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.UpdateLinks;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import org.jeasy.random.EasyRandom;
import org.junit.Test;

public class UpdateAgencyLinkBuilderTest {

  @Test
  public void buildUpdateAgencyLinks_Should_returnUpdateLinks_When_AgencyIsSet() {

    EasyRandom easyRandom = new EasyRandom();
    Agency agency = easyRandom.nextObject(Agency.class);

    UpdateLinks updateLinks = UpdateAgencyLinkBuilder.getInstance(agency)
        .buildUpdateAgencyLinks();

    assertThat(updateLinks, notNullValue());
    assertThat(updateLinks.getSelf(), notNullValue());
    assertThat(updateLinks.getSelf().getMethod(), is(MethodEnum.PUT));
    assertThat(updateLinks.getSelf().getHref(),
        is(String.format("/agencyadmin/agency/%s", agency.getId())));
    assertThat(updateLinks.getDelete(), notNullValue());
    assertThat(updateLinks.getDelete().getMethod(), is(MethodEnum.DELETE));
    assertThat(updateLinks.getDelete().getHref(),
        is(String.format("/agencyadmin/agency/%s", agency.getId())));
    assertThat(updateLinks.getAgency(), notNullValue());
    assertThat(updateLinks.getAgency().getMethod(), is(MethodEnum.GET));
    assertThat(updateLinks.getAgency().getHref(),
        is(String.format("/agencyadmin/agency/%s", agency.getId())));

  }

  @Test(expected = NullPointerException.class)
  public void buildUpdateAgencyLinks_Should_ThrowNullPointerException_WhenAgencyIsNotSet() {

    UpdateAgencyLinkBuilder.getInstance(null).buildUpdateAgencyLinks();

  }

}
