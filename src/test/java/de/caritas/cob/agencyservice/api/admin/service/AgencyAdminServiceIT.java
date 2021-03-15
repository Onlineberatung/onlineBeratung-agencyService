package de.caritas.cob.agencyservice.api.admin.service;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.hamcrest.Matchers.endsWith;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import java.util.Optional;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.annotation.DirtiesContext.ClassMode;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
@DirtiesContext(classMode = ClassMode.BEFORE_CLASS)
public class AgencyAdminServiceIT {

  @Autowired private AgencyAdminService agencyAdminService;
  @Autowired private AgencyRepository agencyRepository;

  @Test
  public void saveAgency_Should_PersistsAgency() {

    AgencyDTO agencyDTO = createAgencyDTO();

    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO = agencyAdminService.saveAgency(agencyDTO);

    Optional<Agency> agencyOptional =
        agencyRepository.findById(agencyAdminFullResponseDTO.getEmbedded().getId());
    Agency agency = agencyOptional.get();
    assertTrue(agency.isTeamAgency());
    assertEquals(ConsultingType.SOCIAL, agency.getConsultingType());
    assertEquals(0L, agency.getDioceseId().longValue());
    assertEquals("12345", agency.getPostCode());
    assertEquals("Agency description", agency.getDescription());
    assertEquals("Agency name", agency.getName());
    assertTrue(agency.isOffline());
  }

  @Test
  public void saveAgency_Should_SetOfflineToTrue_WhenPersistsAgency() {

    AgencyDTO agencyDTO = createAgencyDTO();

    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO = agencyAdminService.saveAgency(agencyDTO);

    Optional<Agency> agencyOptional =
        agencyRepository.findById(agencyAdminFullResponseDTO.getEmbedded().getId());
    Agency agency = agencyOptional.get();
    assertTrue(agency.isOffline());
  }

  @Test
  public void saveAgency_Should_ProvideValidAgencyLinks() {

    AgencyDTO agencyDTO = createAgencyDTO();

    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO = agencyAdminService.saveAgency(agencyDTO);
    assertThat(agencyAdminFullResponseDTO.getLinks().getDelete(), notNullValue());
    assertThat(
        agencyAdminFullResponseDTO.getLinks().getDelete().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agencies/%s", agencyAdminFullResponseDTO.getEmbedded().getId())));
    assertThat(agencyAdminFullResponseDTO.getLinks().getSelf(), notNullValue());
    assertThat(
        agencyAdminFullResponseDTO.getLinks().getSelf().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agencies/%s", agencyAdminFullResponseDTO.getEmbedded().getId())));
    assertThat(agencyAdminFullResponseDTO.getLinks().getUpdate(), notNullValue());
    assertThat(
        agencyAdminFullResponseDTO.getLinks().getUpdate().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agencies/%s", agencyAdminFullResponseDTO.getEmbedded().getId())));
    assertThat(agencyAdminFullResponseDTO.getLinks().getPostcoderanges(), notNullValue());
    assertThat(
        agencyAdminFullResponseDTO.getLinks().getPostcoderanges().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agencies/%s/postcoderanges?page=%s&perPage=%s", agencyAdminFullResponseDTO.getEmbedded().getId(), 1, 20)));
  }

  private AgencyDTO createAgencyDTO() {

    AgencyDTO agencyDTO = new AgencyDTO();
    agencyDTO.setTeamAgency(true);
    agencyDTO.setConsultingType(ConsultingType.SOCIAL.getValue());
    agencyDTO.setDioceseId(0L);
    agencyDTO.setPostcode("12345");
    agencyDTO.setDescription("Agency description");
    agencyDTO.setName("Agency name");
    return agencyDTO;
  }

  @Test
  public void updateAgency_Should_PersistsAgencyChanges() {

    UpdateAgencyDTO updateAgencyDTO = createUpdateAgencyDtoFromExistingAgency();
    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO
        = agencyAdminService.updateAgency(0L, updateAgencyDTO);

    Optional<Agency> agencyOptional =
        agencyRepository.findById(agencyAdminFullResponseDTO.getEmbedded().getId());
    Agency agency = agencyOptional.orElseThrow(RuntimeException::new);
    assertEquals(updateAgencyDTO.getDioceseId(), agency.getDioceseId());
    assertEquals(updateAgencyDTO.getPostcode(), agency.getPostCode());
    assertEquals(updateAgencyDTO.getDescription(), agency.getDescription());
    assertEquals(updateAgencyDTO.getName(), agency.getName());
    assertEquals(updateAgencyDTO.getCity(), agency.getCity());
    assertEquals(updateAgencyDTO.getOffline(),  agency.isOffline());
  }

  private UpdateAgencyDTO createUpdateAgencyDtoFromExistingAgency() {

    Optional<Agency> agencyOptional = agencyRepository.findById(0L);
    Agency agency = agencyOptional.orElseThrow(RuntimeException::new);
    UpdateAgencyDTO updateAgencyDTO = new UpdateAgencyDTO();
    updateAgencyDTO.dioceseId(agency.getDioceseId() + 1);
    updateAgencyDTO.name(agency.getName() + "x");
    updateAgencyDTO.description(agency.getDescription() + "x");
    updateAgencyDTO.postcode("00000");
    updateAgencyDTO.city(agency.getCity() + "x");
    updateAgencyDTO.setOffline(!agency.isOffline());
    return updateAgencyDTO;

  }

  @Test
  public void updateAgency_Should_ProvideValidAgencyLinks() {

    UpdateAgencyDTO updateAgencyDTO = createUpdateAgencyDtoFromExistingAgency();

    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO = agencyAdminService.updateAgency(0L, updateAgencyDTO);
    assertThat(agencyAdminFullResponseDTO.getLinks().getDelete(), notNullValue());
    assertThat(
        agencyAdminFullResponseDTO.getLinks().getDelete().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agencies/%s", agencyAdminFullResponseDTO.getEmbedded().getId())));
    assertThat(agencyAdminFullResponseDTO.getLinks().getSelf(), notNullValue());
    assertThat(
        agencyAdminFullResponseDTO.getLinks().getSelf().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agencies/%s", agencyAdminFullResponseDTO.getEmbedded().getId())));
    assertThat(agencyAdminFullResponseDTO.getLinks().getUpdate(), notNullValue());
    assertThat(
        agencyAdminFullResponseDTO.getLinks().getUpdate().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agencies/%s", agencyAdminFullResponseDTO.getEmbedded().getId())));
    assertThat(agencyAdminFullResponseDTO.getLinks().getPostcoderanges(), notNullValue());
    assertThat(
        agencyAdminFullResponseDTO.getLinks().getPostcoderanges().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agencies/%s/postcoderanges?page=%s&perPage=%s", agencyAdminFullResponseDTO.getEmbedded().getId(), 1, 20)));
  }

  @Test
  public void getAgency_Should_returnExpectedAgency_When_agencyWithIdExists() {
    Long agencyId = 1L;

    AgencyAdminFullResponseDTO result = this.agencyAdminService.findAgency(agencyId);

    assertThat(result.getEmbedded(), notNullValue());
    assertThat(result.getEmbedded().getCity(), notNullValue());
    assertThat(result.getEmbedded().getId(), notNullValue());
    assertThat(result.getEmbedded().getDescription(), notNullValue());
    assertThat(result.getEmbedded().getConsultingType(), notNullValue());
    assertThat(result.getEmbedded().getName(), notNullValue());
    assertThat(result.getEmbedded().getDioceseId(), notNullValue());
  }

}
