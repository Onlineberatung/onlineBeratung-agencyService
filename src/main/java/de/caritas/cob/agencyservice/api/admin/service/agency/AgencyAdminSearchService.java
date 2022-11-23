package de.caritas.cob.agencyservice.api.admin.service.agency;

import static de.caritas.cob.agencyservice.api.repository.agency.Agency.SEARCH_ANALYZER;
import static java.util.Objects.nonNull;
import static org.apache.commons.lang3.StringUtils.isBlank;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.admin.hallink.SearchResultLinkBuilder;
import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.helper.AuthenticatedUser;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyAdminSearchResultDTO;
import de.caritas.cob.agencyservice.api.model.SearchResultLinks;
import de.caritas.cob.agencyservice.api.model.Sort;
import de.caritas.cob.agencyservice.api.model.Sort.OrderEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;

import java.util.Collection;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.persistence.EntityManagerFactory;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.apache.lucene.queryparser.classic.QueryParserBase;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.SortField;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.FullTextQuery;
import org.hibernate.search.jpa.Search;
import org.hibernate.search.query.dsl.BooleanJunction;
import org.hibernate.search.query.dsl.MustJunction;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AgencyAdminSearchService {

  protected static final Pattern ONLY_SPECIAL_CHARS = Pattern.compile("[^a-zA-Z0-9]+");
  protected static final String NAME_SEARCH_FIELD = "name";
  protected static final String POST_CODE_SEARCH_FIELD = "postCode";
  protected static final String CITY_SEARCH_FIELD = "city";
  protected static final String DIOCESE_ID_SEARCH_FIELD = "dioceseId";
  protected static final String TENANT_ID_SEARCH_FIELD = "tenantId";

  protected final @NonNull EntityManagerFactory entityManagerFactory;

  protected final @NonNull  AuthenticatedUser authenticatedUser;

  protected final @NonNull UserAdminService userAdminService;

  @Autowired(required = false)
  private AgencyTopicEnrichmentService agencyTopicEnrichmentService;


  @Value("${feature.topics.enabled}")
  private boolean topicsFeatureEnabled;

  /**
   * Searches for agencies by a given keyword, limits the result by perPage and generates a {@link
   * AgencyAdminSearchResultDTO} containing hal links.
   *
   * @param keyword the keyword to search for
   * @param page    the current requested page
   * @param perPage the amount of items in one page
   * @return the result list
   */
  public AgencyAdminSearchResultDTO searchAgencies(final String keyword, final Integer page,
      final Integer perPage, Sort sort) {
    FullTextEntityManager fullTextEntityManager = Search
        .getFullTextEntityManager(entityManagerFactory.createEntityManager());

    Query query = isBlank(keyword) || hasOnlySpecialCharacters(keyword)
        ? buildSearchQuery(fullTextEntityManager)
        : buildKeywordSearchQuery(keyword, fullTextEntityManager);

    FullTextQuery fullTextQuery = fullTextEntityManager.createFullTextQuery(query, Agency.class);

    fullTextQuery.setMaxResults(Math.max(perPage, 0));
    fullTextQuery.setFirstResult(Math.max((page - 1) * perPage, 0));
    fullTextQuery.setSort(buildSort(sort));

    @SuppressWarnings("unchecked")
    Stream<Agency> resultStream = fullTextQuery.getResultStream();

    if (topicsFeatureEnabled) {
      resultStream = resultStream.map(agencyTopicEnrichmentService::enrichAgencyWithTopics);
    }

    var resultList = resultStream
        .map(AgencyAdminFullResponseDTOBuilder::new)
        .map(AgencyAdminFullResponseDTOBuilder::fromAgency)
        .collect(Collectors.toList());

    SearchResultLinks searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withPage(page)
        .withPerPage(perPage)
        .withTotalResults(fullTextQuery.getResultSize())
        .withKeyword(keyword)
        .buildSearchResultLinks();

    fullTextEntityManager.close();

    return new AgencyAdminSearchResultDTO()
        .embedded(resultList)
        .links(searchResultLinks)
        .total(fullTextQuery.getResultSize());
  }

  @NonNull
  private List<AgencyAdminFullResponseDTO> getFilteredResultListByAgenciesAllowedForTheUser(List<AgencyAdminFullResponseDTO> resultList) {
    var adminAgencies = userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId());
    List<AgencyAdminFullResponseDTO> filteredResultList = resultList.stream().filter(agency -> adminAgencies.contains(agency.getEmbedded().getId())).collect(Collectors.toList());
    return filteredResultList;
  }

  protected Query buildSearchQuery(FullTextEntityManager fullTextEntityManager) {
    QueryBuilder queryBuilder = fullTextEntityManager.getSearchFactory()
            .buildQueryBuilder()
            .forEntity(Agency.class)
            .get();

    if (authenticatedUser.hasRestrictedAgencyPriviliges()) {
      var adminAgencyIds = userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId());

      return buildSearchQueryForAgencyAdmin(queryBuilder, adminAgencyIds);

    }

    return queryBuilder
              .all()
              .createQuery();
  }

  protected Query buildSearchQueryForAgencyAdmin(QueryBuilder queryBuilder, Collection<Long> adminAgencyIds) {
    BooleanJunction<BooleanJunction> bool = queryBuilder.bool();
    adminAgencyIds.stream().forEach(id -> bool.should(queryBuilder.keyword().onField("id").matching(id).createQuery()));
    return bool.createQuery();
  }

  protected Query buildSearchQueryForAgencyAdmin(MustJunction mustJunction, QueryBuilder queryBuilder, Collection<Long> adminAgencyIds) {
    adminAgencyIds.stream().forEach(id -> mustJunction.should(queryBuilder.keyword().onField("id").matching(id).createQuery()));
    return mustJunction.createQuery();
  }

  protected Query buildKeywordSearchQuery(String keyword, FullTextEntityManager entityManager) {
    QueryBuilder queryBuilder = entityManager.getSearchFactory()
            .buildQueryBuilder()
            .forEntity(Agency.class)
            .overridesForField(NAME_SEARCH_FIELD, SEARCH_ANALYZER)
            .overridesForField(POST_CODE_SEARCH_FIELD, SEARCH_ANALYZER)
            .overridesForField(CITY_SEARCH_FIELD, SEARCH_ANALYZER)
            .get();

    MustJunction must = queryBuilder
            .bool()
            .must(
                    queryBuilder.keyword()
                            .onField(DIOCESE_ID_SEARCH_FIELD).boostedTo(100)
                            .andField(NAME_SEARCH_FIELD)
                            .andField(POST_CODE_SEARCH_FIELD)
                            .andField(CITY_SEARCH_FIELD)
                            .matching(QueryParserBase.escape(keyword))
                            .createQuery()
            );

    if (authenticatedUser.hasRestrictedAgencyPriviliges()) {
      var adminAgencyIds = userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId());
      if (!adminAgencyIds.isEmpty()) {
        return buildSearchQueryForAgencyAdmin(must, queryBuilder, adminAgencyIds);
      }
    }

    return must
            .createQuery();
  }

  private boolean hasOnlySpecialCharacters(String str) {
    return ONLY_SPECIAL_CHARS.matcher(str).matches();
  }

  private org.apache.lucene.search.Sort buildSort(Sort sort) {
    var luceneSort = new org.apache.lucene.search.Sort();
    if (nonNull(sort) && nonNull(sort.getField())) {
      var reverse = OrderEnum.DESC.equals(sort.getOrder());
      luceneSort.setSort(SortField.FIELD_SCORE,
          new SortField(sort.getField().getValue(), SortField.Type.STRING, reverse));
    }

    return luceneSort;
  }
}
