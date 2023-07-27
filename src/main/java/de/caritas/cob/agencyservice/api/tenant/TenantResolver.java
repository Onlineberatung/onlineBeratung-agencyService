package de.caritas.cob.agencyservice.api.tenant;

import java.util.Optional;
import jakarta.servlet.http.HttpServletRequest;

public interface TenantResolver {

  Optional<Long> resolve(HttpServletRequest request);

  boolean canResolve(HttpServletRequest request);
}
