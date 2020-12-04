package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.RootDTO;
import de.caritas.cob.agencyservice.api.model.RootLinks;
import org.junit.Test;

public class RootDTOBuilderTest {

  @Test
  public void buildRootDTO_Should_returnRootDTOWithHalLinks() {
    RootDTO rootDTO = new RootDTOBuilder().buildRootDTO();

    assertThat(rootDTO, notNullValue());
    RootLinks rootLinks = rootDTO.getLinks();
    assertThat(rootLinks, notNullValue());
    assertThat(rootLinks.getAgencies(), notNullValue());
    assertThat(rootLinks.getAgencies().getHref(), is("/agencyadmin/agencies?page=1&perPage=20{&q}"));
    assertThat(rootLinks.getAgencies().getMethod(), is(MethodEnum.GET));
    assertThat(rootLinks.getAgency(), notNullValue());
    assertThat(rootLinks.getAgency().getHref(), is("/agencyadmin/agency"));
    assertThat(rootLinks.getAgency().getMethod(), is(MethodEnum.POST));
    assertThat(rootLinks.getSelf().getHref(), is("/agencyadmin"));
    assertThat(rootLinks.getSelf().getMethod(), is(MethodEnum.GET));
  }

}
