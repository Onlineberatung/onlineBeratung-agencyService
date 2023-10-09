package de.caritas.cob.agencyservice.api.tenant;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.service.TenantService;
import de.caritas.cob.agencyservice.filter.SubdomainExtractor;
import java.util.Optional;
import jakarta.servlet.http.HttpServletRequest;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class SubdomainTenantResolverTest {

  @Mock
  SubdomainExtractor subdomainExtractor;

  @Mock
  TenantService tenantService;

  @Mock
  HttpServletRequest httpServletRequest;

  @InjectMocks
  SubdomainTenantResolver subdomainTenantResolver;

  @Test
  void resolve_should_resolveTenantId_When_SubdomainCouldBeDetermined() {
    // given
    when(subdomainExtractor.getCurrentSubdomain()).thenReturn(Optional.of("mucoviscidose"));
    when(tenantService.getRestrictedTenantDataBySubdomain("mucoviscidose")).thenReturn(
        new de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO()
            .id(1L));

    // when
    Optional<Long> resolve = subdomainTenantResolver.resolve(httpServletRequest);

    // then
    assertThat(resolve).contains(1L);
  }

  @Test
  void resolve_should_NotResolve_When_SubdomainIsEmpty() {
    // given
    when(subdomainExtractor.getCurrentSubdomain()).thenReturn(Optional.empty());

    // when
    Optional<Long> resolve = subdomainTenantResolver.resolve(httpServletRequest);

    // then
    assertThat(resolve).isEmpty();
  }

}