package de.caritas.cob.agencyservice.testHelper;

import static java.util.Objects.nonNull;

import de.caritas.cob.agencyservice.api.manager.consultingtype.registration.Registration;
import de.caritas.cob.agencyservice.api.manager.consultingtype.whiteSpot.WhiteSpot;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.BasicConsultingTypeResponseDTORegistration;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.WhiteSpotDTO;

public class ExtendedConsultingTypeResponseDTOHelper {

  public static ExtendedConsultingTypeResponseDTO createExtendedConsultingTypeResponseDTO(int id,
      WhiteSpot whiteSpot, Registration registration, Boolean isLockedAgencies) {

    var extendedConsultingTypeResponseDTO = new ExtendedConsultingTypeResponseDTO();

    WhiteSpotDTO whiteSpotDTO = null;
    if (nonNull(whiteSpot)) {
      whiteSpotDTO = new WhiteSpotDTO();
      if (nonNull(whiteSpot.getWhiteSpotAgencyId())) {
        whiteSpotDTO.setWhiteSpotAgencyId(whiteSpot.getWhiteSpotAgencyId().intValue());
      }
      whiteSpotDTO.setWhiteSpotAgencyAssigned(whiteSpot.isWhiteSpotAgencyAssigned());
    }

    BasicConsultingTypeResponseDTORegistration registrationDTO = null;
    if (nonNull(registration)) {
      registrationDTO = new BasicConsultingTypeResponseDTORegistration();
      registrationDTO.setMinPostcodeSize(registration.getMinPostcodeSize());
    }
    extendedConsultingTypeResponseDTO.setLockedAgencies(isLockedAgencies);
    extendedConsultingTypeResponseDTO.setRegistration(registrationDTO);
    extendedConsultingTypeResponseDTO.whiteSpot(whiteSpotDTO);
    extendedConsultingTypeResponseDTO.setId(id);
    return extendedConsultingTypeResponseDTO;

  }
}
