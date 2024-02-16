package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.AgencyLinks;
import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.DataProtectionResponsibleEntity;
import de.caritas.cob.agencyservice.api.repository.agency.Gender;
import de.caritas.cob.agencyservice.api.util.JsonConverter;
import org.jeasy.random.EasyRandom;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AgencyAdminFullResponseDTOBuilderTest {

  private static final Long TENANT_ID = 1L;
  AgencyAdminFullResponseDTOBuilder agencyAdminFullResponseDTOBuilder;
  Agency agency;

  @BeforeEach
  public void init() {
    EasyRandom easyRandom = new EasyRandom();
    this.agency = easyRandom.nextObject(Agency.class);
    this.agency.setDataProtectionResponsibleEntity(DataProtectionResponsibleEntity.AGENCY_RESPONSIBLE);
    this.agency.setDataProtectionAgencyResponsibleContactData(JsonConverter.convertToJson(new DataProtectionContactDTO()));
    this.agency.setDataProtectionOfficerContactData(JsonConverter.convertToJson(new DataProtectionContactDTO()));
    this.agency.setDataProtectionAlternativeContactData(JsonConverter.convertToJson(new DataProtectionContactDTO()));
    this.agency.setTenantId(TENANT_ID);
    this.agencyAdminFullResponseDTOBuilder = new AgencyAdminFullResponseDTOBuilder(agency);
    this.agency.setCounsellingRelations(AgencyDTO.CounsellingRelationsEnum.PARENTAL_COUNSELLING.getValue() + "," + AgencyDTO.CounsellingRelationsEnum.RELATIVE_COUNSELLING.getValue());
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
    assertEquals(agency.getPostCode(), result.getEmbedded().getPostcode());
    assertEquals(agency.getCity(), result.getEmbedded().getCity());
    assertEquals(agency.isOffline(), result.getEmbedded().getOffline());
    assertEquals(agency.getUrl(), result.getEmbedded().getUrl());
    assertEquals(agency.isExternal(), result.getEmbedded().getExternal());
    assertEquals(agency.getConsultingTypeId(), result.getEmbedded().getConsultingType());
    assertEquals(agency.getAgencyLogo(), result.getEmbedded().getAgencyLogo());
    assertThat(result.getEmbedded().getCounsellingRelations()).containsOnly(AgencyAdminResponseDTO.CounsellingRelationsEnum.PARENTAL_COUNSELLING, AgencyAdminResponseDTO.CounsellingRelationsEnum.RELATIVE_COUNSELLING);
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

    assertThat(result).isNotNull();
    assertEquals(TENANT_ID, result.getEmbedded().getTenantId());
    assertThat(agencyLinks.getSelf()).isNotNull();
    assertThat(agencyLinks.getSelf().getMethod()).isEqualTo(MethodEnum.GET);
    assertThat(agencyLinks.getSelf().getHref()).isEqualTo(String.format("/agencyadmin/agencies/%s", agency.getId()));
    assertThat(agencyLinks.getDelete()).isNotNull();
    assertThat(agencyLinks.getDelete().getMethod()).isEqualTo(MethodEnum.DELETE);
    assertThat(agencyLinks.getDelete().getHref()).isEqualTo(String.format("/agencyadmin/agencies/%s", agency.getId()));
    assertThat(agencyLinks.getUpdate()).isNotNull();
    assertThat(agencyLinks.getUpdate().getMethod()).isEqualTo(MethodEnum.PUT);
    assertThat(agencyLinks.getUpdate().getHref()).isEqualTo(String.format("/agencyadmin/agencies/%s", agency.getId()));
    assertThat(agencyLinks.getPostcodeRanges()).isNotNull();
    assertThat(agencyLinks.getPostcodeRanges().getMethod()).isEqualTo(MethodEnum.GET);
    assertThat(agencyLinks.getPostcodeRanges().getHref()).isEqualTo(String.format("/agencyadmin/postcoderanges/%s", this.agency.getId()));
  }

}
