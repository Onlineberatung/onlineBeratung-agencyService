package de.caritas.cob.agencyservice.api.tenant;


import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import java.time.Instant;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import jakarta.servlet.http.HttpServletRequest;
import org.assertj.core.api.AssertionsForClassTypes;
import org.assertj.core.util.Sets;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;
import org.keycloak.representations.AccessToken;
import org.keycloak.representations.AccessToken.Access;
import org.mockito.Answers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;

@ExtendWith(MockitoExtension.class)
class TechnicalUserTenantResolverTest {
  public static final long TECHNICAL_CONTEXT = 0L;
  @Mock
  HttpServletRequest authenticatedRequest;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  KeycloakAuthenticationToken token;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  AccessToken accessToken;

  @Mock
  Access access;

  @Mock
  SecurityContext mockSecurityContext;

  @Mock
  Authentication mockAuthentication;

  @InjectMocks
  TechnicalUserTenantResolver technicalUserTenantResolver;

  @AfterEach
  public void tearDown() {
    SecurityContextHolder.clearContext();
  }

  @Test
  void resolve_should_ResolveTechnicalTenantId_ForTechnicalUserRole() {
    // given
    givenUserIsAuthenticated();
    when(mockAuthentication.getPrincipal()).thenReturn(buildJwtWithRealmRole("technical"));
    var resolved = technicalUserTenantResolver.resolve(authenticatedRequest);
    // then
    assertThat(resolved).contains(TECHNICAL_CONTEXT);
  }

  @Test
  void resolve_should_NotResolveTenantId_When_NonTechnicalUserRole() {
    // given
    givenUserIsAuthenticated();
    when(mockAuthentication.getPrincipal()).thenReturn(buildJwtWithRealmRole("another-role"));
    var resolved = technicalUserTenantResolver.resolve(authenticatedRequest);
    // then
    assertThat(resolved).isEmpty();
  }

  private void givenUserIsAuthenticated() {
    SecurityContextHolder.setContext(mockSecurityContext);
    when(mockSecurityContext.getAuthentication()).thenReturn(mockAuthentication);
  }

  private Jwt buildJwtWithRealmRole(String realmRole) {
    Map<String, Object> headers = new HashMap<>();
    headers.put("alg", "HS256"); // Signature algorithm
    headers.put("typ", "JWT"); // Token type
    return new Jwt(
        "token", Instant.now(), Instant.now(), headers, givenClaimMapContainingRole(realmRole));
  }

  private HashMap<String, Object> givenClaimMapContainingRole(String realmRole) {
    HashMap<String, Object> claimMap = Maps.newHashMap();
    var realmAccess = Maps.newHashMap();
    realmAccess.put("roles", Lists.newArrayList(realmRole));
    claimMap.put("realm_access", realmAccess);
    return claimMap;
  }
}