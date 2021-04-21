package de.caritas.cob.agencyservice.api.manager.consultingtype.whiteSpot;

import javax.annotation.Nullable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Settings for white spot agency
 *
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class WhiteSpot {

  // TODO: remove redundant boolean value and make it dynamic based on id
  private boolean whiteSpotAgencyAssigned;
  @Nullable
  private Long whiteSpotAgencyId;
}
