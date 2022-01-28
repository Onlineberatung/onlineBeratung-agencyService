package de.caritas.cob.agencyservice.api.repository.agencypostcoderange;

import java.util.Optional;
import java.util.Set;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 * Repository for {@link AgencyPostcodeRange}.
 */
public interface AgencyPostcodeRangeRepository extends CrudRepository<AgencyPostcodeRange, Long> {

  /**
   * Find all {@link AgencyPostcodeRange}s for given agency id.
   *
   * @param agencyId the agency id
   * @return {@link Page} of {@link AgencyPostcodeRange}
   */
  Set<AgencyPostcodeRange> findAllByAgencyId(Long agencyId);

  /**
   * Count the amount of agency postcode ranges for a given agency id.
   *
   * @param agencyId the agency id
   * @return the amount of postcode ranges
   */
  long countAllByAgencyId(Long agencyId);

  /**
   * Deletes all associated postcodeRanges of a given agency id.
   *
   * @param agencyId the agency id
   */
  void deleteAllByAgencyId(Long agencyId);


  @Query("select a from AgencyPostcodeRange as a where a.id = :var ")
  Optional<AgencyPostcodeRange> findById(Long var);
}
