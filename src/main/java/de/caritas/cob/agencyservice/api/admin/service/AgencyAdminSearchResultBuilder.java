package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyPostCodeRangeRepository;
import java.util.List;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class AgencyAdminSearchResultBuilder {

  private final @NonNull AgencyAdminSearchService agencyAdminSearchService;
  private final @NonNull AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;

  public List<AgencyAdminResponseDTO> buildAgencyAdminSearchResult(String q, Integer page,
      Integer perPage) {
    return this.agencyAdminSearchService.searchAgencies(q, page, perPage)
        .stream()
        .map(this::fromAgency)
        .collect(Collectors.toList());
  }

  private AgencyAdminResponseDTO fromAgency(Agency agency) {
    List<PostCodeRangeDTO> postCodeRanges = this.agencyPostCodeRangeRepository.findByAgency(agency)
        .stream()
        .map(this::fromAgencyPostCodeRange)
        .collect(Collectors.toList());

    return new AgencyAdminResponseDTO()
        .agencyId(agency.getId())
        .dioceseId(agency.getDioceseId())
        .name(agency.getName())
        .city(agency.getCity())
        .consultingType(agency.getConsultingType().name())
        .description(agency.getDescription())
        .postcode(agency.getPostCode())
        .teamAgency(agency.isTeamAgency())
        .offline(agency.isOffline())
        .createDate(String.valueOf(agency.getCreateDate()))
        .updateDate(String.valueOf(agency.getUpdateDate()))
        .deleteDate(String.valueOf(agency.getDeleteDate()))
        .postCodeRanges(postCodeRanges);
  }

  private PostCodeRangeDTO fromAgencyPostCodeRange(AgencyPostCodeRange agencyPostCodeRange) {
    return new PostCodeRangeDTO()
        .postcodeFrom(agencyPostCodeRange.getPostCodeFrom())
        .postcodeTo(agencyPostCodeRange.getPostCodeTo());
  }

}
