package de.caritas.cob.agencyservice.api.authorization;

import static de.caritas.cob.agencyservice.api.authorization.Authority.AGENCY_ADMIN;
import static de.caritas.cob.agencyservice.api.authorization.Authority.fromRoleName;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.nullValue;

import org.junit.Test;

public class AuthorityTest {

  @Test
  public void getAuthority_Should_returnExpectedAuthority_When_authorityIsAgencyAdmin() {
    String authority = AGENCY_ADMIN.getAuthority();

    assertThat(authority, is("AUTHORIZATION_AGENCY_ADMIN"));
  }

  @Test
  public void fromRoleName_Should_returnNull_When_roleNameIsNull() {
    Authority authority = fromRoleName(null);

    assertThat(authority, nullValue());
  }

  @Test
  public void fromRoleName_Should_returnNull_When_roleNameDoesNotExist() {
    Authority authority = fromRoleName("not existing");

    assertThat(authority, nullValue());
  }

  @Test
  public void fromRoleName_Should_returnAgencyAdmin_When_roleNameIsAgencyAdmin() {
    Authority authority = fromRoleName("agency-admin");

    assertThat(authority, is(AGENCY_ADMIN));
  }

}
