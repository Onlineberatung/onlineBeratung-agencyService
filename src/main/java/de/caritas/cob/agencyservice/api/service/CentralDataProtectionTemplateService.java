package de.caritas.cob.agencyservice.api.service;


import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.util.JsonConverter;
import java.util.Map;
import javax.annotation.Nullable;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import de.caritas.cob.agencyservice.tenantservice.generated.web.model.RestrictedTenantDTO;

@Service
@RequiredArgsConstructor
@Slf4j
public class CentralDataProtectionTemplateService {

  private final @NonNull TenantService tenantService;

  private final @NonNull TemplateRenderer templateRenderer;

  public String renderDataProtectionTemplate(Agency agency) {
    RestrictedTenantDTO restrictedTenantDataByTenantId = tenantService.getRestrictedTenantDataByTenantId(
        agency.getTenantId());

    if (restrictedTenantDataByTenantId.getContent() != null) {
      return renderDataProtectionTemplateIfContentNotNull(agency, restrictedTenantDataByTenantId);
    }
    return null;
  }

  @Nullable
  private String renderDataProtectionTemplateIfContentNotNull(Agency agency,
      RestrictedTenantDTO restrictedTenantDataByTenantId) {
    switch (agency.getDataProtectionResponsibleEntity()) {
      case DATA_PROTECTION_OFFICER -> {
        var dto = JsonConverter.convertFromJson(agency.getDataProtectionOfficerContactData());
        return renderDataProtectionTemplateFromTenant(restrictedTenantDataByTenantId, dto);
      }
      case ALTERNATIVE_REPRESENTATIVE -> {
        var alternativeContact = JsonConverter.convertFromJson(
            agency.getDataProtectionAlternativeContactData());
        return renderDataProtectionTemplateFromTenant(restrictedTenantDataByTenantId,
            alternativeContact);
      }
      case AGENCY_RESPONSIBLE -> {
        var agencyContact = JsonConverter.convertFromJson(
            agency.getDataProtectionAgencyContactData());
        return renderDataProtectionTemplateFromTenant(restrictedTenantDataByTenantId, agencyContact);
      }
      default -> {
        return restrictedTenantDataByTenantId.getContent().getPrivacy();
      }
    }
  }
  private String renderDataProtectionTemplateFromTenant(RestrictedTenantDTO tenant, DataProtectionContactDTO dataProtectionContactDTO)
       {
    String privacyTemplate = tenant.getContent().getPrivacy();
    try {
      return templateRenderer.renderTemplate(privacyTemplate, dataProtectionDTOToMap(dataProtectionContactDTO));
    } catch (Exception e) {
      log.error("Error while rendering data protection template: {}", e.getMessage());
      return privacyTemplate;
    }
  }

  private Map<String, Object> dataProtectionDTOToMap(DataProtectionContactDTO dto) {
    return Map.of("name", dto.getNameAndLegalForm(),
        "street", dto.getStreet(),
        "postCode", dto.getPostcode(),
        "city", dto.getCity(),
        "phoneNumber", dto.getPhoneNumber(),
        "email", dto.getEmail());

  }


}
