package de.caritas.cob.agencyservice.api.repository.agencytopic;

import de.caritas.cob.agencyservice.api.model.TopicDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import javax.persistence.Transient;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

// TODO Patric implement
@Data
@RequiredArgsConstructor
public class AgencyTopic {

  private @NonNull Agency agency;

  private @NonNull Long topicId;

  @Transient
  TopicDTO topicData = new TopicDTO();
}
