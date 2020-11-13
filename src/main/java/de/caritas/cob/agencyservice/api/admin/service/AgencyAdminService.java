package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.api.admin.hallink.SearchResultLinkBuilder;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyAdminSearchResultDTO;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
import de.caritas.cob.agencyservice.api.model.SearchResultLinks;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyPostCodeRange;
import java.util.List;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Builder to search agencies and generate the required {@link AgencyAdminSearchResultDTO}.
 */
@Service
@RequiredArgsConstructor
public class AgencyAdminService {

  private final @NonNull AgencyAdminSearchService agencyAdminSearchService;
  private final @NonNull AgencyPostCodeRangeService agencyPostCodeRangeService;

  /**
   * Searches for agencies and generates a {@link AgencyAdminSearchResultDTO} containing hal links.
   *
   * @param q the keyword to search for
   * @param page the selected page
   * @param perPage number of results for one page
   * @return a generated {@link AgencyAdminSearchResultDTO}
   */
  public AgencyAdminSearchResultDTO buildAgencyAdminSearchResult(String q, Integer page,
      Integer perPage) {
    List<AgencyAdminResponseDTO> searchResultItems = this.agencyAdminSearchService
        .searchAgencies(q, page, perPage)
        .stream()
        .map(this::fromAgency)
        .collect(Collectors.toList());

    SearchResultLinks searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withPage(page)
        .withPerPage(perPage)
        .withKeyword(q)
        .buildSearchResultLinks();

    return new AgencyAdminSearchResultDTO()
        .embedded(searchResultItems)
        .links(searchResultLinks);
  }

  private AgencyAdminResponseDTO fromAgency(Agency agency) {
    List<PostCodeRangeDTO> postCodeRanges = this.agencyPostCodeRangeService
        .findPostCodeRangeByAgency(agency)
        .stream()
        .map(this::fromAgencyPostCodeRange)
        .collect(Collectors.toList());

    return new AgencyAdminResponseDTO()
        .agencyId(agency.getId())
        .dioceseId(agency.getDioceseId())
        .name(agency.getName())
        .city(agency.getCity())
        .consultingType(agency.getConsultingType().getValue())
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
