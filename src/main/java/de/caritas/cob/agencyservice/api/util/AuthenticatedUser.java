package de.caritas.cob.agencyservice.api.util;

import com.fasterxml.jackson.annotation.JsonIgnore;
import de.caritas.cob.agencyservice.api.authorization.Authority;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

import java.util.Set;

import static java.util.Objects.nonNull;

/**
 * Representation of the via Keyclcoak authentificated user
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class AuthenticatedUser {

  @NonNull
  private String userId;

  @NonNull
  private String username;

  @NonNull
  private String accessToken;

  private Set<String> roles;

  @JsonIgnore
  public boolean isRestrictedAgencyAdmin() {
    return nonNull(roles) && roles.contains(Authority.RESTRICTED_AGENCY_ADMIN.getRoleName());
  }

  @JsonIgnore
  public boolean isAgencySuperAdmin() {
    return nonNull(roles) && roles.contains(Authority.AGENCY_ADMIN.getRoleName());
  }

  @JsonIgnore
  public boolean hasRestrictedAgencyPriviliges() {
    return isRestrictedAgencyAdmin() && !isAgencySuperAdmin();
  }


}
