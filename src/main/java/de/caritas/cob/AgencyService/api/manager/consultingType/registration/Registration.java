package de.caritas.cob.AgencyService.api.manager.consultingType.registration;

import de.caritas.cob.AgencyService.api.manager.consultingType.ConsultingTypeSettings;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * {@link ConsultingTypeSettings} for registration
 *
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Registration {

  private int minPostcodeSize;
}
