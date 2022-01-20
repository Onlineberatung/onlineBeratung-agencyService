package de.caritas.cob.agencyservice.api.service;

import de.caritas.cob.agencyservice.api.repository.TenantSupport;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import java.util.Iterator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.EmptyInterceptor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class TenantHibernateInterceptor extends EmptyInterceptor {

  @Override
  public void preFlush(Iterator entities) {
    Object entity;
    while (entities.hasNext()) {
      entity = entities.next();
      if (entity instanceof TenantSupport) {
        ((TenantSupport) entity).setTenantId(TenantContext.getCurrentTenant());
      }
    }

    super.preFlush(entities);
  }
}
