package de.caritas.cob.agencyservice.api.admin.service.agency;

import de.caritas.cob.agencyservice.api.model.TopicDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.service.TopicService;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@ConditionalOnExpression("${feature.topics.enabled:true}")
public class AgencyTopicEnrichmentService {

  private final @NonNull TopicService topicService;

  public Agency enrichAgencyWithTopics(Agency agency) {
    var availableTopics = getAvailableTopicsMap();
    var agencyTopics = agency.getAgencyTopics();
    agencyTopics.stream().forEach(
        agencyTopic -> agencyTopic.setTopicData(availableTopics.get(agencyTopic.getTopicId())));
    return agency;
  }

  private Map<Long, TopicDTO> getAvailableTopicsMap() {
    List<de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO> allTopics = topicService.getAllTopics();
    return allTopics.stream()
        .collect(Collectors.toMap(
            de.caritas.cob.agencyservice.topicservice.generated.web.model.TopicDTO::getId,
            this::convertToAgencyServiceTopicViewDTO));
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
