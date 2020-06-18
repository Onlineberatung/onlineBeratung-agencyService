package de.caritas.cob.AgencyService.api.manager.consultingType;

import de.caritas.cob.AgencyService.api.manager.consultingType.registration.Registration;
import de.caritas.cob.AgencyService.api.manager.consultingType.whiteSpot.WhiteSpot;
import de.caritas.cob.AgencyService.api.repository.agency.ConsultingType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ConsultingTypeSettings {

  private ConsultingType consultingType;
  private WhiteSpot whiteSpot;
  private Registration registration;
}
