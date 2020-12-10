package de.caritas.cob.agencyservice.api.repository.agencypostcoderange;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

/**
 * Repository for {@link AgencyPostCodeRange}.
 */
public interface AgencyPostCodeRangeRepository extends CrudRepository<AgencyPostCodeRange, Long> {

  /**
   * Find all {@link AgencyPostCodeRange}s for given agency id.
   *
   * @param agencyId the agency id
   * @param pageable {@link Pageable} for pagination
   * @return {@link Page} of {@link AgencyPostCodeRange}
   */
  Page<AgencyPostCodeRange> findAllByAgencyId(Long agencyId, Pageable pageable);

}
