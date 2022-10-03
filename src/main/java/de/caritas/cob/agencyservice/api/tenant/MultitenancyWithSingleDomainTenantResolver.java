package de.caritas.cob.agencyservice.api.tenant;

import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.ApplicationSettingsDTO;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.model.SettingDTO;
import de.caritas.cob.agencyservice.config.apiclient.ApplicationSettingsApiControllerFactory;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import liquibase.pro.packaged.O;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import de.caritas.cob.agencyservice.applicationsettingsservice.generated.web.ApplicationsettingsControllerApi;
import de.caritas.cob.agencyservice.tenantservice.generated.web.TenantControllerApi;

@Component
@Slf4j
@RequiredArgsConstructor
public class MultitenancyWithSingleDomainTenantResolver implements TenantResolver {
  @Value("${feature.multitenancy.with.single.domain.enabled}")
  private boolean multitenancyWithSingleDomain;

  @Autowired
  private ApplicationSettingsApiControllerFactory applicationSettingsApiControllerFactory;

  @Autowired
  private TenantControllerApi tenantControllerApi;

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
      log.warn("Main tenant subdomain not available in application settings. Resolving tenant to 0.");
      return Optional.of(0L);
    }
  }

  private Optional<Long> resolveFromTenantServiceBasedOnMainTenantSubdomain(String rootTenantSubdomain) {
    RestrictedTenantDTO rootTenantData = tenantControllerApi.getRestrictedTenantDataBySubdomain(
        rootTenantSubdomain);
    return Optional.of(rootTenantData.getId());
  }

  private Optional<String> getMainTenantSubdomainFromApplicationSettings() {
    ApplicationSettingsDTO applicationSettings = applicationSettingsApiControllerFactory.createControllerApi().getApplicationSettings();
    SettingDTO mainTenantSubdomainForSingleDomainMultitenancy = applicationSettings.getMainTenantSubdomainForSingleDomainMultitenancy();
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
