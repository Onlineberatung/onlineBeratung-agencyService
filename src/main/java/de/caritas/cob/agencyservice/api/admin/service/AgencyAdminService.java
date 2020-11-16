package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.api.admin.hallink.SearchResultLinkBuilder;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyAdminSearchResultDTO;
import de.caritas.cob.agencyservice.api.model.SearchResultLinks;
import java.util.List;
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
        .searchAgencies(q, page, perPage);

    SearchResultLinks searchResultLinks = SearchResultLinkBuilder.getInstance()
        .withPage(page)
        .withPerPage(perPage)
        .withKeyword(q)
        .buildSearchResultLinks();

    return new AgencyAdminSearchResultDTO()
        .embedded(searchResultItems)
        .links(searchResultLinks);
  }

}
