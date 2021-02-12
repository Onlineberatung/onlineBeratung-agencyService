package de.caritas.cob.agencyservice.api.admin.validation;

import static org.apache.commons.lang3.ObjectUtils.isEmpty;

import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.exception.httpresponses.ConflictException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.LockedConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.ConsultantAdminResponseDTO;
import java.util.List;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Validator for agencies before deletion.
 */
@Component
@RequiredArgsConstructor
public class DeleteAgencyValidator {

  private final @NonNull UserAdminService userAdminService;
  private final int firstPage = 1;
  private final int perPage = 1;

  /**
   * Checks if agency is existing, is no Kreuzbund agency and has no assigned consultants.
   *
   * @param agency {@link Agency}
   */
  public void validate(Agency agency) {
    if (isEmpty(agency)) {
      throw new NotFoundException();
    }
    checkIfIsKreuzbundAgency(agency);
    checkIfAgencyHasAssignedConsultants(agency);
  }

  private void checkIfAgencyHasAssignedConsultants(Agency agency) {
    List<ConsultantAdminResponseDTO> consultantList = this.userAdminService
        .getConsultantsOfAgency(agency.getId(), firstPage, perPage);
    if (!consultantList.isEmpty()) {
      throw new ConflictException();
    }
  }

  private void checkIfIsKreuzbundAgency(Agency agency) {
    if (ConsultingType.KREUZBUND.equals(agency.getConsultingType())) {
      throw new LockedConsultingTypeException();
    }
  }
}
