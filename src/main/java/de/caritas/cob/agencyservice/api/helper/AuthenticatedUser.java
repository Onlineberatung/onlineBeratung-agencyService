package de.caritas.cob.agencyservice.api.helper;

import de.caritas.cob.agencyservice.api.repository.agency.FederalState;
import java.util.Set;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

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

  private Set<FederalState> states;

}
