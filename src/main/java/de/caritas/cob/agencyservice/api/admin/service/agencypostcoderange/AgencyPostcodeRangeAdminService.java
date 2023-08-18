package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.springframework.util.CollectionUtils.isEmpty;

import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.model.PostcodeRangeDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRangeRepository;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service class to handle agency postcode range admin requests.
 */
@Service
@RequiredArgsConstructor
public class AgencyPostcodeRangeAdminService {

  private final @NonNull AgencyPostcodeRangeRepository agencyPostCodeRangeRepository;
  private final @NonNull AgencyService agencyService;
  private final @NonNull AgencyAdminService agencyAdminService;
  private final PostcodeRangeValidator postcodeRangeValidator = new PostcodeRangeValidator();
  @Value("${multitenancy.enabled}")
  private boolean multitenancy;


  /**
   * Returns all post code ranges by given agency id.
   *
   * @param agencyId the agency id
   * @return {@link AgencyPostcodeRangeResponseDTO}
   */
  public AgencyPostcodeRangeResponseDTO findPostcodeRangesForAgency(Long agencyId) {

    var agencyPostcodeRanges =
        this.agencyPostCodeRangeRepository.findAllByAgencyId(agencyId);

    return AgencyPostcodeRangeResponseDTOBuilder.getInstance(agencyPostcodeRanges, agencyId)
        .build();
  }

  /**
   * Deletes a {@link AgencyPostcodeRange} by given id.
   *
   * @param agencyId the postcode range id
   */
  @Transactional
  public void deleteAgencyPostcodeRange(Long agencyId) {
    if (!multitenancy) {
      markAgencyOffline(agencyId);
    }
    this.agencyPostCodeRangeRepository.deleteAllByAgencyId(agencyId);
  }

  private void markAgencyOffline(Long agencyId) {
    var agencyPostCodeRanges = this.agencyPostCodeRangeRepository
        .findAllByAgencyId(agencyId);

    if (agencyPostCodeRanges.isEmpty()) {
      throw new NotFoundException();
    }

    this.agencyService.setAgencyOffline(agencyId);
  }

  /**
   * Saves the given postcode range for the provided agency.
   *
   * @param agencyId         agency ID to save the postcode range for
   * @param postcodeRangeDTO {@link PostcodeRangeDTO}
   * @return {@link AgencyPostcodeRangeResponseDTO}
   */
  @Transactional
  public AgencyPostcodeRangeResponseDTO createPostcodeRanges(Long agencyId,
      PostcodeRangeDTO postcodeRangeDTO) {
    var agency = agencyAdminService.findAgencyById(agencyId);

    return validateAndSavePostcodeRanges(postcodeRangeDTO, agency);
  }

  private AgencyPostcodeRangeResponseDTO validateAndSavePostcodeRanges(
      PostcodeRangeDTO postCodeRangeDTO, Agency agency) {

    var newAgencyPostcodeRanges = new PostcodeRangeTransformer()
        .extractPostcodeRanges(postCodeRangeDTO.getPostcodeRanges());
    var existingAgencyPostcodeRanges = new ArrayList<>(
        agencyPostCodeRangeRepository.findAllByAgencyId(agency.getId()));

    this.postcodeRangeValidator.validatePostcodeRanges(newAgencyPostcodeRanges);

    var agencyPostcodeRangesToSave = newAgencyPostcodeRanges.stream()
        .map(postcodeRange -> enrichPostcodeRangeToSave(postcodeRange, agency))
        .filter(postcodeRange -> !existingAgencyPostcodeRanges.contains(postcodeRange))
        .collect(Collectors.toSet());

    this.postcodeRangeValidator.validatePostcodeRangeForIntersection(agencyPostcodeRangesToSave,
        existingAgencyPostcodeRanges);

    var agencyPostcodeRangesToRemove = existingAgencyPostcodeRanges.stream()
        .filter(postcodeRange -> !newAgencyPostcodeRanges.contains(postcodeRange))
        .collect(Collectors.toSet());

    agencyPostcodeRangesToSave.forEach(this.agencyPostCodeRangeRepository::save);
    agencyPostcodeRangesToRemove.forEach(this.agencyPostCodeRangeRepository::delete);

    var updatedAgencyPostcodeRanges =
        this.agencyPostCodeRangeRepository.findAllByAgencyId(agency.getId());

    return AgencyPostcodeRangeResponseDTOBuilder
        .getInstance(updatedAgencyPostcodeRanges, agency.getId())
        .build();
  }

  private AgencyPostcodeRange enrichPostcodeRangeToSave(AgencyPostcodeRange postCodeRange,
      Agency agency) {
    postCodeRange.setAgency(agency);
    postCodeRange.setCreateDate(LocalDateTime.now(ZoneOffset.UTC));
    postCodeRange.setUpdateDate(LocalDateTime.now(ZoneOffset.UTC));
    postCodeRange.setTenantId(agency.getTenantId());
    return postCodeRange;
  }

  /**
   * Updates the postcode range for the given agency Id.
   *
   * @param agencyId         agency id
   * @param postcodeRangeDTO {@link PostcodeRangeDTO}
   * @return {@link AgencyPostcodeRangeResponseDTO}
   */
  public AgencyPostcodeRangeResponseDTO updatePostcodeRange(Long agencyId,
      PostcodeRangeDTO postcodeRangeDTO) {
    var agencyPostcodeRange = agencyPostCodeRangeRepository
        .findAllByAgencyId(agencyId);

    if (isEmpty(agencyPostcodeRange)) {
      throw new NotFoundException();
    }

    return validateAndSavePostcodeRanges(postcodeRangeDTO,
        agencyPostcodeRange.iterator().next().getAgency());
  }
}
