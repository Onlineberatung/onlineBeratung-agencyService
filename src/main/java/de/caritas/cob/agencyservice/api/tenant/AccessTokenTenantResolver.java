package de.caritas.cob.agencyservice.api.tenant;

import de.caritas.cob.agencyservice.api.service.TenantService;
import de.caritas.cob.agencyservice.filter.SubdomainExtractor;
import java.util.Map;
import java.util.Optional;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;


@AllArgsConstructor
@Component
@Slf4j
public class AccessTokenTenantResolver implements TenantResolver {

  private static final String TENANT_ID = "tenantId";

  @Override
  public Optional<Long> resolve(HttpServletRequest request) {
    return resolveTenantIdFromTokenClaims();
  }

  private Optional<Long> resolveTenantIdFromTokenClaims() {
    Map<String, Object> claimMap = getClaimMap();
    log.debug("Found tenantId in claim : " + claimMap.toString());
    return getUserTenantIdAttribute(claimMap);
  }

  private Optional<Long> getUserTenantIdAttribute(Map<String, Object> claimMap) {
    if (claimMap.containsKey(TENANT_ID)) {
      Object tenantIdObject = claimMap.get(TENANT_ID);
      if (tenantIdObject instanceof Long tenantId) {
        return Optional.of(tenantId);
      }
      if (tenantIdObject instanceof Integer tenantId) {
        return Optional.of(Long.valueOf(tenantId));
      }
    }
    return Optional.empty();
  }

  private Map<String, Object> getClaimMap() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication != null) {
      var jwt = (Jwt) authentication.getPrincipal();
      return jwt.getClaims();
    } else {
      return Map.of();
    }
  }


  @Override
  public boolean canResolve(HttpServletRequest request) {
    return resolve(request).isPresent();
  }


}
