package de.caritas.cob.agencyservice.filter;

import de.caritas.cob.agencyservice.api.exception.KeycloakException;
import java.io.IOException;
import java.util.Map;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.keycloak.KeycloakSecurityContext;
import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.filter.OncePerRequestFilter;


@Component
@ConditionalOnExpression("${multitenancy.enabled:true}")
public class HttpTenantFilter extends OncePerRequestFilter {

  @Override
  protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
      FilterChain filterChain) throws ServletException, IOException {

    String tenantId = resolveTenantIdFromClaim(request);
    if (tenantId != null) {
      TenantContext.setCurrentTenant(tenantId);
    } else {
      tenantId = resolveTenantFromDomain();
      if (tenantId != null) {
        TenantContext.setCurrentTenant(tenantId);
      } else {
        tenantId = resolveTenantFromUriParam();
        if (tenantId != null) {
          TenantContext.setCurrentTenant(tenantId);
        } else {
          throw new IllegalStateException(
              "Tenant feature enabled but was not able to determine tenant id");
        }
      }
    }

    filterChain.doFilter(request, response);
    TenantContext.clear();
  }


  private String resolveTenantIdFromClaim(HttpServletRequest request) {

    if (request.getUserPrincipal() == null) {
      return null;
    }

    KeycloakSecurityContext keycloakSecContext =
        ((KeycloakAuthenticationToken) request.getUserPrincipal()).getAccount()
            .getKeycloakSecurityContext();
    Map<String, Object> claimMap = keycloakSecContext.getToken().getOtherClaims();
    logger.warn("tenantID" + claimMap.toString());
    return getUserAttribute(claimMap, "tenantId");
  }


  private String getUserAttribute(Map<String, Object> claimMap, String claimValue) {
    if (!claimMap.containsKey(claimValue)) {
      throw new KeycloakException("Keycloak user attribute '" + claimValue + "' not found.");
    }
    return claimMap.get(claimValue).toString();
  }

  private String resolveTenantFromDomain() {
    HttpServletRequest request =
        ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
            .getRequest();
    String domain = request.getRequestURL().toString().replace(request.getRequestURI(), "");
    //TODO: based on domain call tenant service and retrieve tenant ID
    return null;
  }

  private String resolveTenantFromUriParam() {
    HttpServletRequest request =
        ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
            .getRequest();
    return request.getParameter("tenantId");
  }

}
