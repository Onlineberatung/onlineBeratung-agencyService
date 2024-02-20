package de.caritas.cob.agencyservice.api.authorization;

import com.google.common.collect.Lists;
import java.util.List;
import java.util.stream.Stream;
import lombok.Getter;

/**
 * 
 * Definition of all authorities and of the role-authority-mapping.
 *
 */
@Getter
public enum Authority {

  AGENCY_ADMIN("agency-admin", AuthorityValue.AGENCY_ADMIN, AuthorityValue.SEARCH_AGENCIES),
  TENANT_ADMIN("tenant-admin", AuthorityValue.TENANT_ADMIN),
  RESTRICTED_AGENCY_ADMIN("restricted-agency-admin", AuthorityValue.RESTRICTED_AGENCY_ADMIN, AuthorityValue.SEARCH_AGENCIES),

  RESTRICTED_CONSULTANT_ADMIN("restricted-consultant-admin", AuthorityValue.SEARCH_AGENCIES);

  private final String roleName;
  private final List<String> authorities;

  Authority(final String roleName, final String authorityName) {
    this.roleName = roleName;
    this.authorities = Lists.newArrayList(authorityName);
  }

  Authority(final String roleName, final String... authorities) {
    this.roleName = roleName;
    this.authorities = Lists.newArrayList(authorities);
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


  public static class AuthorityValue {

    private AuthorityValue() {}

    public static final String PREFIX = "AUTHORIZATION_";
    public static final String AGENCY_ADMIN = PREFIX + "AGENCY_ADMIN";
    public static final String SEARCH_AGENCIES = PREFIX + "SEARCH_AGENCIES";
    public static final String TENANT_ADMIN = PREFIX + "TENANT_ADMIN";
    public static final String RESTRICTED_AGENCY_ADMIN = PREFIX + "RESTRICTED_AGENCY_ADMIN";

  }


}
