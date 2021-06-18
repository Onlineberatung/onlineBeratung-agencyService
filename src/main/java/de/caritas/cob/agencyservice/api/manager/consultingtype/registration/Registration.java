package de.caritas.cob.agencyservice.api.manager.consultingtype.registration;

import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * {@link ExtendedConsultingTypeResponseDTO} for registration
 *
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Registration {

  private int minPostcodeSize;
}
