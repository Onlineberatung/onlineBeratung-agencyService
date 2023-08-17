package de.caritas.cob.agencyservice.api.tenant;

import de.caritas.cob.agencyservice.api.repository.TenantUnaware;
import java.lang.annotation.Annotation;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.hibernate.Filter;
import org.hibernate.Session;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.stereotype.Component;

@Aspect
@Component
@RequiredArgsConstructor
@ConditionalOnExpression("${multitenancy.enabled:true}")
public class TenantAspect {

  private static final Long TECHNICAL_TENANT_ID = 0L;

  @PersistenceContext
  public EntityManager entityManager;

  @Before("execution(* de.caritas.cob.agencyservice.api.repository..*(..)))")
  public void beforeQueryAspect(JoinPoint joinPoint) {
    Annotation annotation = joinPoint.getSignature().getDeclaringType()
        .getAnnotation(TenantUnaware.class);
    if (annotation != null) {
      return;
    }

    if (TECHNICAL_TENANT_ID.equals(TenantContext.getCurrentTenant())) {
      return;
    }

    Filter filter = entityManager.unwrap(Session.class)
        .enableFilter("tenantFilter");
    filter.setParameter("tenantId", TenantContext.getCurrentTenant());
    filter.validate();
  }
}
