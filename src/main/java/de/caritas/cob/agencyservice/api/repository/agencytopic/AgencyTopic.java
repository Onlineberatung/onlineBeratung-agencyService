package de.caritas.cob.agencyservice.api.repository.agencytopic;

import de.caritas.cob.agencyservice.api.model.TopicDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import java.time.LocalDateTime;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "agency_topic")
@AllArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
@Builder
public class AgencyTopic {

  @Id
  @SequenceGenerator(name = "id_seq", allocationSize = 1, sequenceName = "sequence_agency_topic")
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
  @Column(name = "id", updatable = false, nullable = false)
  private Long id;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "agency_id", nullable = false)
  private Agency agency;

  @Column(name = "topic_id")
  private Long topicId;

  @Column(name = "create_date")
  private LocalDateTime createDate;

  @Column(name = "update_date")
  private LocalDateTime updateDate;

  @Transient TopicDTO topicData = new TopicDTO();
}
