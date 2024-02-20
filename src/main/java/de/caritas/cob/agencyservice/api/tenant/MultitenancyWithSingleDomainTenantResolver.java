package de.caritas.cob.agencyservice.api.tenant;

import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTO;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTOMainTenantSubdomainForSingleDomainMultitenancy;
import de.caritas.cob.agencyservice.config.apiclient.ApplicationSettingsApiControllerFactory;
import de.caritas.cob.agencyservice.config.apiclient.TenantServiceApiControllerFactory;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import java.util.Optional;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


@Component
@Slf4j
@RequiredArgsConstructor
public class MultitenancyWithSingleDomainTenantResolver implements TenantResolver {

  @Value("${feature.multitenancy.with.single.domain.enabled}")
  private boolean multitenancyWithSingleDomain;

  @Autowired
  private ApplicationSettingsApiControllerFactory applicationSettingsApiControllerFactory;

  @Autowired
  private TenantServiceApiControllerFactory tenantServiceApiControllerFactory;

  @Override
  public Optional<Long> resolve(HttpServletRequest request) {
    if (multitenancyWithSingleDomain) {
      return resolveForMultitenancyWithSingleDomain();
    } else {
      return Optional.empty();
    }
  }

  private Optional<Long> resolveForMultitenancyWithSingleDomain() {
    log.debug("MultitenancyWithSingleDomainTenantResolver resolves tenantId");
    Optional<String> mainTenantSubdomain = getMainTenantSubdomainFromApplicationSettings();
    if (mainTenantSubdomain.isPresent() && StringUtils.isNotBlank(mainTenantSubdomain.get())) {
      return resolveFromTenantServiceBasedOnMainTenantSubdomain(mainTenantSubdomain.get());
    } else {
      log.warn(
          "Main tenant subdomain not available in application settings. Resolving tenant to 0.");
      return Optional.of(0L);
    }
  }

  private Optional<Long> resolveFromTenantServiceBasedOnMainTenantSubdomain(
      String rootTenantSubdomain) {
    var tenantControllerApi = tenantServiceApiControllerFactory.createControllerApi();
    RestrictedTenantDTO rootTenantData = tenantControllerApi.getRestrictedTenantDataBySubdomain(
        rootTenantSubdomain, null);
    return Optional.of(rootTenantData.getId());
  }

  private Optional<String> getMainTenantSubdomainFromApplicationSettings() {
    ApplicationSettingsDTO applicationSettings = applicationSettingsApiControllerFactory.createControllerApi()
        .getApplicationSettings();
    ApplicationSettingsDTOMainTenantSubdomainForSingleDomainMultitenancy mainTenantSubdomainForSingleDomainMultitenancy = applicationSettings.getMainTenantSubdomainForSingleDomainMultitenancy();
    if (mainTenantSubdomainForSingleDomainMultitenancy == null) {
      return Optional.empty();
    }
    String subdomain = mainTenantSubdomainForSingleDomainMultitenancy.getValue();
    return Optional.ofNullable(subdomain);
  }

  @Override
  public boolean canResolve(HttpServletRequest request) {
    return resolve(request).isPresent();
  }
}
