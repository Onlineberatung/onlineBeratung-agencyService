package de.caritas.cob.agencyservice.api.repository.diocese;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.Optional;

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

  Optional<Diocese> findById(Long id);
}