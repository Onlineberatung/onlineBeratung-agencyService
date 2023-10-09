package de.caritas.cob.agencyservice.api.repository.diocese;

import java.time.LocalDateTime;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

/**
 * Diocese entity.
 */
@Entity
@Table(name = "diocese")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Diocese {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE)
  @Column(name = "id", updatable = false, nullable = false)
  private Long dioceseId;

  @NonNull
  @Size(max = 100)
  @Column(name = "name", nullable = false)
  private String name;

  @Column(name = "create_date")
  private LocalDateTime createDate;

  @Column(name = "update_date")
  private LocalDateTime updateDate;

}
