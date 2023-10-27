package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.assertj.core.api.Assertions.assertThat;

import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO.DataProtectionResponsibleEntityEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.DataProtectionResponsibleEntity;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class DataProtectionDTOBuilderTest {

  DataProtectionDTOBuilder dataProtectionDTOBuilder;

  @Test
  void should_ReturnNull_When_DataProtectionResponsibleEntityIsNotSet() {
    // given
    DataProtectionDTOBuilder dataProtectionDTOBuilder = new DataProtectionDTOBuilder(new Agency());
    // when, then
    assertThat(dataProtectionDTOBuilder.fromAgency()).isNull();
  }

  @Test
  void should_ReturnJsonString_When_DataProtectionResponsibleEntityIsSetToAgencyResponsible() {
    // given
    Agency agency = Agency.builder().dataProtectionResponsibleEntity(
        DataProtectionResponsibleEntity.AGENCY_RESPONSIBLE)
        .name("agency name")
        .consultingTypeId(1)
        .dataProtectionAgencyResponsibleContactData("{\"nameAndLegalForm\":\"name of legal entity\"}")
        .build();
    DataProtectionDTOBuilder dataProtectionDTOBuilder = new DataProtectionDTOBuilder(agency);

    // when
    DataProtectionDTO dataProtectionDTO = dataProtectionDTOBuilder.fromAgency();

    // then
    assertThat(dataProtectionDTO.getDataProtectionResponsibleEntity()).isEqualTo(
        DataProtectionDTO.DataProtectionResponsibleEntityEnum.AGENCY_RESPONSIBLE);

    DataProtectionContactDTO agencyDataProtectionResponsibleContact = dataProtectionDTO
        .getAgencyDataProtectionResponsibleContact();
    assertThat(agencyDataProtectionResponsibleContact).isNotNull();
    assertThat(agencyDataProtectionResponsibleContact.getNameAndLegalForm()).isEqualTo("name of legal entity");
  }

  @Test
  void should_ReturnJsonString_When_DataProtectionResponsibleEntityIsSetToDataProtectionOfficer() {
    // given
    Agency agency = Agency.builder().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntity.DATA_PROTECTION_OFFICER)
        .name("agency name")
        .consultingTypeId(1)
        .dataProtectionOfficerContactData("{\"nameAndLegalForm\":\"name of legal entity\"}")
        .build();
    DataProtectionDTOBuilder dataProtectionDTOBuilder = new DataProtectionDTOBuilder(agency);

    // when
    DataProtectionDTO dataProtectionDTO = dataProtectionDTOBuilder.fromAgency();

    // then
    assertThat(dataProtectionDTO.getDataProtectionResponsibleEntity()).isEqualTo(
        DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER);

    DataProtectionContactDTO agencyDataProtectionResponsibleContact = dataProtectionDTO
        .getDataProtectionOfficerContact();
    assertThat(agencyDataProtectionResponsibleContact).isNotNull();
    assertThat(agencyDataProtectionResponsibleContact.getNameAndLegalForm()).isEqualTo("name of legal entity");
  }


  @Test
  void should_ReturnJsonString_When_DataProtectionResponsibleEntityIsSetToAlternativeData() {
    // given
    Agency agency = Agency.builder().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntity.ALTERNATIVE_REPRESENTATIVE)
        .name("agency name")
        .consultingTypeId(1)
        .dataProtectionAlternativeContactData("{\"nameAndLegalForm\":\"name of legal entity\"}")
        .build();
    DataProtectionDTOBuilder dataProtectionDTOBuilder = new DataProtectionDTOBuilder(agency);

    // when
    DataProtectionDTO dataProtectionDTO = dataProtectionDTOBuilder.fromAgency();

    // then
    assertThat(dataProtectionDTO.getDataProtectionResponsibleEntity()).isEqualTo(
        DataProtectionResponsibleEntityEnum.ALTERNATIVE_REPRESENTATIVE);

    DataProtectionContactDTO agencyDataProtectionResponsibleContact = dataProtectionDTO
        .getAlternativeDataProtectionRepresentativeContact();
    assertThat(agencyDataProtectionResponsibleContact).isNotNull();
    assertThat(agencyDataProtectionResponsibleContact.getNameAndLegalForm()).isEqualTo("name of legal entity");
  }


}