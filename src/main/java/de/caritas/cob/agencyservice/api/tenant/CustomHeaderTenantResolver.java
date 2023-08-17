package de.caritas.cob.agencyservice.api.tenant;

import de.caritas.cob.agencyservice.api.service.TenantHeaderSupplier;
import java.util.Optional;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.NonNull;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class CustomHeaderTenantResolver implements TenantResolver {
  private final @NonNull TenantHeaderSupplier tenantHeaderSupplier;

  @Override
  public Optional<Long> resolve(HttpServletRequest request) {
    return tenantHeaderSupplier.getTenantFromHeader();
  }

  @Override
  public boolean canResolve(HttpServletRequest request) {
    return resolve(request).isPresent();
  }
}
