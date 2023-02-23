package de.caritas.cob.agencyservice.api.admin.validation;

import static de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason.AGENCY_CONTAINS_CONSULTANTS;
import static org.apache.commons.lang3.BooleanUtils.isTrue;

import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.ConflictException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.LockedConsultingTypeException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
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
  private final @NonNull ConsultingTypeManager consultingTypeManager;
  private static final int FIRST_PAGE = 1;
  private static final int PER_PAGE = 1;

  /**
   * Checks if agency is existing, is no Kreuzbund agency and has no assigned consultants.
   *
   * @param agency {@link Agency}
   */
  public void validate(Agency agency) {
    checkIfIsLockedAgencies(agency);
    checkIfAgencyHasAssignedConsultants(agency);
  }

  private void checkIfIsLockedAgencies(Agency agency) {

    ExtendedConsultingTypeResponseDTO extendedConsultingTypeResponseDTO;

    try {
      extendedConsultingTypeResponseDTO = consultingTypeManager
          .getConsultingTypeSettings(agency.getConsultingTypeId());
    } catch (MissingConsultingTypeException e) {
      throw new InvalidConsultingTypeException();
    }

    if (isTrue(extendedConsultingTypeResponseDTO.getLockedAgencies())) {
      throw new LockedConsultingTypeException();
    }
  }

  private void checkIfAgencyHasAssignedConsultants(Agency agency) {
    List<ConsultantAdminResponseDTO> consultantList =
        this.userAdminService.getConsultantsOfAgency(agency.getId(), FIRST_PAGE, PER_PAGE);

    if (!consultantList.isEmpty()) {
      throw new ConflictException(AGENCY_CONTAINS_CONSULTANTS);
    }
  }
}
