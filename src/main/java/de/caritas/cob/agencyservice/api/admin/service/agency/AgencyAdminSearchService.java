package de.caritas.cob.agencyservice.api.admin.service.agency;

import static io.micrometer.common.util.StringUtils.isBlank;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.admin.hallink.SearchResultLinkBuilder;
import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.util.AuthenticatedUser;
import de.caritas.cob.agencyservice.api.model.AgencyAdminSearchResultDTO;
import de.caritas.cob.agencyservice.api.model.SearchResultLinks;
import de.caritas.cob.agencyservice.api.model.Sort;
import de.caritas.cob.agencyservice.api.model.Sort.OrderEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;

import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Expression;
import jakarta.persistence.criteria.Order;
import jakarta.persistence.criteria.Path;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import java.util.Collection;
import java.util.List;
import java.util.regex.Pattern;

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
  protected static final String TENANT_ID_SEARCH_FIELD = "tenantId";
  protected final @NonNull EntityManagerFactory entityManagerFactory;

  protected final @NonNull AuthenticatedUser authenticatedUser;

  protected final @NonNull UserAdminService userAdminService;

  @Autowired(required = false)
  private AgencyTopicEnrichmentService agencyTopicEnrichmentService;

  private AgencyRepository agencyRepository;

  @Value("${feature.topics.enabled}")
  private boolean topicsFeatureEnabled;

  /**
   * Searches for agencies by a given keyword, limits the result by perPage and generates a
   * {@link AgencyAdminSearchResultDTO} containing hal links.
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
        .sortField(sort != null && sort.getField() != null ? sort.getField().getValue() : null)
        .ascending(
            sort != null && sort.getOrder() != null ? sort.getOrder().equals(OrderEnum.ASC) : true)
        .build();

    try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
      queryResult = isBlank(keyword) || hasOnlySpecialCharacters(keyword)
          ? searchAgenciesWithoutKeywordFilter(entityManager, agencyAdminSearch)
          : searchAgenciesByKeyword(entityManager, agencyAdminSearch);
    } catch (Exception ex) {
      log.error("Could not create entity manager", ex);
    }

    var resultStream = queryResult.getResult().stream();
    if (topicsFeatureEnabled) {
      resultStream = resultStream.map(agencyTopicEnrichmentService::enrichAgencyWithTopics);
    }

    var resultList = resultStream
        .map(AgencyAdminFullResponseDTOBuilder::new)
        .map(AgencyAdminFullResponseDTOBuilder::fromAgency)
        .toList();

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

  public SearchResult<Agency> searchAgenciesByKeyword(EntityManager entityManager,
      AgencyAdminSearch agencyAdminSearch) {
    CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

    CriteriaQuery<Agency> criteriaQuery = criteriaBuilder.createQuery(Agency.class);
    Root<Agency> root = criteriaQuery.from(Agency.class);
    root.alias("agency");
    root.fetch("agencyTopics", jakarta.persistence.criteria.JoinType.LEFT);

    Predicate[] searchAgenciesWithKeywordFilterPredicate = createSearchAgenciesWithKeywordFilterPredicate(
        agencyAdminSearch, criteriaBuilder, root);

    criteriaQuery.where(searchAgenciesWithKeywordFilterPredicate);

    var agencies = applySortingAndPagination(entityManager, agencyAdminSearch,
        criteriaBuilder, criteriaQuery, root);

    CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
    Root<Agency> countRoot = countQuery.from(Agency.class);
    countQuery.select(criteriaBuilder.count(countRoot)).where(
        createSearchAgenciesWithKeywordFilterPredicate(
            agencyAdminSearch, criteriaBuilder, countRoot));
    Long totalResultSize = entityManager.createQuery(countQuery).getSingleResult();
    return new SearchResult<>(agencies, totalResultSize);
  }

  protected Predicate[] createSearchAgenciesWithKeywordFilterPredicate(
      AgencyAdminSearch agencyAdminSearch, CriteriaBuilder criteriaBuilder,
      Root<Agency> root) {
    return new Predicate[]{
        keywordSearchPredicate(agencyAdminSearch.getKeyword(), criteriaBuilder, root),
        agencyAdminFilterPredicate(criteriaBuilder, root)};
  }

  public SearchResult<Agency> searchAgenciesWithoutKeywordFilter(EntityManager entityManager,
      AgencyAdminSearch agencyAdminSearch) {
    CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
    CriteriaQuery<Agency> criteriaQuery = criteriaBuilder.createQuery(Agency.class);
    Root<Agency> root = criteriaQuery.from(Agency.class);
    root.alias("agency");
    root.fetch("agencyTopics", jakarta.persistence.criteria.JoinType.LEFT);

    criteriaQuery.where(agenciesWithoutKeywordFilterPredicates(criteriaBuilder, root));

    var agencies = applySortingAndPagination(entityManager, agencyAdminSearch,
        criteriaBuilder, criteriaQuery, root);

    CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
    Root<Agency> countRoot = countQuery.from(Agency.class);
    countQuery.select(criteriaBuilder.count(countRoot)).where(
        agenciesWithoutKeywordFilterPredicates(criteriaBuilder, countRoot));
    Long totalResultSize = entityManager.createQuery(countQuery).getSingleResult();
    return new SearchResult<>(agencies, totalResultSize);
  }

  protected Predicate[] agenciesWithoutKeywordFilterPredicates(CriteriaBuilder criteriaBuilder,
      Root<Agency> root) {
    return new Predicate[]{agencyAdminFilterPredicate(criteriaBuilder, root)};
  }

  Predicate agencyAdminFilterPredicate(CriteriaBuilder criteriaBuilder, Root<Agency> root) {
    if (authenticatedUser.hasRestrictedAgencyPriviliges()) {
      var adminAgencyIds = userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId());
      if (!adminAgencyIds.isEmpty()) {
        return createPredicateForAgencyAdmin(criteriaBuilder, root, adminAgencyIds);
      } else {
        return alwaysFalsePredicate(criteriaBuilder);
      }
    } else {
      return alwaysTruePredicate(criteriaBuilder);
    }
  }

  private Predicate alwaysFalsePredicate(CriteriaBuilder criteriaBuilder) {
    return criteriaBuilder.equal(criteriaBuilder.literal(1), criteriaBuilder.literal(2));
  }

  private Predicate alwaysTruePredicate(CriteriaBuilder criteriaBuilder) {
    return criteriaBuilder.conjunction();
  }


  protected Predicate createPredicateForAgencyAdmin(CriteriaBuilder criteriaBuilder,
      Root<Agency> root, Collection<Long> adminAgencyIds) {
    return criteriaBuilder.and(root.get("id").in(adminAgencyIds));
  }

  private List<Agency> applySortingAndPagination(EntityManager entityManager,
      AgencyAdminSearch agencyAdminSearch,
      CriteriaBuilder criteriaBuilder, CriteriaQuery<Agency> criteriaQuery, Root<Agency> root) {
    // Sorting
    if (agencyAdminSearch.getSortField() != null && !agencyAdminSearch.getSortField().isEmpty()) {
      Path<String> expression = root.get(agencyAdminSearch.getSortField());
      Class<?> javaType = expression.getJavaType();
      addOrderBy(agencyAdminSearch, criteriaBuilder, criteriaQuery, expression, javaType);
    }

    // Pagination
    int firstResult = agencyAdminSearch.getPageNumber() == 0 ? 0
        : (agencyAdminSearch.getPageNumber() - 1) * agencyAdminSearch.getPageSize();
    return agencyAdminSearch.getPageSize() == 0 ? Lists.newArrayList()
        : entityManager.createQuery(criteriaQuery)
            .setFirstResult(firstResult)
            .setMaxResults(agencyAdminSearch.getPageSize())
            .getResultList();
  }

  private void addOrderBy(AgencyAdminSearch agencyAdminSearch,
      CriteriaBuilder criteriaBuilder, CriteriaQuery<Agency> criteriaQuery, Path<String> expression,
      Class<?> javaType) {
    if (String.class.equals(javaType)) {
      Expression<String> toLower = criteriaBuilder.lower(
          expression);
      Order order =
          agencyAdminSearch.isAscending() ? criteriaBuilder.asc(toLower) : criteriaBuilder.desc(
              toLower);
      criteriaQuery.orderBy(order);
    } else {
      Order order =
          agencyAdminSearch.isAscending() ? criteriaBuilder.asc(expression) : criteriaBuilder.desc(
              expression);
      criteriaQuery.orderBy(order);
    }
  }

  protected Predicate keywordSearchPredicate(String keyword, CriteriaBuilder criteriaBuilder,
      Root<Agency> root) {
    return criteriaBuilder.or(
        criteriaBuilder.like(criteriaBuilder.lower(root.get(NAME_SEARCH_FIELD)),
            "%" + keyword.toLowerCase() + "%"),
        criteriaBuilder.like(
            criteriaBuilder.lower(root.get(POST_CODE_SEARCH_FIELD)),
            "%" + keyword.toLowerCase() + "%"),
        criteriaBuilder.like(criteriaBuilder.lower(root.get(CITY_SEARCH_FIELD)),
            "%" + keyword.toLowerCase() + "%")
    );
  }

  private boolean hasOnlySpecialCharacters(String str) {
    return ONLY_SPECIAL_CHARS.matcher(str).matches();
  }

}
