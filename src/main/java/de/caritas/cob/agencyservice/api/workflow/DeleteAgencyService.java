package de.caritas.cob.agencyservice.api.workflow;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import java.util.List;

import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRangeRepository;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import jakarta.transaction.Transactional;

@Component
@RequiredArgsConstructor
@Slf4j
@Transactional
public class DeleteAgencyService {

  private final @NonNull AgencyRepository agencyRepository;

  private final @NonNull AgencyPostcodeRangeRepository agencyPostcodeRangeRepository;

  public void deleteAgenciesMarkedForDeletion() {
    List<Agency> allByDeleteDateNotNull = agencyRepository.findAllByDeleteDateNotNull();
    allByDeleteDateNotNull.stream().forEach(this::deleteAgency);
  }

  private void deleteAgency(Agency agency) {
    try {
      agencyPostcodeRangeRepository.deleteAllByAgencyId(agency.getId());
      agencyRepository.delete(agency);
      log.info("agency with id {} has been deleted.", agency.getId());
    } catch (Exception ex) {
      log.error("Error while deleting agency with id {}", agency.getId(), ex);
    }
  }
}
