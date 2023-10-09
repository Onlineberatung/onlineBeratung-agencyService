package de.caritas.cob.agencyservice.api.admin.service.agency;

import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.helper.AuthenticatedUser;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.NonNull;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
@ConditionalOnExpression("${multitenancy.enabled:true}")
public class AgencyAdminSearchTenantSupportService extends AgencyAdminSearchService {

  public AgencyAdminSearchTenantSupportService(
      @NonNull EntityManagerFactory entityManagerFactory,
      @NonNull AuthenticatedUser authenticatedUser, @NonNull UserAdminService userAdminService) {
    super(entityManagerFactory, authenticatedUser, userAdminService);
  }

  @Override
  protected Predicate[] createSearchAgenciesWithKeywordFilterPredicate(
      AgencyAdminSearch agencyAdminSearch, CriteriaBuilder criteriaBuilder,
      Root<Agency> root) {
    return new Predicate[]{
        tenantPredicate(criteriaBuilder, root),
        keywordSearchPredicate(agencyAdminSearch.getKeyword(), criteriaBuilder, root),
        agencyAdminFilterPredicate(criteriaBuilder, root)};
  }

  protected Predicate tenantPredicate(CriteriaBuilder criteriaBuilder,
      Root<Agency> root) {
    return criteriaBuilder.and(
        criteriaBuilder.equal(root.get(TENANT_ID_SEARCH_FIELD),
            TenantContext.getCurrentTenant()));
  }

  @Override
  protected Predicate[] agenciesWithoutKeywordFilterPredicates(CriteriaBuilder criteriaBuilder, Root<Agency> root) {
    return new Predicate[] { agencyAdminFilterPredicate(criteriaBuilder, root), tenantPredicate(criteriaBuilder, root) };
  }

}
