package de.caritas.cob.agencyservice.api.admin.service.agency;

import com.google.common.collect.Maps;
import de.caritas.cob.agencyservice.api.model.TopicDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencytopic.AgencyTopic;
import de.caritas.cob.agencyservice.api.service.TopicService;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@ConditionalOnExpression("${feature.topics.enabled:true}")
@Slf4j
public class AgencyTopicEnrichmentService {

  private final @NonNull TopicService topicService;

  public Agency enrichAgencyWithTopics(Agency agency) {
    log.debug("Enriching agency with topics");
    var availableTopics = getAvailableTopicsMap();
    var agencyTopics = agency.getAgencyTopics();
    log.debug("Enriching agency with {} with information about the topics", agency.getId());
    log.debug("Available topics list has size: {} ", availableTopics.size());
    for (AgencyTopic agencyTopic : agencyTopics) {
      enrichSingleAgencyTopic(availableTopics, agencyTopic);
    }
    return agency;
  }

  private void enrichSingleAgencyTopic(Map<Long, TopicDTO> availableTopics,
      AgencyTopic agencyTopic) {
    var topicData = availableTopics.get(agencyTopic.getTopicId());
    if (topicData != null) {
      log.debug("Enriching agency with {} with topicData {}", agencyTopic.getAgency(), topicData);
      agencyTopic.setTopicData(topicData);
    } else {
      log.warn("Did not find matching topic for id: {} in the available topic list",
          agencyTopic.getTopicId());
    }
  }

  private Map<Long, TopicDTO> getAvailableTopicsMap() {
    var allTopics = topicService.getAllTopics();
    return isEmptyOrNull(allTopics) ? Maps.newHashMap() : getAvailableTopicsMap(allTopics);
  }

  private Map<Long, TopicDTO> getAvailableTopicsMap(
      List<de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO> allTopics) {
    return allTopics.stream()
        .collect(Collectors.toMap(
            de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO::getId,
            this::convertToAgencyServiceTopicViewDTO));
  }

  private boolean isEmptyOrNull(
      List<de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO> allTopics) {
    return allTopics == null || allTopics.isEmpty();
  }

  private TopicDTO convertToAgencyServiceTopicViewDTO(
      de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO source) {
    return new TopicDTO().id(source.getId())
        .name(source.getName())
        .description(source.getDescription())
        .internalIdentifier(source.getInternalIdentifier())
        .status(source.getStatus());
  }
}
