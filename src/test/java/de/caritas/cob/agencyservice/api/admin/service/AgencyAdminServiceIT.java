package de.caritas.cob.agencyservice.api.admin.service;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.hamcrest.Matchers.endsWith;
import static org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers.endsWith;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.CreateAgencyResponseDTO;
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

    CreateAgencyResponseDTO createAgencyResponseDTO = agencyAdminService.saveAgency(agencyDTO);

    Optional<Agency> agencyOptional =
        agencyRepository.findById(createAgencyResponseDTO.getEmbedded().getAgencyId());
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

    CreateAgencyResponseDTO createAgencyResponseDTO = agencyAdminService.saveAgency(agencyDTO);

    Optional<Agency> agencyOptional =
        agencyRepository.findById(createAgencyResponseDTO.getEmbedded().getAgencyId());
    Agency agency = agencyOptional.get();
    assertTrue(agency.isOffline());
  }

  @Test
  public void saveAgency_Should_ProvideValidCreateLinks() {

    AgencyDTO agencyDTO = createAgencyDTO();

    CreateAgencyResponseDTO createAgencyResponseDTO = agencyAdminService.saveAgency(agencyDTO);
    assertThat(createAgencyResponseDTO.getLinks().getDelete(), notNullValue());
    assertThat(
        createAgencyResponseDTO.getLinks().getDelete().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agency/%s", createAgencyResponseDTO.getEmbedded().getAgencyId())));
    assertThat(createAgencyResponseDTO.getLinks().getSelf(), notNullValue());
    assertThat(
        createAgencyResponseDTO.getLinks().getSelf().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agency/%s", createAgencyResponseDTO.getEmbedded().getAgencyId())));
    assertThat(createAgencyResponseDTO.getLinks().getUpdate(), notNullValue());
    assertThat(
        createAgencyResponseDTO.getLinks().getUpdate().getHref(),
        endsWith(
            String.format(
                "/agencyadmin/agency/%s", createAgencyResponseDTO.getEmbedded().getAgencyId())));
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
}
