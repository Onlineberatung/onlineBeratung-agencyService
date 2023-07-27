package de.caritas.cob.agencyservice.api.repository.agency;

import de.caritas.cob.agencyservice.api.repository.TenantAware;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import de.caritas.cob.agencyservice.api.repository.agencytopic.AgencyTopic;
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
import org.apache.lucene.analysis.core.LowerCaseFilterFactory;
import org.apache.lucene.analysis.miscellaneous.ASCIIFoldingFilterFactory;
import org.apache.lucene.analysis.ngram.EdgeNGramFilterFactory;
import org.apache.lucene.analysis.standard.StandardTokenizerFactory;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Normalizer;
import org.hibernate.search.annotations.SortableField;
import org.hibernate.type.NumericBooleanConverter;

@Entity
@Table(name = "agency")
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Indexed
@Builder
@FilterDef(
    name = "tenantFilter",
    parameters = {@ParamDef(name = "tenantId", type = Long.class)})
@Filter(name = "tenantFilter", condition = "tenant_id = :tenantId")
//@AnalyzerDef(
//    name = Agency.SEARCH_ANALYZER,
//    tokenizer = @TokenizerDef(factory = StandardTokenizerFactory.class),
//    filters = {
//      @TokenFilterDef(factory = ASCIIFoldingFilterFactory.class),
//      @TokenFilterDef(factory = LowerCaseFilterFactory.class),
//      @TokenFilterDef(
//          factory = EdgeNGramFilterFactory.class,
//          params = {
//            @Parameter(name = "minGramSize", value = "1"),
//            @Parameter(name = "maxGramSize", value = "35")
//          })
//    })
public class Agency implements TenantAware {

  public static final String SEARCH_ANALYZER = "keyword";

  @Id
  @SequenceGenerator(name = "id_seq", allocationSize = 1, sequenceName = "sequence_agency")
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
  @Column(name = "id", updatable = false, nullable = false)
  private Long id;

  @Column(name = "diocese_id", nullable = false)
  @Field(analyze = Analyze.NO)
  //@FieldBridge(impl = LongBridge.class)
  private Long dioceseId;

  @NonNull
  @Size(max = 100)
  @Column(name = "name", nullable = false)
  @Field(normalizer = @Normalizer(definition = "keyword"))
  @SortableField
  private String name;

  @Column(name = "description")
  @Field(analyze = Analyze.NO)
  @SortableField
  private String description;

  @Size(max = 5)
  @Column(name = "postcode")
  @Field(normalizer = @Normalizer(definition = "keyword"))
  @SortableField
  private String postCode;

  @Transient
  @SortableField
  @Field(analyze = Analyze.NO)
  private Integer getPostCodeInteger() {
    return Integer.valueOf(postCode);
  }

  @Size(max = 100)
  @Column(name = "city")
  @Field(normalizer = @Normalizer(definition = "keyword"))
  @SortableField
  private String city;

  @Column(name = "is_team_agency", nullable = false)
  @Convert(converter = NumericBooleanConverter.class)
  @SortableField
  private boolean teamAgency;

  @PositiveOrZero
  @Column(name = "consulting_type", nullable = false)
  @NonNull
  private Integer consultingTypeId;

  @Column(name = "is_offline", nullable = false)
  @Convert(converter = NumericBooleanConverter.class)
  @SortableField
  @Field(analyze = Analyze.NO)
  private boolean offline;

  @Size(max = 500)
  @Column(name = "url")
  @Field
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
  @Field
  private Long tenantId;

  @Column(name = "counselling_relations")
  @Field
  private String counsellingRelations;

  @Transient
  public boolean hasAnyDemographicsAttributes() {
    return getAgeTo() != null || getAgeFrom() != null || getGenders() != null;
  }
}
