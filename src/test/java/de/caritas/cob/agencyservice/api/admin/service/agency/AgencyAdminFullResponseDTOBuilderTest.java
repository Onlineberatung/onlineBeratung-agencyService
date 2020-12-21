package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.jupiter.api.Assertions.*;

import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyLinks;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;

public class AgencyAdminFullResponseDTOBuilderTest {

  private AgencyAdminFullResponseDTOBuilder agencyAdminFullResponseDTOBuilder;
  private Agency agency;

  @Before
  public void init() {
    EasyRandom easyRandom = new EasyRandom();
    this.agency = easyRandom.nextObject(Agency.class);
    this.agencyAdminFullResponseDTOBuilder = new AgencyAdminFullResponseDTOBuilder(agency);
  }

  @Test
  public void fromAgency_Should_Return_ValidAgency() {

    AgencyAdminFullResponseDTO result = agencyAdminFullResponseDTOBuilder.fromAgency();

    assertEquals(agency.getId(), result.getEmbedded().getId());
    assertEquals(agency.getName(), result.getEmbedded().getName());
    assertEquals(agency.getDescription(), result.getEmbedded().getDescription());
    assertEquals(agency.isTeamAgency(), result.getEmbedded().getTeamAgency());
    assertEquals(agency.getDioceseId(), result.getEmbedded().getDioceseId());
    assertEquals(agency.getPostCode(), result.getEmbedded().getPostcode());
    assertEquals(agency.getCity(), result.getEmbedded().getCity());
    assertEquals(agency.isOffline(), result.getEmbedded().getOffline());
    assertEquals(agency.getConsultingType().getValue(), result.getEmbedded().getConsultingType());
    assertEquals(String.valueOf(agency.getCreateDate()), result.getEmbedded().getCreateDate());
    assertEquals(String.valueOf(agency.getUpdateDate()), result.getEmbedded().getUpdateDate());
    assertEquals(String.valueOf(agency.getDeleteDate()), result.getEmbedded().getDeleteDate());
  }

  @Test
  public void fromAgency_Should_Return_ValidHalLinks() {

    AgencyAdminFullResponseDTO result = agencyAdminFullResponseDTOBuilder.fromAgency();
    AgencyLinks agencyLinks = result.getLinks();

    assertThat(result, notNullValue());
    assertThat(agencyLinks.getSelf(), notNullValue());
    assertThat(agencyLinks.getSelf().getMethod(), is(MethodEnum.GET));
    assertThat(agencyLinks.getSelf().getHref(),
        is(String.format("/agencyadmin/agency/%s", agency.getId())));
    assertThat(agencyLinks.getDelete(), notNullValue());
    assertThat(agencyLinks.getDelete().getMethod(), is(MethodEnum.DELETE));
    assertThat(agencyLinks.getDelete().getHref(),
        is(String.format("/agencyadmin/agency/%s", agency.getId())));
    assertThat(agencyLinks.getUpdate(), notNullValue());
    assertThat(agencyLinks.getUpdate().getMethod(), is(MethodEnum.PUT));
    assertThat(agencyLinks.getUpdate().getHref(),
        is(String.format("/agencyadmin/agency/%s", agency.getId())));
    assertThat(agencyLinks.getPostcoderanges(), notNullValue());
    assertThat(agencyLinks.getPostcoderanges().getMethod(), is(MethodEnum.GET));
    assertThat(agencyLinks.getPostcoderanges().getHref(),
        is(String.format("/agencyadmin/agency/%s/postcoderanges?page=%s&perPage=%s", this.agency.getId(), 1, 20)));
  }

}
