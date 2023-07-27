package de.caritas.cob.agencyservice.api.admin.service.agency;

import static de.caritas.cob.agencyservice.api.repository.agency.Agency.SEARCH_ANALYZER;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.helper.AuthenticatedUser;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import javax.persistence.EntityManagerFactory;
import lombok.NonNull;
import org.apache.lucene.queryparser.classic.QueryParserBase;
import org.apache.lucene.search.Query;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.query.dsl.BooleanJunction;
import org.hibernate.search.query.dsl.MustJunction;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
@ConditionalOnExpression("${multitenancy.enabled:true}")
public class AgencyAdminSearchTenantSupportService extends AgencyAdminSearchService {

  public AgencyAdminSearchTenantSupportService(@NonNull EntityManagerFactory entityManagerFactory, @NonNull AuthenticatedUser authenticatedUser, @NonNull UserAdminService userAdminService) {
    super(entityManagerFactory, authenticatedUser, userAdminService);
  }

  @Override
  protected Query buildSearchQuery(FullTextEntityManager fullTextEntityManager) {
    QueryBuilder queryBuilder = fullTextEntityManager.getSearchFactory()
            .buildQueryBuilder()
            .forEntity(Agency.class)
            .get();

    MustJunction must = queryBuilder.bool().must(queryBuilder.keyword().onField(TENANT_ID_SEARCH_FIELD)
            .matching(TenantContext.getCurrentTenant()).createQuery());

    if (authenticatedUser.hasRestrictedAgencyPriviliges()) {
      var adminAgencyIds = userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId());
      if (!adminAgencyIds.isEmpty()) {
        return buildSearchQueryForAgencyAdmin(must, queryBuilder, adminAgencyIds);
      } else {
        return buildSearchQueryForAgencyAdmin(queryBuilder, Lists.newArrayList(NON_EXISTING_AGENCY_ID));

      }
    }
    return must.createQuery();
  }

  @Override
  protected Query buildKeywordSearchQuery(String keyword, FullTextEntityManager entityManager) {
    var queryBuilder = entityManager.getSearchFactory()
        .buildQueryBuilder()
        .forEntity(Agency.class)
        .get();

    BooleanJunction<BooleanJunction> bool = entityManager.getSearchFactory()
            .buildQueryBuilder()
            .forEntity(Agency.class)
            .overridesForField(NAME_SEARCH_FIELD, SEARCH_ANALYZER)
            .overridesForField(POST_CODE_SEARCH_FIELD, SEARCH_ANALYZER)
            .overridesForField(CITY_SEARCH_FIELD, SEARCH_ANALYZER)
            .get()
            .bool();

    MustJunction must = bool
            .must(queryBuilder.keyword().onField(TENANT_ID_SEARCH_FIELD)
                    .matching(TenantContext.getCurrentTenant()).createQuery())
            .must(queryBuilder.keyword()
                    .onField(DIOCESE_ID_SEARCH_FIELD).boostedTo(100)
                    .andField(NAME_SEARCH_FIELD)
                    .andField(POST_CODE_SEARCH_FIELD)
                    .andField(CITY_SEARCH_FIELD)
                    .matching(QueryParserBase.escape(keyword))
                    .createQuery());

    if (authenticatedUser.hasRestrictedAgencyPriviliges()) {
      var adminAgencyIds = userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId());
      return buildSearchQueryForAgencyAdmin(must, queryBuilder, adminAgencyIds);
    }

    return must.createQuery();
  }

}
