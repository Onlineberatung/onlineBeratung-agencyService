package de.caritas.cob.agencyservice.api.repository.agency;

import de.caritas.cob.agencyservice.api.repository.TenantAware;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import de.caritas.cob.agencyservice.api.repository.agencytopic.AgencyTopic;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;
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
import org.hibernate.annotations.Type;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.AnalyzerDef;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.FieldBridge;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Parameter;
import org.hibernate.search.annotations.SortableField;
import org.hibernate.search.annotations.TokenFilterDef;
import org.hibernate.search.annotations.TokenizerDef;
import org.hibernate.search.bridge.builtin.LongBridge;

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
    parameters = {@ParamDef(name = "tenantId", type = "long")})
@Filter(name = "tenantFilter", condition = "tenant_id = :tenantId")
@AnalyzerDef(
    name = Agency.SEARCH_ANALYZER,
    tokenizer = @TokenizerDef(factory = StandardTokenizerFactory.class),
    filters = {
      @TokenFilterDef(factory = ASCIIFoldingFilterFactory.class),
      @TokenFilterDef(factory = LowerCaseFilterFactory.class),
      @TokenFilterDef(
          factory = EdgeNGramFilterFactory.class,
          params = {
            @Parameter(name = "minGramSize", value = "1"),
            @Parameter(name = "maxGramSize", value = "35")
          })
    })
public class Agency implements TenantAware {

  public static final String SEARCH_ANALYZER = "searchAnalyzer";

  @Id
  @SequenceGenerator(name = "id_seq", allocationSize = 1, sequenceName = "sequence_agency")
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
  @Column(name = "id", updatable = false, nullable = false)
  private Long id;

  @Column(name = "diocese_id", nullable = false)
  @Field
  @FieldBridge(impl = LongBridge.class)
  private Long dioceseId;

  @NonNull
  @Size(max = 100)
  @Column(name = "name", nullable = false)
  @Field
  @Analyzer(definition = SEARCH_ANALYZER)
  @SortableField
  private String name;

  @Column(name = "description")
  @Field
  @SortableField
  private String description;

  @Size(max = 5)
  @Column(name = "postcode")
  @Field
  @Analyzer(definition = SEARCH_ANALYZER)
  @SortableField
  private String postCode;

  @Transient
  @SortableField
  @Field
  private Integer getPostCodeInteger() {
    return Integer.valueOf(postCode);
  }

  @Size(max = 100)
  @Column(name = "city")
  @Field
  @Analyzer(definition = SEARCH_ANALYZER)
  @SortableField
  private String city;

  @Column(name = "is_team_agency", nullable = false)
  @Type(type = "org.hibernate.type.NumericBooleanType")
  @SortableField
  @Field
  private boolean teamAgency;

  @PositiveOrZero
  @Column(name = "consulting_type", nullable = false)
  @NonNull
  private Integer consultingTypeId;

  @Column(name = "is_offline", nullable = false)
  @Type(type = "org.hibernate.type.NumericBooleanType")
  @SortableField
  @Field
  private boolean offline;

  @Size(max = 500)
  @Column(name = "url")
  @Field
  private String url;

  @Column(name = "is_external", nullable = false)
  @Type(type = "org.hibernate.type.NumericBooleanType")
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
