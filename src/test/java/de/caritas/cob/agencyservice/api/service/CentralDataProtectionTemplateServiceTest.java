package de.caritas.cob.agencyservice.api.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.DataProtectionResponsibleEntity;
import de.caritas.cob.agencyservice.api.util.JsonConverter;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.AgencyContextDTO;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.Content;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.DataProtectionContactTemplateDTO;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.DataProtectionOfficerDTO;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@ActiveProfiles("testing")
class CentralDataProtectionTemplateServiceTest {

  @Autowired
  CentralDataProtectionTemplateService centralDataProtectionTemplateService;

  @MockBean
  TenantService tenantService;

  @Test
  void renderDataProtectionTemplate_shouldProperlyRenderContent_When_ResponsibleIsSet() {

    // given
    when(tenantService.getRestrictedTenantDataByTenantId(anyLong())).thenReturn(
        new RestrictedTenantDTO()
            .content(new Content().dataProtectionContactTemplate(getDataProtectionContactTemplate())));
    DataProtectionContactDTO dataProtectionContactDTO = new DataProtectionContactDTO()
        .nameAndLegalForm("Max Mustermann")
        .street("Musterstraße 1")
        .postcode("12345")
        .city("Freiburg")
        .phoneNumber("0123456789");

    Agency agency = Agency.builder()
        .id(1000L)
        .consultingTypeId(1)
        .name("agencyName")
        .dataProtectionResponsibleEntity(DataProtectionResponsibleEntity.DATA_PROTECTION_OFFICER)
        .dataProtectionOfficerContactData(JsonConverter.convertToJson(dataProtectionContactDTO)).build();

    // when
    String renderedTemplate = centralDataProtectionTemplateService.renderDataProtectionTemplate(agency);

    // then
    assertThat(renderedTemplate).isEqualTo("Data protection officer contact name: Max Mustermann, Musterstraße 1, 12345 Freiburg, 0123456789");


  }

  private DataProtectionContactTemplateDTO getDataProtectionContactTemplate() {
    return new DataProtectionContactTemplateDTO().agencyContext(
        getAgencyContext());
  }

  private AgencyContextDTO getAgencyContext() {
    return new AgencyContextDTO().dataProtectionOfficer(
        new DataProtectionOfficerDTO().dataProtectionOfficerContact(
            "Data protection officer contact name: ${name}, city: ${city}, postcode: ${postcode}, phoneNumber: {phoneNumber}"));
  }


}