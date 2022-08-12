package de.caritas.cob.agencyservice.api.authorization;

import java.util.stream.Stream;
import lombok.Getter;

/**
 * 
 * Definition of all authorities and of the role-authority-mapping.
 *
 */
@Getter
public enum Authority {

  AGENCY_ADMIN("agency-admin", "AUTHORIZATION_AGENCY_ADMIN"),
  STATE_ADMIN("state-admin", "AUTHORIZATION_AGENCY_STATE_ADMIN");

  private final String roleName;
  private final String authority;

  Authority(final String roleName, final String authorityName) {
    this.roleName = roleName;
    this.authority = authorityName;
  }

  /**
   * Finds a {@link Authority} instance by given roleName.
   *
   * @param roleName the role name to search for
   * @return the {@link Authority} instance
   */
  public static Authority fromRoleName(String roleName) {
    return Stream.of(values())
        .filter(authority -> authority.roleName.equals(roleName))
        .findFirst()
        .orElse(null);
  }

}
