package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.model.CreateLinks;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import org.jeasy.random.EasyRandom;
import org.junit.Test;

public class CreateAgencyLinkBuilderTest {

  @Test
  public void buildCreateAgencyLinks_Should_returnCreateLinks_When_AgencyIsSet() {

    EasyRandom easyRandom = new EasyRandom();
    Agency agency = easyRandom.nextObject(Agency.class);

    CreateLinks createLinks = CreateAgencyLinkBuilder.getInstance()
        .withAgency(agency)
        .buildCreateAgencyLinks();

    assertThat(createLinks, notNullValue());
    assertThat(createLinks.getSelf(), notNullValue());
    assertThat(createLinks.getSelf().getMethod(), is(MethodEnum.GET));
    assertThat(createLinks.getSelf().getHref(),
        is(String.format("/agencyadmin/agency/%s", agency.getId())));
    assertThat(createLinks.getDelete(), notNullValue());
    assertThat(createLinks.getDelete().getMethod(), is(MethodEnum.DELETE));
    assertThat(createLinks.getDelete().getHref(),
        is(String.format("/agencyadmin/agency/%s", agency.getId())));
    assertThat(createLinks.getUpdate(), notNullValue());
    assertThat(createLinks.getUpdate().getMethod(), is(MethodEnum.PUT));
    assertThat(createLinks.getUpdate().getHref(),
        is(String.format("/agencyadmin/agency/%s", agency.getId())));

  }

  @Test(expected = InternalServerErrorException.class)
  public void buildCreateAgencyLinks_Should_ThrowInternalServerException_WhenAgencyIsNotSet() {

    CreateLinks createLinks = CreateAgencyLinkBuilder.getInstance()
        .buildCreateAgencyLinks();

  }

}
