package de.caritas.cob.agencyservice.config;

import static de.caritas.cob.agencyservice.api.repository.agency.FederalState.findByShortcut;
import static java.util.Objects.isNull;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import de.caritas.cob.agencyservice.api.exception.KeycloakException;
import de.caritas.cob.agencyservice.api.helper.AuthenticatedUser;
import de.caritas.cob.agencyservice.api.repository.agency.FederalState;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.keycloak.KeycloakSecurityContext;
import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * Configuration for the {@link AuthenticatedUser}.
 */
@Configuration
@Slf4j
public class AuthenticatedUserConfig {

  private static final String CLAIM_NAME_USER_ID = "userId";
  private static final String CLAIM_NAME_USERNAME = "username";
  private static final String CLAIM_NAME_STATES = "states";

  /**
   * Returns the @KeycloakAuthenticationToken which represents the token for a Keycloak
   * authentication.
   *
   * @return KeycloakAuthenticationToken
   */
  @Bean
  @Scope(scopeName = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
  public KeycloakAuthenticationToken getAccessToken() {
    return (KeycloakAuthenticationToken) getRequest().getUserPrincipal();
  }

  /**
   * Returns the @KeycloakSecurityContext.
   *
   * @return KeycloakSecurityContext
   */
  @Bean
  @Scope(scopeName = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
  public KeycloakSecurityContext getKeycloakSecurityContext() {
    return ((KeycloakAuthenticationToken) getRequest().getUserPrincipal())
        .getAccount().getKeycloakSecurityContext();
  }

  /**
   * Returns the currently authenticated user.
   *
   * @return {@link AuthenticatedUser}
   */
  @Bean
  @Scope(scopeName = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
  public AuthenticatedUser getAuthenticatedUser() {

    if (getRequest().getUserPrincipal() != null) {
      KeycloakSecurityContext keycloakSecContext =
          ((KeycloakAuthenticationToken) getRequest().getUserPrincipal()).getAccount()
              .getKeycloakSecurityContext();
      Map<String, Object> claimMap = keycloakSecContext.getToken().getOtherClaims();

      AuthenticatedUser authenticatedUser = new AuthenticatedUser();
      authenticatedUser.setAccessToken(getUserAccessToken(keycloakSecContext));
      authenticatedUser.setUserId(getUserAttribute(claimMap, CLAIM_NAME_USER_ID));
      authenticatedUser.setUsername(getUserAttribute(claimMap, CLAIM_NAME_USERNAME));
      authenticatedUser.setRoles(keycloakSecContext.getToken().getRealmAccess().getRoles());
      authenticatedUser.setStates(getFederalStatesAttribute(claimMap));
      return authenticatedUser;
    } else {
      return null;
    }
  }

  Set<FederalState> getFederalStatesAttribute(Map<String, Object> claimMap) {
    if (!claimMap.containsKey(CLAIM_NAME_STATES)) {
      return Sets.newHashSet();
    } else {
      return parseFederalStatesFromToken(claimMap, CLAIM_NAME_STATES);
    }
  }

  private Set<FederalState> parseFederalStatesFromToken(Map<String, Object> claimMap, String claim) {
    String federalStateShortcutsString = claimMap.get(claim).toString();
    log.debug("Parsing the following state values in keycloak token: {}", federalStateShortcutsString);
    List<String> federalStateShortcuts = Splitter.on(",")
        .trimResults()
        .omitEmptyStrings()
        .splitToList(federalStateShortcutsString);
    return federalStateShortcuts.stream()
        .filter(shortcut -> findByShortcut(shortcut).isPresent())
        .map(shortcut -> findByShortcut(shortcut).orElseThrow()).collect(
            Collectors.toSet());
  }

  private String getUserAccessToken(KeycloakSecurityContext keycloakSecContext) {
    if (isNull(keycloakSecContext.getTokenString())) {
      throw new KeycloakException("No valid Keycloak access token string found.");
    }
    return keycloakSecContext.getTokenString();
  }

  private String getUserAttribute(Map<String, Object> claimMap, String claimValue) {
    if (!claimMap.containsKey(claimValue)) {
      throw new KeycloakException("Keycloak user attribute '" + claimValue + "' not found.");
    }
    return claimMap.get(claimValue).toString();
  }

  HttpServletRequest getRequest() {
    return ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
        .getRequest();
  }
}
