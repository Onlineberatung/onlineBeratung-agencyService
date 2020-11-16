package de.caritas.cob.agencyservice.api.repository.agency;

import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.apache.lucene.analysis.core.LowerCaseFilterFactory;
import org.apache.lucene.analysis.miscellaneous.ASCIIFoldingFilterFactory;
import org.apache.lucene.analysis.ngram.EdgeNGramFilterFactory;
import org.apache.lucene.analysis.standard.StandardTokenizerFactory;
import org.hibernate.annotations.Type;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.AnalyzerDef;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.FieldBridge;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Parameter;
import org.hibernate.search.annotations.TokenFilterDef;
import org.hibernate.search.annotations.TokenizerDef;
import org.hibernate.search.bridge.builtin.LongBridge;

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
@Indexed
@AnalyzerDef(name = Agency.SEARCH_ANALYZER,
    tokenizer = @TokenizerDef(factory = StandardTokenizerFactory.class),
    filters = {
        @TokenFilterDef(factory = ASCIIFoldingFilterFactory.class),
        @TokenFilterDef(factory = LowerCaseFilterFactory.class),
        @TokenFilterDef(
            factory = EdgeNGramFilterFactory.class,
            params = {
                @Parameter(name = "minGramSize", value = "1"),
                @Parameter(name = "maxGramSize", value = "35")
            }
        )
    })
public class Agency {

  public static final String SEARCH_ANALYZER = "searchAnalyzer";

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE)
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
  private String name;

  @NonNull
  @Column(name = "description", nullable = false)
  private String description;

  @NonNull
  @Size(max = 5)
  @Column(name = "postcode", nullable = false)
  @Field
  @Analyzer(definition = SEARCH_ANALYZER)
  private String postCode;

  @NonNull
  @Size(max = 100)
  @Column(name = "city", nullable = false)
  @Field
  @Analyzer(definition = SEARCH_ANALYZER)
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

  @Column(name = "delete_date")
  private LocalDateTime deleteDate;

  @Column(name = "create_date")
  private LocalDateTime createDate;

  @Column(name = "update_date")
  private LocalDateTime updateDate;

  @OneToMany(
      targetEntity = AgencyPostCodeRange.class,
      mappedBy = "agency",
      fetch = FetchType.LAZY
  )
  private List<AgencyPostCodeRange> agencyPostCodeRanges;

}
