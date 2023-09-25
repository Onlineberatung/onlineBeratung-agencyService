package de.caritas.cob.agencyservice.api.authorization;

import java.util.stream.Stream;

/**
 * 
 * Definition of all authorities and of the role-authority-mapping.
 *
 */
public enum Authority {

  AGENCY_ADMIN("agency-admin", "AUTHORIZATION_AGENCY_ADMIN"),
  TENANT_ADMIN("tenant-admin", "AUTHORIZATION_TENANT_ADMIN"),
  RESTRICTED_AGENCY_ADMIN("restricted-agency-admin", "AUTHORIZATION_RESTRICTED_AGENCY_ADMIN");

  private final String roleName;
  private final String authorityName;

  Authority(final String roleName, final String authorityName) {
    this.roleName = roleName;
    this.authorityName = authorityName;
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

  public String getAuthority() {
    return this.authorityName;
  }

  public String getRoleName() {
    return this.roleName;
  }

}
