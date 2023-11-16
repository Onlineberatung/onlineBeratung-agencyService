package de.caritas.cob.agencyservice.api.authorization;

import static de.caritas.cob.agencyservice.api.authorization.Authority.AGENCY_ADMIN;
import static de.caritas.cob.agencyservice.api.authorization.Authority.fromRoleName;
import static org.assertj.core.api.Assertions.assertThat;

import de.caritas.cob.agencyservice.api.authorization.Authority.AuthorityValue;
import java.util.List;
import org.junit.Test;

public class AuthorityTest {

  @Test
  public void getAuthority_Should_returnExpectedAuthority_When_authorityIsAgencyAdmin() {
    List<String> authorities = AGENCY_ADMIN.getAuthorities();

    assertThat(authorities).containsOnly(AuthorityValue.AGENCY_ADMIN, AuthorityValue.SEARCH_AGENCIES);
  }

  @Test
  public void fromRoleName_Should_returnNull_When_roleNameIsNull() {
    Authority authority = fromRoleName(null);

    assertThat(authority).isNull();
  }

  @Test
  public void fromRoleName_Should_returnNull_When_roleNameDoesNotExist() {
    Authority authority = fromRoleName("not existing");

    assertThat(authority).isNull();
  }

  @Test
  public void fromRoleName_Should_returnAgencyAdmin_When_roleNameIsAgencyAdmin() {
    Authority authority = fromRoleName("agency-admin");

    assertThat(authority.getAuthorities()).containsOnly(AuthorityValue.AGENCY_ADMIN, AuthorityValue.SEARCH_AGENCIES);
  }

}
