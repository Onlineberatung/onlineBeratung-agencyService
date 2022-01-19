package de.caritas.cob.agencyservice.api.tenant;

import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

import com.google.common.collect.Maps;
import de.caritas.cob.agencyservice.filter.SubdomainExtractor;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import java.util.HashMap;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.keycloak.adapters.springsecurity.token.KeycloakAuthenticationToken;
import org.mockito.Answers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import de.caritas.cob.agencyservice.tenantservice.generated.web.TenantControllerApi;
import org.springframework.security.access.AccessDeniedException;

@ExtendWith(MockitoExtension.class)
class TenantResolverTest {

  @Mock
  SubdomainExtractor subdomainExtractor;

  @Mock
  TenantControllerApi tenantControllerApi;

  @Mock
  HttpServletRequest authenticatedRequest;

  @Mock
  HttpServletRequest nonAuthenticatedRequest;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  KeycloakAuthenticationToken token;

  @InjectMocks
  TenantResolver tenantResolver;

  @Test
  void resolve_Should_ResolveFromAccessTokenForAuthenticatedUser() {
    // given
    when(authenticatedRequest.getUserPrincipal()).thenReturn(token);
    HashMap<String, Object> claimMap = givenClaimMapContainingTenantId("1");
    when(token.getAccount().getKeycloakSecurityContext().getToken().getOtherClaims())
        .thenReturn(claimMap);

    // when
    Long resolvedTenantId = tenantResolver.resolve(authenticatedRequest);

    // then
    assertThat(resolvedTenantId).isEqualTo(1L);
  }

  @Test
  void resolve_Should_ThrowAccessDeniedExceptionForAuthenticatedUser_IfThereIsNoTenantIdClaim() {
    // given
    when(authenticatedRequest.getUserPrincipal()).thenReturn(token);
    when(token.getAccount().getKeycloakSecurityContext().getToken().getOtherClaims())
        .thenReturn(Maps.newHashMap());
    // when, then
    assertThrows(AccessDeniedException.class, () -> tenantResolver.resolve(authenticatedRequest));
  }

  @Test
  void resolve_Should_ThrowAccessDeniedExceptionForNotAuthenticatedUser_IfSubdomainCouldNotBeDetermined() {
    // given
    when(subdomainExtractor.getCurrentSubdomain()).thenReturn(Optional.empty());
    // when, then
    assertThrows(AccessDeniedException.class,
        () -> tenantResolver.resolve(nonAuthenticatedRequest));
  }

  @Test
  void resolve_Should_ResolveTenantId_IfSubdomainCouldBeDetermined() {
    // given
    when(subdomainExtractor.getCurrentSubdomain()).thenReturn(Optional.of("mucoviscidose"));
    when(tenantControllerApi.getRestrictedTenantDataBySubdomain("mucoviscidose")).thenReturn(
        new RestrictedTenantDTO().id(1L));
    // when
    Long resolved = tenantResolver.resolve(nonAuthenticatedRequest);
    // then
    assertThat(resolved).isEqualTo(1L);
  }

  private HashMap<String, Object> givenClaimMapContainingTenantId(String tenantId) {
    HashMap<String, Object> claimMap = Maps.newHashMap();
    claimMap.put("tenantId", tenantId);
    return claimMap;
  }


}