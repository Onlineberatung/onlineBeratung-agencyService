package de.caritas.cob.agencyservice.api.repository.diocese;

import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Repository for {@link Diocese}.
 */
public interface DioceseRepository extends PagingAndSortingRepository<Diocese, Long> {

  /**
   * Find all {@link Diocese}s.
   *
   * @param pageable {@link Pageable} for pagination
   * @return {@link Page} of {@link Diocese}
   */
  Page<Diocese> findAll(Pageable pageable);


  @Query("select a from Diocese as a where a.dioceseId = :var ")
  Optional<Diocese> findById(Long var);

}