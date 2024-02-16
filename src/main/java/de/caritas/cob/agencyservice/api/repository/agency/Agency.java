package de.caritas.cob.agencyservice.api.repository.agency;

import de.caritas.cob.agencyservice.api.repository.TenantAware;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import de.caritas.cob.agencyservice.api.repository.agencytopic.AgencyTopic;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import java.time.LocalDateTime;
import java.util.List;
import jakarta.persistence.Convert;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.PositiveOrZero;
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


import org.hibernate.type.NumericBooleanConverter;

@Entity
@Table(name = "agency")
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@FilterDef(
    name = "tenantFilter",
    parameters = {@ParamDef(name = "tenantId", type = Long.class)})
@Filter(name = "tenantFilter", condition = "tenant_id = :tenantId")
public class Agency implements TenantAware {

  public static final String SEARCH_ANALYZER = "keyword";

  @Id
  @SequenceGenerator(name = "id_seq", allocationSize = 1, sequenceName = "sequence_agency")
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
  @Column(name = "id", updatable = false, nullable = false)
  private Long id;

  @NonNull
  @Size(max = 100)
  @Column(name = "name", nullable = false)
  private String name;

  @Column(name = "description")
  private String description;

  @Size(max = 5)
  @Column(name = "postcode")
  private String postCode;

  @Transient
  private Integer getPostCodeInteger() {
    return Integer.valueOf(postCode);
  }

  @Size(max = 100)
  @Column(name = "city")
  private String city;

  @Column(name = "is_team_agency", nullable = false)
  @Convert(converter = NumericBooleanConverter.class)
  private boolean teamAgency;

  @PositiveOrZero
  @Column(name = "consulting_type", nullable = false)
  @NonNull
  private Integer consultingTypeId;

  @Column(name = "is_offline", nullable = false)
  @Convert(converter = NumericBooleanConverter.class)

  private boolean offline;

  @Size(max = 500)
  @Column(name = "url")
  private String url;

  @Column(name = "is_external", nullable = false)
  @Convert(converter = NumericBooleanConverter.class)
  private boolean isExternal;

  @PositiveOrZero
  @Column(name = "age_from")
  private Short ageFrom;

  @PositiveOrZero
  @Column(name = "age_to")
  private Short ageTo;

  @Column(name = "genders")
  private String genders;

  @Column(name = "delete_date")
  private LocalDateTime deleteDate;

  @Column(name = "create_date", nullable = false)
  private LocalDateTime createDate;

  @Column(name = "update_date", nullable = false)
  private LocalDateTime updateDate;

  @Column(name = "data_protection_responsible_entity", nullable = false)
  @Enumerated(EnumType.STRING)
  private DataProtectionResponsibleEntity dataProtectionResponsibleEntity;


  @Column(name = "data_protection_officer_contact", nullable = false)
  private String dataProtectionOfficerContactData;

  @Column(name = "data_protection_alternative_contact", nullable = false)
  private String dataProtectionAlternativeContactData;

  @Column(name = "data_protection_agency_contact", nullable = false)
  private String dataProtectionAgencyResponsibleContactData;



  @OneToMany(targetEntity = AgencyPostcodeRange.class, mappedBy = "agency", fetch = FetchType.LAZY)
  private List<AgencyPostcodeRange> agencyPostcodeRanges;

  @OneToMany(
      targetEntity = AgencyTopic.class,
      mappedBy = "agency",
      fetch = FetchType.LAZY,
      cascade = CascadeType.ALL,
      orphanRemoval = true)
  private List<AgencyTopic> agencyTopics;

  @Column(name = "tenant_id")
  private Long tenantId;

  @Column(name = "counselling_relations")
  private String counsellingRelations;

  @Column(name = "agency_logo")
  private String agencyLogo;

  @Transient
  public boolean hasAnyDemographicsAttributes() {
    return getAgeTo() != null || getAgeFrom() != null || getGenders() != null;
  }
}
