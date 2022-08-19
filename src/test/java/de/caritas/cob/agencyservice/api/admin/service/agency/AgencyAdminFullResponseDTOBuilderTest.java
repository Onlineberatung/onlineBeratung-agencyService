package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyLinks;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.Gender;
import org.jeasy.random.EasyRandom;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AgencyAdminFullResponseDTOBuilderTest {

  AgencyAdminFullResponseDTOBuilder agencyAdminFullResponseDTOBuilder;
  Agency agency;

  @BeforeEach
  public void init() {
    EasyRandom easyRandom = new EasyRandom();
    this.agency = easyRandom.nextObject(Agency.class);
    this.agencyAdminFullResponseDTOBuilder = new AgencyAdminFullResponseDTOBuilder(agency);
  }

  @Test
  void fromAgency_Should_Return_ValidAgency() {

    var result = agencyAdminFullResponseDTOBuilder.fromAgency();

    assertBaseDTOAttributesAreMapped(result);
  }

  private void assertBaseDTOAttributesAreMapped(AgencyAdminFullResponseDTO result) {
    assertEquals(agency.getId(), result.getEmbedded().getId());
    assertEquals(agency.getName(), result.getEmbedded().getName());
    assertEquals(agency.getDescription(), result.getEmbedded().getDescription());
    assertEquals(agency.isTeamAgency(), result.getEmbedded().getTeamAgency());
    assertEquals(agency.getDioceseId(), result.getEmbedded().getDioceseId());
    assertEquals(agency.getPostCode(), result.getEmbedded().getPostcode());
    assertEquals(agency.getCity(), result.getEmbedded().getCity());
    assertEquals(agency.isOffline(), result.getEmbedded().getOffline());
    assertEquals(agency.getUrl(), result.getEmbedded().getUrl());
    assertEquals(agency.isExternal(), result.getEmbedded().getExternal());
    assertEquals(agency.getConsultingTypeId(), result.getEmbedded().getConsultingType());
    assertEquals(String.valueOf(agency.getCreateDate()), result.getEmbedded().getCreateDate());
    assertEquals(String.valueOf(agency.getUpdateDate()), result.getEmbedded().getUpdateDate());
    assertEquals(String.valueOf(agency.getDeleteDate()), result.getEmbedded().getDeleteDate());
  }

  @Test
  void fromAgency_Should_Return_ValidAgencyWithDemographics_IfAtLeastOneDemographicsAttributeIsAdded() {
    // given
    agency.setAgeFrom((short) 15);
    agency.setAgeTo(null);
    agency.setGenders(Gender.MALE.toString());
    // when
    var result = agencyAdminFullResponseDTOBuilder.fromAgency();

    // then
    assertBaseDTOAttributesAreMapped(result);
    assertEquals(toInteger(agency.getAgeFrom()), result.getEmbedded().getDemographics().getAgeFrom());
    assertEquals(toInteger(agency.getAgeTo()), result.getEmbedded().getDemographics().getAgeTo());
    assertTrue(result.getEmbedded().getDemographics().getGenders().contains(agency.getGenders()));
  }

  @Test
  void fromAgency_Should_Return_ValidAgency_WithoutDemographics_IfNoneDemographicsAttributeAreSet() {
    // given
    agency.setAgeFrom(null);
    agency.setAgeTo(null);
    agency.setGenders(null);
    // when
    var result = agencyAdminFullResponseDTOBuilder.fromAgency();

    // then
    assertBaseDTOAttributesAreMapped(result);
    assertNull(result.getEmbedded().getDemographics());
  }

  private Integer toInteger(Short value) {
    return value != null ? value.intValue() : null;
  }

  @Test
  void fromAgency_Should_Return_ValidHalLinks() {

    AgencyAdminFullResponseDTO result = agencyAdminFullResponseDTOBuilder.fromAgency();
    AgencyLinks agencyLinks = result.getLinks();

    assertThat(result, notNullValue());
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
        is(String.format("/agencyadmin/postcoderanges/%s", this.agency.getId())));
  }

}
