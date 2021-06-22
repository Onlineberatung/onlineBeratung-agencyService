package de.caritas.cob.agencyservice.api.repository.agency;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 * Repository for the Agency entity
 *
 */
public interface AgencyRepository extends CrudRepository<Agency, Long> {

  /**
   * Returns a list of {@link Agency}s that are assigned to the given post code.
   *
   * @param postCode the postcode
   * @param length the length
   * @return a {@link List} of {@link Agency} instances
   */
  @Query(
      value = "SELECT a.id, a.diocese_id, a.name, a.description, a.postcode, a.city, a"
          + ".is_team_agency, a.consulting_type, a.is_offline, a.url, a.is_external, "
          + "a.delete_date, a.create_date, a.update_date FROM agency a "
          + "INNER JOIN agency_postcode_range r ON a.id = r.agency_id "
          + "WHERE (CAST(:postcode AS INT) BETWEEN CAST(SUBSTR(r.postcode_from, 1, :length) AS int) "
          + "AND CAST(SUBSTR(r.postcode_to, 1, :length) AS int)) " + "AND a.is_offline = false "
          + "AND a.consulting_type = :type "
          + "AND a.delete_date IS NULL " + "GROUP BY a.id ORDER BY a.postcode DESC",
      nativeQuery = true)
  List<Agency> findByPostCodeAndConsultingTypeId(@Param(value = "postcode") String postCode,
      @Param(value = "length") int length, @Param(value = "type") int consultingTypeId);

  Optional<Agency> findByIdAndDeleteDateNull(Long agencyId);

  List<Agency> findByIdIn(List<Long> agencyIds);

  List<Agency> findByConsultingTypeId(int consultingTypeId);

}
