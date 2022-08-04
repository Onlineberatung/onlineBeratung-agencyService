package de.caritas.cob.agencyservice.api.admin.service.agency;

import static de.caritas.cob.agencyservice.api.repository.agency.Agency.SEARCH_ANALYZER;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import javax.persistence.EntityManagerFactory;
import lombok.NonNull;
import org.apache.lucene.queryparser.classic.QueryParserBase;
import org.apache.lucene.search.Query;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
@ConditionalOnExpression("${multitenancy.enabled:true}")
public class AgencyAdminSearchTenantSupportService extends AgencyAdminSearchService {

  public AgencyAdminSearchTenantSupportService(
      @NonNull EntityManagerFactory entityManagerFactory) {
    super(entityManagerFactory);
  }

  @Override
  protected Query buildUnfilteredQuery(FullTextEntityManager fullTextEntityManager) {
    return fullTextEntityManager.getSearchFactory()
        .buildQueryBuilder()
        .forEntity(Agency.class)
        .get().keyword().onField(TENANT_ID_SEARCH_FIELD)
        .matching(TenantContext.getCurrentTenant()).createQuery();
  }

  @Override
  protected Query buildFullTextSearchQuery(String keyword, FullTextEntityManager entityManager) {
    var queryBuilder = entityManager.getSearchFactory()
        .buildQueryBuilder()
        .forEntity(Agency.class)
        .get();

    return entityManager.getSearchFactory()
        .buildQueryBuilder()
        .forEntity(Agency.class)
        .overridesForField(NAME_SEARCH_FIELD, SEARCH_ANALYZER)
        .overridesForField(POST_CODE_SEARCH_FIELD, SEARCH_ANALYZER)
        .overridesForField(CITY_SEARCH_FIELD, SEARCH_ANALYZER)
        .get()
        .bool()
        .must(queryBuilder.keyword().onField(TENANT_ID_SEARCH_FIELD)
            .matching(TenantContext.getCurrentTenant()).createQuery())
        .must(queryBuilder.keyword()
            .onField(DIOCESE_ID_SEARCH_FIELD).boostedTo(100)
            .andField(NAME_SEARCH_FIELD)
            .andField(POST_CODE_SEARCH_FIELD)
            .andField(CITY_SEARCH_FIELD)
            .matching(QueryParserBase.escape(keyword))
            .createQuery()).createQuery();
  }

}
