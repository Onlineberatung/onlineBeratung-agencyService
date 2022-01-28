package de.caritas.cob.agencyservice.api.repository.agency;

import java.util.List;
import java.util.Optional;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Repository for the Agency entity in tenant context
 */
@Primary
@ConditionalOnExpression("${multitenancy.enabled:true}")
public interface AgencyTenantAwareRepository extends AgencyRepository {

  /**
   * Returns a list of {@link Agency}s that are assigned to the given post code based on tenant id.
   *
   * @param postCode the postcode
   * @param length   the length
   * @return a {@link List} of {@link Agency} instances
   */
  @Query(
      value = "SELECT a.id, a.diocese_id, a.name, a.description, a.postcode, a.city, a"
          + ".is_team_agency, a.consulting_type, a.is_offline, a.url, a.is_external, "
          + "a.delete_date, a.create_date, a.update_date, a.tenant_id FROM agency a "
          + "INNER JOIN agency_postcode_range r ON a.id = r.agency_id "
          + "WHERE (CAST(:postcode AS INT) BETWEEN CAST(SUBSTR(r.postcode_from, 1, :length) AS int) "
          + "AND CAST(SUBSTR(r.postcode_to, 1, :length) AS int)) " + "AND a.is_offline = false "
          + "AND a.consulting_type = :type "
          + "AND a.tenant_id = :tenantId "
          + "AND a.delete_date IS NULL " + "GROUP BY a.id ORDER BY a.postcode DESC",
      nativeQuery = true)
  List<Agency> findByPostCodeAndConsultingTypeId(@Param(value = "postcode") String postCode,
      @Param(value = "length") int length, @Param(value = "type") int consultingTypeId,
      @Param(value = "tenantId") Long tenantId);

  @Query("select a from Agency as a where a.id = :var ")
  Optional<Agency> findById(Long var);

}
