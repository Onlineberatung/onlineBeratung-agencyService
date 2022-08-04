package de.caritas.cob.agencyservice.api.admin.service;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencytopic.AgencyTopic;
import java.time.LocalDateTime;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import org.springframework.stereotype.Service;

@Service
public class AgencyTopicMergeService {

  public List<AgencyTopic> getMergedTopics(Agency agency, List<Long> requestTopicIds) {
    if (requestTopicIds == null || requestTopicIds.isEmpty()) {
      return Lists.newArrayList();
    } else {
      return getMergedTopicsForNonEmptyTopicList(agency, requestTopicIds);
    }
  }

  private List<AgencyTopic> getMergedTopicsForNonEmptyTopicList(Agency agency, List<Long> requestTopicIds) {
    List<AgencyTopic> agencyTopics = agency.getAgencyTopics();
    if (agencyTopics != null) {
      return getAgencyTopics(agency, requestTopicIds, agencyTopics);
    } else {
      return createAgencyTopicList(agency, requestTopicIds);
    }
  }

  private List<AgencyTopic> getAgencyTopics(Agency agency, List<Long> requestTopicIds,
      List<AgencyTopic> existingAgencyTopics) {
    var topicsIdsToAdd = getTopicIdsToAdd(requestTopicIds, existingAgencyTopics);
    var topicsToUpdate = existingAgencyTopics.stream()
        .filter(topicWithIdExistInTheRequest(requestTopicIds)).collect(
            Collectors.toList());

    List<AgencyTopic> resultList = Lists.newArrayList();
    resultList.addAll(topicsToUpdate);
    resultList.addAll(createAgencyTopicList(agency, topicsIdsToAdd));
    return resultList;
  }

  private List<Long> getTopicIdsToAdd(List<Long> requestTopicIds, List<AgencyTopic> existingAgencyTopics) {
    return requestTopicIds.stream()
        .filter(topicId -> !extractTopicIds(existingAgencyTopics).contains(topicId)).collect(
            Collectors.toList());
  }

  private List<Long> extractTopicIds(List<AgencyTopic> agencyTopics) {
    return agencyTopics.stream().map(AgencyTopic::getTopicId).collect(Collectors.toList());
  }

  private Predicate<AgencyTopic> topicWithIdExistInTheRequest(List<Long> topicIds) {
    return agencyTopic -> topicIds.contains(agencyTopic.getTopicId());
  }

  private List<AgencyTopic> createAgencyTopicList(Agency agency, List<Long> topicsToAdd) {
    return topicsToAdd.stream().map(topicId -> createNewAgencyTopic(agency, topicId))
        .collect(Collectors.toList());
  }

  private AgencyTopic createNewAgencyTopic(Agency agency, Long topicId) {
    var agencyTopic = new AgencyTopic();
    agencyTopic.setAgency(agency);
    agencyTopic.setTopicId(topicId);
    agencyTopic.setCreateDate(LocalDateTime.now());
    agencyTopic.setUpdateDate(LocalDateTime.now());
    return agencyTopic;
  }
}
