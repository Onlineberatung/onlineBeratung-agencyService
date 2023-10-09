package de.caritas.cob.agencyservice.api.repository.agency;

import java.util.List;
import java.util.Optional;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 * Repository for the Agency entity in tenant context
 */
@Primary
@ConditionalOnExpression("${multitenancy.enabled:true}")
public interface AgencyTenantAwareRepository extends JpaRepository<Agency, Long>, AgencyRepository {


  String AND_A_TENANT_ID_FILTER = "AND a.tenant_id = :tenantId ";

  /**
   * Returns a list of {@link Agency}s that are assigned to the given post code based on tenant id.
   *
   * @param postCode the postcode
   * @param length   the length
   * @return a {@link List} of {@link Agency} instances
   */
  @Query(
      value = SELECT_WITHOUT_TOPICS
          + AND_A_TENANT_ID_FILTER
          + GROUP_BY_ORDER_BY,
      nativeQuery = true)
  List<Agency> searchWithoutTopic(@Param(value = "postcode") String postCode,
      @Param(value = "length") int length, @Param(value = "type") Integer consultingTypeId,
      @Param(value = "age") Integer age,
      @Param(value = "gender") String gender,
      @Param(value = "counselling_relation") String counsellingRelation,
      @Param(value = "tenantId") Long tenantId);

  @Query(
      value = SELECT_WITH_TOPICS
          + AND_A_TENANT_ID_FILTER
          + GROUP_BY_ORDER_BY,
      nativeQuery = true)
  List<Agency> searchWithTopic(@Param(value = "postcode") String postCode,
      @Param(value = "length") int length, @Param(value = "type") Integer consultingTypeId,
      @Param(value = "topicId") int topicId,
      @Param(value = "age") Integer age,
      @Param(value = "gender") String gender,
      @Param(value = "counselling_relation") String counsellingRelation,
      Long tenantId);

  @Query("select a from Agency as a where a.id = :agencyId ")
  Optional<Agency> findById(Long agencyId);

  Optional<Agency> findByIdAndDeleteDateNull(Long agencyId);

  List<Agency> findByIdIn(List<Long> agencyIds);

  List<Agency> findByConsultingTypeId(int consultingTypeId);

}
