package de.caritas.cob.agencyservice.api.admin.service;

import static de.caritas.cob.agencyservice.api.repository.agency.Agency.SEARCH_ANALYZER;
import static org.apache.commons.lang3.StringUtils.isBlank;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.apache.lucene.search.Query;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.FullTextQuery;
import org.hibernate.search.jpa.Search;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AgencyAdminSearchService {

  private static final String NAME_SEARCH_FIELD = "name";
  private static final String POST_CODE_SEARCH_FIELD = "postCode";
  private static final String CITY_SEARCH_FIELD = "city";
  private static final String DIOCESE_ID_SEARCH_FIELD = "dioceseId";

  private final @NonNull EntityManagerFactory entityManagerFactory;

  /**
   * Searches for {@link List<Agency>} by given keyword limited by perPage.
   *
   * @param keyword the keyword to search for
   * @param page the current requested page
   * @param perPage the amount of items in one page
   * @return the result list
   */
  public List<Agency> searchAgencies(final String keyword, final Integer page,
      final Integer perPage) {
    FullTextEntityManager fullTextEntityManager = Search
        .getFullTextEntityManager(entityManagerFactory.createEntityManager());

    Query query = isBlank(keyword) ? buildUnfilteredQuery(fullTextEntityManager) :
        buildFullTextSearchQuery(keyword, fullTextEntityManager);

    FullTextQuery fullTextQuery = fullTextEntityManager.createFullTextQuery(query, Agency.class);
    fullTextQuery.setMaxResults(Math.max(perPage, 0));
    fullTextQuery.setFirstResult(Math.max((page - 1) * perPage, 0));

    return fullTextQuery.getResultList();
  }

  private Query buildUnfilteredQuery(FullTextEntityManager fullTextEntityManager) {
    return fullTextEntityManager.getSearchFactory()
        .buildQueryBuilder()
        .forEntity(Agency.class)
        .get()
        .all()
        .createQuery();
  }

  private Query buildFullTextSearchQuery(String keyword,
      FullTextEntityManager fullTextEntityManager) {
    return fullTextEntityManager.getSearchFactory()
        .buildQueryBuilder()
        .forEntity(Agency.class)
        .overridesForField(NAME_SEARCH_FIELD, SEARCH_ANALYZER)
        .overridesForField(POST_CODE_SEARCH_FIELD, SEARCH_ANALYZER)
        .overridesForField(CITY_SEARCH_FIELD, SEARCH_ANALYZER)
        .get()
        .keyword()
        .onField(DIOCESE_ID_SEARCH_FIELD).boostedTo(100)
        .andField(NAME_SEARCH_FIELD)
        .andField(POST_CODE_SEARCH_FIELD)
        .andField(CITY_SEARCH_FIELD)
        .matching(keyword)
        .createQuery();
  }

}
