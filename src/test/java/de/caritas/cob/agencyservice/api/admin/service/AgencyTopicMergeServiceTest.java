package de.caritas.cob.agencyservice.api.admin.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencytopic.AgencyTopic;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class AgencyTopicMergeServiceTest {

  @Mock
  Agency agency;

  @InjectMocks
  AgencyTopicMergeService agencyTopicMergeService;

  @Test
  void getMergedTopics_Should_ReturnEmptyListIfRequestTopicIdsIsNull() {
    assertThat(agencyTopicMergeService.getMergedTopics(agency, null)).isEmpty();
  }

  @Test
  void getMergedTopics_Should_ReturnEmptyListIfRequestTopicIdsIsEmpty() {
    assertThat(agencyTopicMergeService.getMergedTopics(agency, Lists.newArrayList())).isEmpty();
  }

  @Test
  void getMergedTopics_Should_ReturnRequestTopicListIfAgencyTopicsIsNull() {
    // when
    List<AgencyTopic> mergedTopics = agencyTopicMergeService.getMergedTopics(agency,
        Lists.newArrayList(1L, 2L));

    // then
    assertThat(mergedTopics).extracting(topic -> topic.getTopicId()).containsExactly(1L, 2L);
  }

  @Test
  void getMergedTopics_Should_ReturnRequestTopicListIfAgencyTopicsIsEmpty() {
    // given
    when(agency.getAgencyTopics()).thenReturn(Lists.newArrayList());

    // when
    List<AgencyTopic> mergedTopics = agencyTopicMergeService.getMergedTopics(agency,
        Lists.newArrayList(1L, 2L));

    // then
    assertThat(mergedTopics).extracting(topic -> topic.getTopicId()).containsExactly(1L, 2L);
  }

  @Test
  void getMergedTopics_Should_ReturnSameAgencyTopicListIfExistingAgencyTopicsContainsRequestTopicIds() {
    // given
    AgencyTopic existingAgencyTopic1 = AgencyTopic.builder().id(0L).topicId(1L).build();
    AgencyTopic existingAgencyTopic2 = AgencyTopic.builder().id(1L).topicId(2L).build();
    when(agency.getAgencyTopics()).thenReturn(Lists.newArrayList(existingAgencyTopic1, existingAgencyTopic2));

    // when
    List<AgencyTopic> mergedTopics = agencyTopicMergeService.getMergedTopics(agency,
        Lists.newArrayList(1L, 2L));

    // then
    assertThat(mergedTopics).containsExactly(existingAgencyTopic1, existingAgencyTopic2);
  }

  @Test
  void getMergedTopics_Should_ReturnMergedAgencyTopicListIfExistingAgencyTopicsContainsRequestTopicIdsAndOneAdditionalTopic() {
    // given
    AgencyTopic existingAgencyTopic1 = AgencyTopic.builder().id(0L).topicId(1L).build();
    AgencyTopic existingAgencyTopic2 = AgencyTopic.builder().id(1L).topicId(2L).build();
    when(agency.getAgencyTopics()).thenReturn(Lists.newArrayList(existingAgencyTopic1, existingAgencyTopic2));

    // when
    List<AgencyTopic> mergedTopics = agencyTopicMergeService.getMergedTopics(agency,
        Lists.newArrayList(1L, 2L, 3L));

    // then
    assertThat(mergedTopics)
        .hasSize(3)
        .contains(existingAgencyTopic1, existingAgencyTopic2);
    assertThat(mergedTopics).extracting(topic -> topic.getTopicId()).containsExactly(1L, 2L, 3L);
  }

  @Test
  void getMergedTopics_Should_RemoveExistingAgencyTopicsIfRequestTopicIdDoesNotContainExistingIds() {
    // given
    AgencyTopic existingAgencyTopic1 = AgencyTopic.builder().id(0L).topicId(1L).build();
    AgencyTopic existingAgencyTopic2 = AgencyTopic.builder().id(1L).topicId(2L).build();
    when(agency.getAgencyTopics()).thenReturn(Lists.newArrayList(existingAgencyTopic1, existingAgencyTopic2));

    // when
    List<AgencyTopic> mergedTopics = agencyTopicMergeService.getMergedTopics(agency,
        Lists.newArrayList(3L));

    // then
    assertThat(mergedTopics)
        .hasSize(1)
        .extracting(topic -> topic.getTopicId()).containsExactly(3L);
  }

  @Test
  void getMergedTopics_Should_RemoveSomeOfExistingAgencyTopicsAndAddNewOnesBasedOnRequesTopicIdsValue() {
    // given
    AgencyTopic existingAgencyTopic1 = AgencyTopic.builder().id(0L).topicId(1L).build();
    AgencyTopic existingAgencyTopic2 = AgencyTopic.builder().id(1L).topicId(2L).build();
    when(agency.getAgencyTopics()).thenReturn(Lists.newArrayList(existingAgencyTopic1, existingAgencyTopic2));

    // when
    List<AgencyTopic> mergedTopics = agencyTopicMergeService.getMergedTopics(agency,
        Lists.newArrayList(1L, 3L));

    // then
    assertThat(mergedTopics).hasSize(2).contains(existingAgencyTopic1);
    assertThat(mergedTopics).extracting(topic -> topic.getTopicId()).containsExactly(1L, 3L);
  }
}