package de.caritas.cob.agencyservice.api.admin.service.agency;

import de.caritas.cob.agencyservice.api.model.DataProtectionDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency.AgencyBuilder;
import de.caritas.cob.agencyservice.api.repository.agency.DataProtectionResponsibleEntity;
import de.caritas.cob.agencyservice.api.util.JsonConverter;
import org.springframework.stereotype.Component;

@Component
public class DataProtectionConverter {

  public void convertToEntity(DataProtectionDTO dataProtectionDTO, AgencyBuilder agencyBuilder) {
    if (dataProtectionDTO != null) {
      agencyBuilder.dataProtectionResponsibleEntity(convertEnums(dataProtectionDTO));
      agencyBuilder.dataProtectionOfficerContactData(
          JsonConverter.convertToJson(dataProtectionDTO.getDataProtectionOfficerContact()));
      agencyBuilder.dataProtectionAgencyResponsibleContactData(JsonConverter.convertToJson(
          dataProtectionDTO.getAgencyDataProtectionResponsibleContact()));
      agencyBuilder.dataProtectionAlternativeContactData(JsonConverter.convertToJson(
          dataProtectionDTO.getAlternativeDataProtectionRepresentativeContact()));
    } else {
      nullifyDataProtectionAttributes(agencyBuilder);
    }
  }

  private static void nullifyDataProtectionAttributes(AgencyBuilder agencyBuilder) {
    agencyBuilder.dataProtectionResponsibleEntity(null);
    agencyBuilder.dataProtectionOfficerContactData(null);
    agencyBuilder.dataProtectionAgencyResponsibleContactData(null);
    agencyBuilder.dataProtectionAlternativeContactData(null);
  }

  private static DataProtectionResponsibleEntity convertEnums(
      DataProtectionDTO dataProtectionDTO) {
    var dataProtectionEntity = dataProtectionDTO.getDataProtectionResponsibleEntity();
    if (dataProtectionEntity == null) {
      return null;
    }
    switch (dataProtectionEntity) {
      case AGENCY_RESPONSIBLE:
        return DataProtectionResponsibleEntity.AGENCY_RESPONSIBLE;
      case DATA_PROTECTION_OFFICER:
        return DataProtectionResponsibleEntity.DATA_PROTECTION_OFFICER;
      case ALTERNATIVE_REPRESENTATIVE:
        return DataProtectionResponsibleEntity.ALTERNATIVE_REPRESENTATIVE;
      default:
        throw new IllegalArgumentException(
            "DataProtectionResponsibleEntity not supported: " + dataProtectionEntity);
    }
  }

}
