package de.caritas.cob.agencyservice.api.repository.agency;

import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import org.hibernate.annotations.Type;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

/**
 * Agency entity
 *
 */

@Entity
@Table(name = "agency")
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Agency {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE)
  @Column(name = "id", updatable = false, nullable = false)
  private Long id;

  @Column(name = "diocese_id", updatable = true, nullable = false)
  private Long dioceseId;

  @NonNull
  @Size(max = 100)
  @Column(name = "name", updatable = true, nullable = false)
  private String name;

  @NonNull
  @Column(name = "description", updatable = true, nullable = false)
  private String description;

  @NonNull
  @Size(max = 5)
  @Column(name = "postcode", updatable = true, nullable = false)
  private String postCode;

  @NonNull
  @Size(max = 100)
  @Column(name = "city", updatable = true, nullable = false)
  private String city;

  @Column(name = "is_team_agency", nullable = false)
  @Type(type = "org.hibernate.type.NumericBooleanType")
  private boolean teamAgency;

  @Column(name = "consulting_type", updatable = false, nullable = false)
  @NonNull
  private ConsultingType consultingType;

  @Column(name = "is_offline", nullable = false)
  @Type(type = "org.hibernate.type.NumericBooleanType")
  private boolean offline;

  @Column(name = "delete_date", updatable = true, nullable = true)
  private LocalDateTime deleteDate;

}
