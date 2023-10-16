package de.caritas.cob.agencyservice.config;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.exception.KeycloakException;
import de.caritas.cob.agencyservice.api.util.AuthenticatedUser;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import jakarta.servlet.http.HttpServletRequest;
import java.util.stream.Collectors;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * Configuration for the {@link AuthenticatedUser}.
 */
@Configuration
public class AuthenticatedUserConfig {

  private static final String CLAIM_NAME_USER_ID = "userId";
  private static final String CLAIM_NAME_USERNAME = "username";

  /**
   * Returns the currently authenticated user.
   *
   * @return {@link AuthenticatedUser}
   */
  @Bean
  @Scope(scopeName = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
  public AuthenticatedUser getAuthenticatedUser() {

    JwtAuthenticationToken authenticationToken = (JwtAuthenticationToken) getRequest().getUserPrincipal();

    Map<String, Object> claimMap = authenticationToken.getToken().getClaims();
    AuthenticatedUser authenticatedUser = new AuthenticatedUser();
    authenticatedUser.setAccessToken(authenticationToken.getToken().getTokenValue());
    authenticatedUser.setUserId(getUserAttribute(claimMap, CLAIM_NAME_USER_ID));
    authenticatedUser.setUsername(getUserAttribute(claimMap, CLAIM_NAME_USERNAME));
    authenticatedUser.setRoles(extractRealmRoles(authenticationToken.getToken()).stream().collect(
        Collectors.toSet()));
    return authenticatedUser;

  }

  public Collection<String> extractRealmRoles(Jwt jwt) {
    Map<String, Object> realmAccess = (Map<String, Object>) jwt.getClaims().get("realm_access");
    if (realmAccess != null) {
      var roles = (List<String>) realmAccess.get("roles");
      if (roles != null) {
        return roles;
      }
    }
    return Lists.newArrayList();
  }

  private String getUserAttribute(Map<String, Object> claimMap, String claimValue) {
    if (!claimMap.containsKey(claimValue)) {
      throw new KeycloakException("Keycloak user attribute '" + claimValue + "' not found.");
    }
    return claimMap.get(claimValue).toString();
  }

  private HttpServletRequest getRequest() {
    return ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
        .getRequest();
  }
}
