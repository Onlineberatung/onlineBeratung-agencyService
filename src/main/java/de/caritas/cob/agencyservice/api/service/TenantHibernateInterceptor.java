package de.caritas.cob.agencyservice.api.service;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import de.caritas.cob.agencyservice.api.tenant.TenantContext;
import java.io.Serializable;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class TenantHibernateInterceptor extends EmptyInterceptor {

  @Override
  public boolean onSave(Object entity, Serializable id, Object[] state, String[] propertyNames,
      Type[] types) {
    if (entity instanceof Agency) {
      ((Agency) entity).setTenantId(TenantContext.getCurrentTenant());
    }
    if (entity instanceof AgencyPostcodeRange) {
      ((AgencyPostcodeRange) entity).setTenantId(TenantContext.getCurrentTenant());
    }

    return super.onSave(entity, id, state, propertyNames, types);
  }

}
