package de.caritas.cob.agencyservice.api.repository.agencypostcoderange;

import de.caritas.cob.agencyservice.api.repository.TenantAware;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import java.time.LocalDateTime;
import java.util.Objects;
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
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;

/**
 * PostCodeRange entity
 */

@Entity
@Table(name = "agency_postcode_range")
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@FilterDef(name = "tenantFilter", parameters = {@ParamDef(name = "tenantId", type = Long.class)})
@Filter(name = "tenantFilter", condition = "tenant_id = :tenantId")
public class AgencyPostcodeRange implements TenantAware {

  @Id
  @SequenceGenerator(name = "id_seq", allocationSize = 1, sequenceName = "sequence_agency_postcode_range")
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
  @Column(name = "id", updatable = false, nullable = false)
  private Long id;

  @NonNull
  @Size(max = 5)
  @Column(name = "postcode_from", nullable = false)
  private String postcodeFrom;

  @NonNull
  @Size(max = 5)
  @Column(name = "postcode_to", nullable = false)
  private String postcodeTo;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "agency_id", nullable = false)
  private Agency agency;

  @Column(name = "create_date")
  private LocalDateTime createDate;

  @Column(name = "update_date")
  private LocalDateTime updateDate;

  @Column(name = "tenant_id")
  private Long tenantId;

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof AgencyPostcodeRange)) {
      return false;
    }
    AgencyPostcodeRange that = (AgencyPostcodeRange) o;
    return postcodeFrom.equals(that.postcodeFrom) && postcodeTo.equals(that.postcodeTo);
  }

  @Override
  public int hashCode() {
    return Objects.hash(postcodeFrom, postcodeTo);
  }
}
