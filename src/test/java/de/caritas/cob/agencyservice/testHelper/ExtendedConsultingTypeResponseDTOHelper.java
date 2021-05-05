package de.caritas.cob.agencyservice.testHelper;

import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.RegistrationDTO;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.WhiteSpotDTO;
import de.caritas.cob.agencyservice.api.manager.consultingtype.registration.Registration;
import de.caritas.cob.agencyservice.api.manager.consultingtype.whiteSpot.WhiteSpot;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;

public class ExtendedConsultingTypeResponseDTOHelper {

  public static ExtendedConsultingTypeResponseDTO createExtendedConsultingTypeResponseDTO(int id, WhiteSpot whiteSpot, Registration registration, Boolean isLockedAgencies) {

    var extendedConsultingTypeResponseDTO = new ExtendedConsultingTypeResponseDTO();

    WhiteSpotDTO whiteSpotDTO = null;
    if(whiteSpot != null) {
      whiteSpotDTO = new WhiteSpotDTO();
      if(whiteSpot.getWhiteSpotAgencyId() != null)
        whiteSpotDTO.setWhiteSpotAgencyId(whiteSpot.getWhiteSpotAgencyId().intValue());
      whiteSpotDTO.setWhiteSpotAgencyAssigned(whiteSpot.isWhiteSpotAgencyAssigned());
    }

    RegistrationDTO registrationDTO = null;
    if(registration != null){
      registrationDTO = new RegistrationDTO();
      registrationDTO.setMinPostcodeSize(registration.getMinPostcodeSize());
    }
    extendedConsultingTypeResponseDTO.setLockedAgencies(isLockedAgencies);
    extendedConsultingTypeResponseDTO.setRegistration(registrationDTO);
    extendedConsultingTypeResponseDTO.whiteSpot(whiteSpotDTO);
    extendedConsultingTypeResponseDTO.setId(id);
    return extendedConsultingTypeResponseDTO;

  }
}
