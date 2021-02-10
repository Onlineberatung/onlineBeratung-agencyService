package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.useradminservice.generated.web.AdminUserControllerApi;
import de.caritas.cob.agencyservice.useradminservice.generated.ApiClient;
import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.AgencyTypeDTO;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.AgencyTypeDTO.AgencyTypeEnum;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserAdminService {

  private final @NonNull AdminUserControllerApi adminUserControllerApi;
  private final @NonNull SecurityHeaderSupplier securityHeaderSupplier;

  /**
   * Change the assigned consultants of an agency when type of agency is changed from team-agency to
   * default and vice-versa.
   *
   * @param agencyId   the id of the agency
   * @param agencyType Type to decide if assigned consultants will be removed from team sessions or
   *                   tagged as team consultants
   */
  public void adaptRelatedConsultantsForChange(Long agencyId, String agencyType) {
    addDefaultHeaders(this.adminUserControllerApi.getApiClient());
    this.adminUserControllerApi
        .changeAgencyType(agencyId,
            new AgencyTypeDTO()
                .agencyType(AgencyTypeEnum.fromValue(agencyType)));
  }

  private void addDefaultHeaders(ApiClient apiClient) {
    HttpHeaders headers = this.securityHeaderSupplier.getKeycloakAndCsrfHttpHeaders();
    headers.forEach((key, value) -> apiClient.addDefaultHeader(key, value.iterator().next()));
  }

}
