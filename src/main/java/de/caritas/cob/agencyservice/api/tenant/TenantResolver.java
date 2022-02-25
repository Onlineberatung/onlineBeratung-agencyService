package de.caritas.cob.agencyservice.api.tenant;

import static java.util.Optional.empty;

import de.caritas.cob.agencyservice.filter.SubdomainExtractor;
import de.caritas.cob.agencyservice.tenantservice.generated.web.TenantControllerApi;
import java.util.Map;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.keycloak.KeycloakSecurityContext;
import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;

@Slf4j
@RequiredArgsConstructor
@ConditionalOnExpression("${multitenancy.enabled:true}")
@Component
public class TenantResolver {

  private static final String TENANT_ID = "tenantId";
  private @NonNull SubdomainExtractor subdomainExtractor;
  private @NonNull TenantControllerApi tenantControllerApi;

  public Long resolve(HttpServletRequest request) {
    if (userIsAuthenticated(request)) {
      return resolveForAuthenticatedUser(request);
    } else {
      return resolveForNonAuthenticatedUser();
    }
  }

  private Long resolveForNonAuthenticatedUser() {
    Optional<Long> tenantId = resolveTenantFromSubdomain();
    if (tenantId.isEmpty()) {
      throw new AccessDeniedException("Tenant id could not be resolved");
    }
    return tenantId.get();
  }

  private Long resolveForAuthenticatedUser(HttpServletRequest request) {
    Optional<Long> tenantId = resolveTenantIdFromTokenClaims(request);
    if (tenantId.isPresent()) {
      return tenantId.get();
    }
    throw new AccessDeniedException("Tenant id could not be resolved");
  }

  private Optional<Long> resolveTenantFromSubdomain() {
    Optional<String> currentSubdomain = subdomainExtractor.getCurrentSubdomain();
    if (currentSubdomain.isPresent()) {
      log.info("Resolved subdomain to : " + currentSubdomain.get());
      return Optional.of(getTenantIdBySubdomain(currentSubdomain.get()));
    } else {
      log.info("Resolved empty subdomain");
      return empty();
    }
  }

  private Long getTenantIdBySubdomain(String currentSubdomain) {
    return tenantControllerApi.getRestrictedTenantDataBySubdomain(currentSubdomain).getId();
  }

  private Optional<Long> getUserTenantIdAttribute(Map<String, Object> claimMap) {
    if (claimMap.containsKey(TENANT_ID)) {
      Integer tenantId = (Integer) claimMap.get(TENANT_ID);
      return Optional.of(Long.valueOf(tenantId));
    } else {
      return Optional.empty();
    }
  }

  private Optional<Long> resolveTenantIdFromTokenClaims(HttpServletRequest request) {
    Map<String, Object> claimMap = getClaimMap(request);
    log.debug("Found tenantId in claim : " + claimMap.toString());
    return getUserTenantIdAttribute(claimMap);
  }

  private boolean userIsAuthenticated(HttpServletRequest request) {
    return request.getUserPrincipal() != null;
  }

  private Map<String, Object> getClaimMap(HttpServletRequest request) {
    KeycloakSecurityContext keycloakSecContext =
        ((KeycloakAuthenticationToken) request.getUserPrincipal()).getAccount()
            .getKeycloakSecurityContext();
    return keycloakSecContext.getToken().getOtherClaims();
  }

}
