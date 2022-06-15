package de.caritas.cob.agencyservice.api.admin.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.service.TenantHibernateInterceptor;
import de.caritas.cob.agencyservice.api.service.TopicService;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO;
import java.lang.reflect.Field;
import java.util.Optional;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.annotation.DirtiesContext.ClassMode;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.Sql.ExecutionPhase;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
@DirtiesContext(classMode = ClassMode.BEFORE_CLASS)
@TestPropertySource(properties = "multitenancy.enabled=true")
@TestPropertySource(properties = "feature.topics.enabled=true")
@Transactional
@Sql(value = "/setTenants.sql", executionPhase = ExecutionPhase.BEFORE_TEST_METHOD)
public class AgencyAdminServiceTenantAwareIT extends AgencyAdminServiceITBase {

  @MockBean
  private TopicService topicService;

  @Before
  public void beforeEach() throws NoSuchFieldException, IllegalAccessException {
    when(topicService.getAllTopics()).thenReturn(Lists.newArrayList(new TopicDTO().id(0L).name("first topic"), new TopicDTO().id(1L).name("second topic")));
    TenantContext.setCurrentTenant(1L);
    Field field = TenantHibernateInterceptor.class.getDeclaredField("multiTenancyEnabled");
    field.setAccessible(true);
    field.set(null, true);
  }

  @After
  public void afterEach() {
    TenantContext.clear();
  }

  @Test
  public void saveAgency_Should_PersistsAgency() {
    super.saveAgency_Should_PersistsAgency();
  }

  @Test
  public void saveAgency_Should_SetOfflineToTrue_WhenPersistsAgency() {
    super.saveAgency_Should_SetOfflineToTrue_WhenPersistsAgency();
  }

  @Test
  public void saveAgency_Should_ProvideValidAgencyLinks() {
    super.saveAgency_Should_ProvideValidAgencyLinks();
  }

  @Test
  public void updateAgency_Should_PersistsAgencyChanges() {
    super.updateAgency_Should_PersistsAgencyChanges();
  }

  @Test
  public void updateAgency_Should_ProvideValidAgencyLinks() {
    super.updateAgency_Should_ProvideValidAgencyLinks();
  }

  @Test
  public void getAgency_Should_returnExpectedAgency_When_agencyWithIdExists() {
    super.getAgency_Should_returnExpectedAgency_When_agencyWithIdExists();
  }

  @Test
  public void getAgency_Should_returnExpectedAgency_When_agencyWithIdExistsAndAssertTopics() {
    // given
    Long agencyId = 0L;

    // when
    AgencyAdminFullResponseDTO result = this.agencyAdminService.findAgency(agencyId);

    // then
    assertThat(result.getEmbedded()).isNotNull();
    assertThat(result.getEmbedded().getCity()).isNotNull();
    assertThat(result.getEmbedded().getTopics()).isNotNull();
    assertThat(result.getEmbedded().getId()).isNotNull();
    assertThat(result.getEmbedded().getDescription()).isNotNull();
    assertThat(result.getEmbedded().getConsultingType()).isNotNull();
    assertThat(result.getEmbedded().getName()).isNotNull();
    assertThat(result.getEmbedded().getDioceseId()).isNotNull();
    assertThat(result.getEmbedded().getTopics()).hasSize(2);
    assertThat(result.getEmbedded().getTopics())
        .extracting(topic -> topic.getId())
        .contains(0L, 1L);
  }

  @Test
  public void updateAgency_Should_PersistsAgencyChangesWithTopics() {
    // given
    UpdateAgencyDTO updateAgencyDTO = createUpdateAgencyDtoFromExistingAgency();
    updateAgencyDTO.setTopicIds(Lists.newArrayList(1L, 2L));

    // when
    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO =
        agencyAdminService.updateAgency(0L, updateAgencyDTO);

    // then
    Optional<Agency> agencyOptional =
        agencyRepository.findById(agencyAdminFullResponseDTO.getEmbedded().getId());
    Agency agency = agencyOptional.orElseThrow(RuntimeException::new);
    assertEquals(updateAgencyDTO.getDioceseId(), agency.getDioceseId());
    assertEquals(updateAgencyDTO.getPostcode(), agency.getPostCode());
    assertEquals(updateAgencyDTO.getDescription(), agency.getDescription());
    assertEquals(updateAgencyDTO.getName(), agency.getName());
    assertEquals(updateAgencyDTO.getCity(), agency.getCity());
    assertEquals(updateAgencyDTO.getOffline(), agency.isOffline());
    assertThat(agency.getAgencyTopics()).hasSize(2);
    assertThat(agency.getAgencyTopics())
        .extracting(agencyTopic -> agencyTopic.getTopicId())
        .contains(1L, 2L);
  }

  @Test
  public void saveAgency_Should_PersistsAgencyWithTopics() {
    // given
    AgencyDTO agencyDTO = createAgencyDTO();
    agencyDTO.setTopicIds(Lists.newArrayList(1L, 2L));

    // when
    AgencyAdminFullResponseDTO agencyAdminFullResponseDTO =
        agencyAdminService.saveAgency(agencyDTO);

    // then
    Optional<Agency> agencyOptional =
        agencyRepository.findById(agencyAdminFullResponseDTO.getEmbedded().getId());
    Agency agency = agencyOptional.get();
    assertTrue(agency.isTeamAgency());
    assertThat(agency.getConsultingTypeId()).isZero();
    assertThat(agency.getDioceseId().longValue()).isZero();
    assertThat(agency.getPostCode()).isEqualTo("12345");
    assertThat(agency.getDescription()).isEqualTo("Agency description");
    assertThat(agency.getName()).isEqualTo("Agency name");
    assertThat(agency.isOffline()).isTrue();
    assertThat(agency.getAgencyTopics()).hasSize(2);
    assertThat(agency.getAgencyTopics())
        .extracting(agencyTopic -> agencyTopic.getTopicId())
        .contains(1L, 2L);
  }
}
