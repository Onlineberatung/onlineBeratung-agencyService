package de.caritas.cob.agencyservice.api.admin.service.agency;

import static io.micrometer.common.util.StringUtils.isBlank;
import static org.apache.commons.lang3.StringUtils.isNumeric;

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

import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.JoinType;
import jakarta.persistence.criteria.Order;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class AgencyAdminSearchService {

  protected static final Pattern ONLY_SPECIAL_CHARS = Pattern.compile("[^a-zA-Z0-9]+");
  protected static final String NAME_SEARCH_FIELD = "name";
  protected static final String POST_CODE_SEARCH_FIELD = "postCode";
  protected static final String CITY_SEARCH_FIELD = "city";
  protected static final String DIOCESE_ID_SEARCH_FIELD = "dioceseId";
  protected static final String TENANT_ID_SEARCH_FIELD = "tenantId";
  protected static final Long NON_EXISTING_AGENCY_ID = -1L;

  protected final @NonNull EntityManagerFactory entityManagerFactory;

  protected final @NonNull  AuthenticatedUser authenticatedUser;

  protected final @NonNull UserAdminService userAdminService;

  @Autowired(required = false)
  private AgencyTopicEnrichmentService agencyTopicEnrichmentService;

  private AgencyRepository agencyRepository;


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

    SearchResult<Agency> queryResult = new SearchResult<>(Lists.newArrayList(), 0L);

    var agencyAdminSearch = AgencyAdminSearch.builder()
        .keyword(keyword)
        .pageNumber(page)
        .pageSize(perPage)
        .sortField(sort != null ? sort.getField().getValue() : null)
        .ascending(sort != null ? sort.getOrder().equals(OrderEnum.ASC) : true)
        .build();

    try ( EntityManager entityManager = entityManagerFactory.createEntityManager()) {
      queryResult = isBlank(keyword)  || hasOnlySpecialCharacters(keyword) ? searchAgenciesWithoutFilter(entityManager, agencyAdminSearch) : searchAgenciesByKeyword(entityManager, agencyAdminSearch);
    }
    catch (Exception ex) {
      log.error("Count not create entity manager", ex);
    }

    var resultStream = queryResult.getResult().stream();
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
        .withTotalResults(queryResult.getTotalSize().intValue())
        .withKeyword(keyword)
        .buildSearchResultLinks();


    return new AgencyAdminSearchResultDTO()
        .embedded(resultList)
        .links(searchResultLinks)
        .total(queryResult.getTotalSize().intValue());
  }

  public SearchResult<Agency> searchAgenciesByKeyword(EntityManager entityManager, AgencyAdminSearch agencyAdminSearch) {
    CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

    CriteriaQuery<Agency> criteriaQuery = criteriaBuilder.createQuery(Agency.class);
    Root<Agency> root = criteriaQuery.from(Agency.class);
    root.alias("agency");
    root.fetch("agencyTopics", jakarta.persistence.criteria.JoinType.LEFT);

    Predicate predicate = appendKeywordPredicate(agencyAdminSearch.getKeyword(), criteriaBuilder, root);
    criteriaQuery.where(predicate);

    return applySortingAndPagination(entityManager, agencyAdminSearch,
        criteriaBuilder, criteriaQuery, root, predicate);
  }

  public SearchResult<Agency> searchAgenciesWithoutFilter(EntityManager entityManager, AgencyAdminSearch agencyAdminSearch) {
    CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
    CriteriaQuery<Agency> criteriaQuery = criteriaBuilder.createQuery(Agency.class);
    Root<Agency> root = criteriaQuery.from(Agency.class);
    root.alias("agency");
    root.fetch("agencyTopics", jakarta.persistence.criteria.JoinType.LEFT);

    Predicate alwaysTruePredicate = criteriaBuilder.conjunction();
    criteriaQuery.where(alwaysTruePredicate);

    return applySortingAndPagination(entityManager, agencyAdminSearch,
        criteriaBuilder, criteriaQuery, root, alwaysTruePredicate);
  }


  private SearchResult<Agency> applySortingAndPagination(EntityManager entityManager,
      AgencyAdminSearch agencyAdminSearch,
      CriteriaBuilder criteriaBuilder, CriteriaQuery<Agency> criteriaQuery, Root<Agency> root,
      Predicate predicate) {
    // Sorting
    if (agencyAdminSearch.getSortField() != null && !agencyAdminSearch.getSortField().isEmpty()) {
      Order order = agencyAdminSearch.isAscending() ? criteriaBuilder.asc(criteriaBuilder.lower(root.get(agencyAdminSearch.getSortField()))) : criteriaBuilder.desc(
          criteriaBuilder.lower(root.get(agencyAdminSearch.getSortField())));
      criteriaQuery.orderBy(order);
    }

    // Pagination
    int firstResult = agencyAdminSearch.getPageNumber() == 0 ? 0 : (agencyAdminSearch.getPageNumber() - 1) * agencyAdminSearch.getPageSize();
    List<Agency> agencies = entityManager.createQuery(criteriaQuery)
        .setFirstResult(firstResult)
        .setMaxResults(agencyAdminSearch.getPageSize())
        .getResultList();

    CriteriaBuilder criteriaBuilder2 = entityManager.getCriteriaBuilder();
    CriteriaQuery<Long> countQuery = criteriaBuilder2.createQuery(Long.class);
    countQuery.where(predicate);
    countQuery.select(criteriaBuilder2.count(countQuery.from(Agency.class)));
    long totalResultSize = entityManager.createQuery(countQuery).getSingleResult();

    return new SearchResult<>(agencies, totalResultSize);
  }

  private Predicate appendKeywordPredicate(String keyword, CriteriaBuilder criteriaBuilder,
      Root<Agency> root) {
    return criteriaBuilder.or(
        criteriaBuilder.equal(root.get(DIOCESE_ID_SEARCH_FIELD),
            isNumeric(keyword) ? Integer.parseInt(keyword.toLowerCase()) : -1),
        criteriaBuilder.like(criteriaBuilder.lower(root.get(NAME_SEARCH_FIELD)),
            "%" + keyword.toLowerCase() + "%"),
        criteriaBuilder.like(
            criteriaBuilder.lower(root.get(POST_CODE_SEARCH_FIELD)),
            "%" + keyword.toLowerCase() + "%"),
        criteriaBuilder.like(criteriaBuilder.lower(root.get(CITY_SEARCH_FIELD)),
            "%" + keyword.toLowerCase() + "%")
    );
  }

  @NonNull
  private List<AgencyAdminFullResponseDTO> getFilteredResultListByAgenciesAllowedForTheUser(List<AgencyAdminFullResponseDTO> resultList) {
    var adminAgencies = userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId());
    return resultList.stream().filter(agency -> adminAgencies.contains(agency.getEmbedded().getId())).collect(Collectors.toList());
  }

//  protected Query buildSearchQuery(FullTextEntityManager fullTextEntityManager) {
//    QueryBuilder queryBuilder = fullTextEntityManager.getSearchFactory()
//            .buildQueryBuilder()
//            .forEntity(Agency.class)
//            .get();
//
//    if (authenticatedUser.hasRestrictedAgencyPriviliges()) {
//      var adminAgencyIds = userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId());
//      if (!adminAgencyIds.isEmpty()) {
//        return buildSearchQueryForAgencyAdmin(queryBuilder, adminAgencyIds);
//      } else {
//        return buildSearchQueryForAgencyAdmin(queryBuilder, Lists.newArrayList(NON_EXISTING_AGENCY_ID));
//      }
//    }
//
//    return queryBuilder
//              .all()
//              .createQuery();
//  }
//
//  protected Query buildSearchQueryForAgencyAdmin(QueryBuilder queryBuilder, Collection<Long> adminAgencyIds) {
//    BooleanJunction<BooleanJunction> bool = queryBuilder.bool();
//    adminAgencyIds.stream().forEach(id -> bool.should(queryBuilder.keyword().onField("id").matching(id).createQuery()));
//    return bool.createQuery();
//  }
//
//  protected Query buildSearchQueryForAgencyAdmin(MustJunction mustJunction, QueryBuilder queryBuilder, Collection<Long> adminAgencyIds) {
//    BooleanJunction<BooleanJunction> bool = queryBuilder.bool();
//    adminAgencyIds.stream().forEach(id -> bool.should(queryBuilder.keyword().onField("id").matching(id).createQuery()));
//    mustJunction.must(bool.createQuery());
//    return mustJunction.createQuery();
//  }
//
//  protected Query buildKeywordSearchQuery(String keyword, FullTextEntityManager entityManager) {
//    QueryBuilder queryBuilder = entityManager.getSearchFactory()
//            .buildQueryBuilder()
//            .forEntity(Agency.class)
//            .overridesForField(NAME_SEARCH_FIELD, SEARCH_ANALYZER)
//            .overridesForField(POST_CODE_SEARCH_FIELD, SEARCH_ANALYZER)
//            .overridesForField(CITY_SEARCH_FIELD, SEARCH_ANALYZER)
//            .get();
//
//    MustJunction keywordMust = queryBuilder
//            .bool()
//            .must(
//                    queryBuilder.keyword()
//                            .onField(DIOCESE_ID_SEARCH_FIELD).boostedTo(100)
//                            .andField(NAME_SEARCH_FIELD)
//                            .andField(POST_CODE_SEARCH_FIELD)
//                            .andField(CITY_SEARCH_FIELD)
//                            .matching(QueryParserBase.escape(keyword))
//                            .createQuery()
//            );
//
//    if (authenticatedUser.hasRestrictedAgencyPriviliges()) {
//      var adminAgencyIds = userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId());
//      if (!adminAgencyIds.isEmpty()) {
//        return buildSearchQueryForAgencyAdmin(keywordMust, queryBuilder, adminAgencyIds);
//      }
//    }
//
//    return keywordMust
//            .createQuery();
//  }

  private boolean hasOnlySpecialCharacters(String str) {
    return ONLY_SPECIAL_CHARS.matcher(str).matches();
  }

//  private org.apache.lucene.search.Sort buildSort(Sort sort) {
//    var luceneSort = new org.apache.lucene.search.Sort();
//    if (nonNull(sort) && nonNull(sort.getField())) {
//      var reverse = OrderEnum.DESC.equals(sort.getOrder());
//      luceneSort.setSort(getSortField(sort, reverse));
//    }
//    return luceneSort;
//  }

  /**
   * We observed that lucene sort in version 5.5.5 does not sort correctly strings with numeric values only.
   * Although higher version of lucene exists, version 5.5.5 is used by the latest available hibernate search version 5.11.12.Final
   * Therefore a conversion to integer column was required to force proper sort order. y
   **/
//  private SortField getSortField(Sort sort, boolean reverse) {
//    if (Sort.FieldEnum.POSTCODE.getValue().equals(sort.getField().getValue())) {
//      return new SortField("postCodeInteger", SortField.Type.INT, reverse);
//    } else {
//      return new SortField(sort.getField().getValue(), SortField.Type.STRING, reverse);
//    }
//  }
}
