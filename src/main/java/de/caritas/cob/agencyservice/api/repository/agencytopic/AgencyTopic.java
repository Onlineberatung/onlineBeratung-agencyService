package de.caritas.cob.agencyservice.api.repository.agencytopic;

import de.caritas.cob.agencyservice.api.model.TopicDTO;
import javax.persistence.Transient;
import lombok.Data;

// TODO Patric implement
@Data
public class AgencyTopic {

  private Integer agencyId;

  private Long topicId;

  @Transient
  TopicDTO topicData;
}
