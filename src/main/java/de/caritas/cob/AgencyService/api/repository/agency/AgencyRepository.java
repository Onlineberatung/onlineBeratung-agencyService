package de.caritas.cob.AgencyService.api.repository.agency;

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
   * @param postCode
   * @param length
   * @return
   */
  @Query(
      value = "SELECT a.id, a.diocese_id, a.name, a.description, a.postcode, a.city, a.is_team_agency, a.consulting_type, a.is_offline, a.delete_date FROM agency a "
          + "INNER JOIN agency_postcode_range r ON a.id = r.agency_id "
          + "WHERE (CAST(:postcode AS INT) BETWEEN CAST(SUBSTR(r.postcode_from, 1, :length) AS int) "
          + "AND CAST(SUBSTR(r.postcode_to, 1, :length) AS int)) " + "AND a.is_offline = false "
          + "AND a.consulting_type = :#{T(de.caritas.cob.AgencyService.api.repository.agency.ConsultingType).#type.value} "
          + "AND a.delete_date IS NULL " + "GROUP BY a.id ORDER BY a.postcode DESC",
      nativeQuery = true)
  List<Agency> findByPostCodeAndConsultingType(@Param(value = "postcode") String postCode,
      @Param(value = "length") int length, @Param(value = "type") ConsultingType consultingType);

  Optional<Agency> findByIdAndDeleteDateNull(Long agencyId);
}
