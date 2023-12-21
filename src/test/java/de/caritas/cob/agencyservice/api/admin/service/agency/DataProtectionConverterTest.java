package de.caritas.cob.agencyservice.api.admin.service.agency;

import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO;
import de.caritas.cob.agencyservice.api.model.DataProtectionDTO.DataProtectionResponsibleEntityEnum;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.Agency.AgencyBuilder;
import de.caritas.cob.agencyservice.api.repository.agency.DataProtectionResponsibleEntity;
import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.assertThat;

class DataProtectionConverterTest {

  @Test
  void convertToEntity_Should_Convert_When_AllParamsAreNull() {
    // given
    DataProtectionDTO dataProtectionDTO = new DataProtectionDTO();
    DataProtectionConverter dataProtectionConverter = new DataProtectionConverter();
    AgencyBuilder builder = Agency.builder().name("test").consultingTypeId(1);

    // when
    dataProtectionConverter.convertToEntity(dataProtectionDTO, builder);
    Agency agency = builder.build();

    // then
    assertThat(agency.getDataProtectionResponsibleEntity()).isNull();
    assertThat(agency.getDataProtectionAlternativeContactData()).isNull();
    assertThat(agency.getDataProtectionOfficerContactData()).isNull();
    assertThat(agency.getDataProtectionAgencyResponsibleContactData()).isNull();
  }

  @Test
  void convertToEntity_Should_Convert_When_DataProtectionDTOIsNull() {
    // given
    DataProtectionConverter dataProtectionConverter = new DataProtectionConverter();
    AgencyBuilder builder = Agency.builder().name("test").consultingTypeId(1);

    // when
    dataProtectionConverter.convertToEntity(null, builder);
    Agency agency = builder.build();

    // then
    assertThat(agency.getDataProtectionResponsibleEntity()).isNull();
    assertThat(agency.getDataProtectionAlternativeContactData()).isNull();
    assertThat(agency.getDataProtectionOfficerContactData()).isNull();
    assertThat(agency.getDataProtectionAgencyResponsibleContactData()).isNull();
  }

  @Test
  void convertToEntity_Should_Convert_When_AgencyResponsible_IsNotNull() {
    // given
    DataProtectionConverter dataProtectionConverter = new DataProtectionConverter();
    AgencyBuilder builder = Agency.builder().name("test").consultingTypeId(1);
    var dataProtectionDTO = new DataProtectionDTO().dataProtectionResponsibleEntity(DataProtectionDTO.DataProtectionResponsibleEntityEnum.AGENCY_RESPONSIBLE)
        .agencyDataProtectionResponsibleContact(new DataProtectionContactDTO().nameAndLegalForm("agency data responsible"));

    // when
    dataProtectionConverter.convertToEntity(dataProtectionDTO, builder);
    Agency agency = builder.build();

    // then
    assertThat(agency.getDataProtectionResponsibleEntity()).isEqualTo(
        DataProtectionResponsibleEntity.AGENCY_RESPONSIBLE);
    assertThat(agency.getDataProtectionAlternativeContactData()).isNull();
    assertThat(agency.getDataProtectionOfficerContactData()).isNull();
    assertThat(agency.getDataProtectionAgencyResponsibleContactData()).isNotNull();
  }

  @Test
  void convertToEntity_Should_Convert_When_DataProtectionOfficer_IsNotNull() {
    // given
    DataProtectionConverter dataProtectionConverter = new DataProtectionConverter();
    AgencyBuilder builder = Agency.builder().name("test").consultingTypeId(1);
    var dataProtectionDTO = new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.DATA_PROTECTION_OFFICER)
        .dataProtectionOfficerContact(new DataProtectionContactDTO().nameAndLegalForm("data protection officer data"));

    // when
    dataProtectionConverter.convertToEntity(dataProtectionDTO, builder);
    Agency agency = builder.build();

    // then
    assertThat(agency.getDataProtectionResponsibleEntity()).isEqualTo(
        DataProtectionResponsibleEntity.DATA_PROTECTION_OFFICER);
    assertThat(agency.getDataProtectionAlternativeContactData()).isNull();
    assertThat(agency.getDataProtectionOfficerContactData()).isNotNull();
    assertThat(agency.getDataProtectionAgencyResponsibleContactData()).isNull();
  }

  @Test
  void convertToEntity_Should_Convert_When_AlternativeRepresentative_IsNotNull() {
    // given
    DataProtectionConverter dataProtectionConverter = new DataProtectionConverter();
    AgencyBuilder builder = Agency.builder().name("test").consultingTypeId(1);
    var dataProtectionDTO = new DataProtectionDTO().dataProtectionResponsibleEntity(
            DataProtectionResponsibleEntityEnum.ALTERNATIVE_REPRESENTATIVE)
        .alternativeDataProtectionRepresentativeContact(new DataProtectionContactDTO().nameAndLegalForm("alternative representative data"));

    // when
    dataProtectionConverter.convertToEntity(dataProtectionDTO, builder);
    Agency agency = builder.build();

    // then
    assertThat(agency.getDataProtectionResponsibleEntity()).isEqualTo(
        DataProtectionResponsibleEntity.ALTERNATIVE_REPRESENTATIVE);
    assertThat(agency.getDataProtectionAlternativeContactData()).isNotNull();
    assertThat(agency.getDataProtectionOfficerContactData()).isNull();
    assertThat(agency.getDataProtectionAgencyResponsibleContactData()).isNull();
  }


}
