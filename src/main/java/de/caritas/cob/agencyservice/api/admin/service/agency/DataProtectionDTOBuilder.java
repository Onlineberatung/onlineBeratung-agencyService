package de.caritas.cob.agencyservice.api.admin.service.agency;

import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO.DataProtectionResponsibleEntityEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.util.JsonConverter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class DataProtectionDTOBuilder {

  private final @NonNull Agency agency;


  public DataProtectionDTO fromAgency() {
    if (agency.getDataProtectionResponsibleEntity() == null) {
      return null;
    }

    switch (this.agency.getDataProtectionResponsibleEntity()) {
      case AGENCY_RESPONSIBLE:
        return getAgencyResponsibleDataProtectionDTO();
      case ALTERNATIVE_REPRESENTATIVE:
        return getAlternativeRepresentative();
      case DATA_PROTECTION_OFFICER:
        return getDataProtectionOfficerDTO();
      default:
        return null;
    }
  }

  private DataProtectionDTO getDataProtectionOfficerDTO() {
    String dataProtectionOfficerContactData = this.agency.getDataProtectionOfficerContactData();
    if (dataProtectionOfficerContactData == null) {
      return null;
    }
    DataProtectionContactDTO dataProtectionContactDTO = JsonConverter.convertFromJson(
        dataProtectionOfficerContactData);
    return new DataProtectionDTO()
        .dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER)
        .dataProtectionOfficerContact(dataProtectionContactDTO);
  }

  private DataProtectionDTO getAlternativeRepresentative() {
    String dataProtectionAlternativeContactData = this.agency.getDataProtectionAlternativeContactData();
    if (dataProtectionAlternativeContactData == null) {
      return null;
    }
    DataProtectionContactDTO dataProtectionContactDTO = JsonConverter.convertFromJson(
        dataProtectionAlternativeContactData);

    return new DataProtectionDTO()
        .dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.ALTERNATIVE_REPRESENTATIVE)
        .alternativeDataProtectionRepresentativeContact(dataProtectionContactDTO);
  }

  private DataProtectionDTO getAgencyResponsibleDataProtectionDTO() {
    String dataProtectionAgencyResponsibleContactData = this.agency.getDataProtectionAgencyResponsibleContactData();
    if (dataProtectionAgencyResponsibleContactData == null) {
      return null;
    }
    DataProtectionContactDTO dataProtectionContactDTO = JsonConverter.convertFromJson(
        dataProtectionAgencyResponsibleContactData);
    return new DataProtectionDTO()
        .dataProtectionResponsibleEntity(DataProtectionResponsibleEntityEnum.AGENCY_RESPONSIBLE)
        .agencyDataProtectionResponsibleContact(dataProtectionContactDTO);
  }
}
