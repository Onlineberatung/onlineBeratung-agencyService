package de.caritas.cob.agencyservice.api.tenant;

import com.google.common.collect.Lists;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.stereotype.Component;

@Component
public class TechnicalUserTenantResolver implements TenantResolver {

  @Override
  public Optional<Long> resolve(HttpServletRequest request) {
    return isTechnicalUserRole() ? Optional.of(0L) : Optional.empty();
  }

  private boolean isTechnicalUserRole() {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication != null) {
      JwtAuthenticationToken jwtAuthenticationToken = (JwtAuthenticationToken) authentication.getPrincipal();
      return getRealmRoles(jwtAuthenticationToken).contains("technical");
    }
    return false;
  }

  private Collection<String> getRealmRoles(JwtAuthenticationToken jwtAuthenticationToken) {

    if (jwtAuthenticationToken != null && jwtAuthenticationToken.getToken() != null) {
      var claims = jwtAuthenticationToken.getToken().getClaims();
      if (claims.containsKey("realm_access")) {
        Map<String, Object> realmAccess = (Map<String, Object>) claims.get("realm_access");
        if (realmAccess.containsKey("roles")) {
          return (List<String>) realmAccess.get("roles");
        }
      }
    }
    return Lists.newArrayList();
  }


  @Override
  public boolean canResolve(HttpServletRequest request) {
    return resolve(request).isPresent();
  }
}
