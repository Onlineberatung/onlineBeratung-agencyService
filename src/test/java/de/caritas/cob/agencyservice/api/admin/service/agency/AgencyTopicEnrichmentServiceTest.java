package de.caritas.cob.agencyservice.api.admin.service.agency;

import static com.google.common.collect.Lists.newArrayList;
import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencytopic.AgencyTopic;
import de.caritas.cob.agencyservice.api.service.TopicService;
import java.util.ArrayList;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class AgencyTopicEnrichmentServiceTest {

  @InjectMocks
  AgencyTopicEnrichmentService agencyTopicEnrichmentService;

  @Mock
  TopicService topicService;

  @Test
  void enrichAgencyWithTopics_Should_EnrichAgencyWithTopicDataFromTopicService() {
    // given
    when(topicService.getAllTopics()).thenReturn(
        newArrayList(new TopicDTO().id(1L).name("first topic").description("desc"),
            new TopicDTO().id(2L).name("second topic").description("desc")));
    var agencyTopics = newArrayList(
        createAgencyTopic(new Agency(), 1L), createAgencyTopic(new Agency(), 2L));

    // when
    var agency = newAgencyWithTopics(agencyTopics);
    agencyTopicEnrichmentService.enrichAgencyWithTopics(agency);

    // then
    assertThat(agency.getAgencyTopics())
        .extracting(agencyTopic -> agencyTopic.getTopicData().getName())
        .contains("first topic", "second topic");
  }


  @Test
  void enrichAgencyWithTopics_Should_NotEnrichIfNoTopicsAreDefined() {
    // given
    when(topicService.getAllTopics()).thenReturn(
        newArrayList());
    var agencyTopics = newArrayList(
        createAgencyTopic(new Agency(), 1L), createAgencyTopic(new Agency(), 2L));

    // when
    var agency = newAgencyWithTopics(agencyTopics);
    agencyTopicEnrichmentService.enrichAgencyWithTopics(agency);

    // then
    assertThat(agency.getAgencyTopics())
        .extracting(agencyTopic -> agencyTopic.getTopicData().getName())
        .containsOnlyNulls();
  }


  @Test
  void enrichAgencyWithTopics_Should_NotEnrichIfTopicsListIsNull() {
    // given
    when(topicService.getAllTopics()).thenReturn(
        null);
    var agencyTopics = newArrayList(
        createAgencyTopic(new Agency(), 1L), createAgencyTopic(new Agency(), 2L));

    // when
    var agency = newAgencyWithTopics(agencyTopics);
    agencyTopicEnrichmentService.enrichAgencyWithTopics(agency);

    // then
    assertThat(agency.getAgencyTopics())
        .extracting(agencyTopic -> agencyTopic.getTopicData().getName())
        .containsOnlyNulls();
  }

  @Test
  void enrichAgencyWithTopics_Should_NotEnrichWithTopicDataIfTopicIdDoNotMatch() {
    // given
    when(topicService.getAllTopics()).thenReturn(
        newArrayList(new TopicDTO().id(3L).name("third topic").description("desc"),
            new TopicDTO().id(4L).name("fourth topic").description("desc")));
    var agencyTopics = newArrayList(
        createAgencyTopic(new Agency(), 1L), createAgencyTopic(new Agency(), 2L));

    // when
    var agency = newAgencyWithTopics(agencyTopics);
    agencyTopicEnrichmentService.enrichAgencyWithTopics(agency);

    // then
    assertThat(agency.getAgencyTopics())
        .extracting(agencyTopic -> agencyTopic.getTopicData().getName())
        .containsOnlyNulls();
  }

  private AgencyTopic createAgencyTopic(Agency agency, long topicId) {
    var agencyTopic = new AgencyTopic();
    agencyTopic.setAgency(agency);
    agencyTopic.setTopicId(topicId);
    return agencyTopic;
  }

  private Agency newAgencyWithTopics(ArrayList<AgencyTopic> agencyTopics) {
    var agency = new Agency();
    agency.setAgencyTopics(agencyTopics);
    return agency;
  }
}