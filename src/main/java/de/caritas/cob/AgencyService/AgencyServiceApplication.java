package de.caritas.cob.AgencyService;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.keycloak.KeycloakSecurityContext;
import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import de.caritas.cob.AgencyService.api.exception.KeycloakException;
import de.caritas.cob.AgencyService.api.helper.AuthenticatedUser;

@SpringBootApplication
public class AgencyServiceApplication {

  private final String claimNameUserId = "userId";
  private final String claimNameUsername = "username";

  public static void main(String[] args) {
    SpringApplication.run(AgencyServiceApplication.class, args);
  }

  /**
   * Returns the @KeycloakAuthenticationToken which represents the token for a Keycloak
   * authentication.
   * 
   * 
   * @return KeycloakAuthenticationToken
   */
  @Bean
  @Scope(scopeName = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
  public KeycloakAuthenticationToken getAccessToken() {
    return (KeycloakAuthenticationToken) getRequest().getUserPrincipal();
  }

  /**
   * Returns the @KeycloakSecurityContext
   * 
   * @return KeycloakSecurityContext
   */
  @Bean
  @Scope(scopeName = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
  public KeycloakSecurityContext getKeycloakSecurityContext() {
    return (KeycloakSecurityContext) ((KeycloakAuthenticationToken) getRequest().getUserPrincipal())
        .getAccount().getKeycloakSecurityContext();
  }

  /**
   * Returns the Keycloak user id of the authenticated user
   * 
   * @return {@link AuthenticatedUser}
   */
  @Bean
  @Scope(scopeName = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
  public AuthenticatedUser getAuthenticatedUser() {

    Map<String, Object> claimMap = ((KeycloakAuthenticationToken) getRequest().getUserPrincipal())
        .getAccount().getKeycloakSecurityContext().getToken().getOtherClaims();

    AuthenticatedUser authenticatedUser = new AuthenticatedUser();

    if (claimMap.containsKey(claimNameUserId)) {
      authenticatedUser.setUserId(claimMap.get(claimNameUserId).toString());
    } else {
      throw new KeycloakException("Keycloak user attribute '" + claimNameUserId + "' not found.");
    }

    if (claimMap.containsKey(claimNameUsername)) {
      authenticatedUser.setUsername(claimMap.get(claimNameUsername).toString());
    }

    return authenticatedUser;
  }

  private HttpServletRequest getRequest() {
    return ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
        .getRequest();
  }
}
