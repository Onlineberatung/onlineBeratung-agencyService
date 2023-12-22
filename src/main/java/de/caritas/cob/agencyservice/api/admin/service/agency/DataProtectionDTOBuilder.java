package de.caritas.cob.agencyservice.api.admin.service.agency;

import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO.DataProtectionResponsibleEntityEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.DataProtectionResponsibleEntity;
import de.caritas.cob.agencyservice.api.util.JsonConverter;
import java.util.function.Supplier;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class DataProtectionDTOBuilder {

  private final @NonNull Agency agency;

  public DataProtectionDTO fromAgency() {
    if (agency.getDataProtectionResponsibleEntity() == null) {
      return null;
    }

    return new DataProtectionDTO()
        .dataProtectionResponsibleEntity(convertEnums(agency.getDataProtectionResponsibleEntity()))
        .agencyDataProtectionResponsibleContact(
            convertNullSafe(agency::getDataProtectionAgencyResponsibleContactData))
        .alternativeDataProtectionRepresentativeContact(
            convertNullSafe(agency::getDataProtectionAlternativeContactData))
        .dataProtectionOfficerContact(
            convertNullSafe(agency::getDataProtectionOfficerContactData));
  }

  private DataProtectionContactDTO convertNullSafe(Supplier<String> dataProtectionDataSupplier) {
    if (dataProtectionDataSupplier.get() == null) {
      return null;
    } else {
      return JsonConverter.convertFromJson(dataProtectionDataSupplier.get());
    }
  }


  private static DataProtectionResponsibleEntityEnum convertEnums(
      DataProtectionResponsibleEntity dataProtectionEntity) {

    switch (dataProtectionEntity) {
      case AGENCY_RESPONSIBLE:
        return DataProtectionDTO.DataProtectionResponsibleEntityEnum.AGENCY_RESPONSIBLE;
      case DATA_PROTECTION_OFFICER:
        return DataProtectionDTO.DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER;
      case ALTERNATIVE_REPRESENTATIVE:
        return DataProtectionDTO.DataProtectionResponsibleEntityEnum.ALTERNATIVE_REPRESENTATIVE;
      default:
        throw new IllegalArgumentException(
            "DataProtectionResponsibleEntity not supported: " + dataProtectionEntity);
    }
  }


}
