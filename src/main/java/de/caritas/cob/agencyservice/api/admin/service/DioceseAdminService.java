package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.api.admin.hallink.DiocesePaginationLinkBuilder;
import de.caritas.cob.agencyservice.api.model.DioceseAdminResultDTO;
import de.caritas.cob.agencyservice.api.model.DioceseResponseDTO;
import de.caritas.cob.agencyservice.api.model.PaginationLinks;
import de.caritas.cob.agencyservice.api.repository.diocese.Diocese;
import de.caritas.cob.agencyservice.api.repository.diocese.DioceseRepository;

import java.util.List;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

/**
 * Service class to handle diocese admin requests
 */

@Service
@RequiredArgsConstructor
public class DioceseAdminService {

  private static final String DIOCESE_SORT_BY_COLUMN = "name";

  private final @NonNull DioceseRepository dioceseRepository;

  /**
   * Returns all dioceses within the given page and perPage offsets.
   *
   * @param page    Number of page where to start in the query (1 = first page) (required) * @param
   * @param perPage Number of items which are being returned per page (required)
   * @return {@link DioceseAdminResultDTO}
   */
  public DioceseAdminResultDTO findAllDioceses(Integer page, Integer perPage) {
    Pageable pageable = PageRequest.of(Math.max(page - 1, 0), Math.max(perPage, 1),
        Sort.by(DIOCESE_SORT_BY_COLUMN).ascending());

    Page<Diocese> resultPage = dioceseRepository.findAll(pageable);

    return new DioceseAdminResultDTO().embedded(buildDioceseResponseList(resultPage))
        .links(buildPaginationLinks(page, perPage, resultPage.getTotalPages()));
  }

  private List<DioceseResponseDTO> buildDioceseResponseList(Page<Diocese> page) {
    return page
        .stream()
        .map(this::fromDiocese)
        .collect(Collectors.toList());
  }

  private DioceseResponseDTO fromDiocese(Diocese diocese) {
    return new DioceseResponseDTO()
        .dioceseId(diocese.getDioceseId())
        .name(diocese.getName())
        .createDate(String.valueOf(diocese.getCreateDate()))
        .updateDate(String.valueOf(diocese.getUpdateDate()));
  }

  private PaginationLinks buildPaginationLinks(Integer page, Integer perPage, Integer totalPages) {
    return DiocesePaginationLinkBuilder
        .getInstance()
        .withPage(page)
        .withPerPage(perPage)
        .withTotalPages(totalPages)
        .buildPaginationLinks();
  }
}
