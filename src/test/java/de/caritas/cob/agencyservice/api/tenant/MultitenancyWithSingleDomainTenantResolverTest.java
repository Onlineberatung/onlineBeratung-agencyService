package de.caritas.cob.agencyservice.api.tenant;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTO;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTOMainTenantSubdomainForSingleDomainMultitenancy;
import de.caritas.cob.agencyservice.config.apiclient.ApplicationSettingsApiControllerFactory;
import de.caritas.cob.agencyservice.config.apiclient.TenantServiceApiControllerFactory;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import java.util.Optional;
import jakarta.servlet.http.HttpServletRequest;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import de.caritas.cob.agencyservice.tenantservice.generated.web.TenantControllerApi;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.ApplicationsettingsControllerApi;
import org.springframework.test.util.ReflectionTestUtils;

@ExtendWith(MockitoExtension.class)
class MultitenancyWithSingleDomainTenantResolverTest {

  @InjectMocks
  MultitenancyWithSingleDomainTenantResolver resolver;

  @Mock
  HttpServletRequest request;

  @Mock
  TenantControllerApi tenantControllerApi;

  @Mock
  ApplicationsettingsControllerApi applicationsettingsControllerApi;

  @Mock
  ApplicationSettingsApiControllerFactory applicationSettingsApiControllerFactory;

  @Mock
  TenantServiceApiControllerFactory tenantServiceApiControllerFactory;


  @AfterEach
  public void tearDown() {
    setMultitenancyWithSingleDomain(false);
  }

  private void setMultitenancyWithSingleDomain(boolean value) {
    ReflectionTestUtils.setField(resolver, "multitenancyWithSingleDomain", value);
  }

  @Test
  void resolve_Should_NotResolve_When_multitenancyWithSingleDomainNotEnabled() {
    // given
    setMultitenancyWithSingleDomain(false);
    // when
    assertThat(resolver.resolve(request)).isEmpty();
  }

  @Test
  void resolve_Should_resolveToTenantIdZero_When_ApplicationSettingsNotFound() {
    // given
    setMultitenancyWithSingleDomain(true);
    when(applicationSettingsApiControllerFactory.createControllerApi()).thenReturn(applicationsettingsControllerApi);
    when(applicationsettingsControllerApi.getApplicationSettings()).thenReturn(
        new ApplicationSettingsDTO());

    // when
    Optional<Long> resolve = resolver.resolve(request);

    // then
    assertThat(resolve).isPresent();
    assertThat(resolve.get()).isZero();
  }

  @Test
  void resolve_Should_resolveToTenantIdBasedOnMainTenantSubdomainValue_When_ApplicationSettingsFound() {
    // given
    setMultitenancyWithSingleDomain(true);

    when(tenantServiceApiControllerFactory.createControllerApi()).thenReturn(tenantControllerApi);
    when(applicationSettingsApiControllerFactory.createControllerApi()).thenReturn(applicationsettingsControllerApi);
    when(applicationsettingsControllerApi.getApplicationSettings()).thenReturn(
        new ApplicationSettingsDTO().mainTenantSubdomainForSingleDomainMultitenancy(
            new ApplicationSettingsDTOMainTenantSubdomainForSingleDomainMultitenancy().value("app")));
    when(tenantControllerApi.getRestrictedTenantDataBySubdomain("app", null)).thenReturn(
        new RestrictedTenantDTO().id(1L));
    // when
    Optional<Long> resolve = resolver.resolve(request);

    // then
    assertThat(resolve).isPresent().contains(1L);
    verify(tenantControllerApi).getRestrictedTenantDataBySubdomain("app", null);
    verify(applicationsettingsControllerApi).getApplicationSettings();
  }
}