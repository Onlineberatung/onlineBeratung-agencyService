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
  @Override
  List<Agency> searchWithoutTopic(@Param(value = "postcode") String postCode,
      @Param(value = "length") int length, @Param(value = "type") int consultingTypeId,
      @Param(value = "age") Integer age,
      @Param(value = "gender") String gender,
      @Param(value = "states") String states,
      @Param(value = "tenantId") Long tenantId);

  @Query(
      value = SELECT_WITH_TOPICS
          + AND_A_TENANT_ID_FILTER
          + GROUP_BY_ORDER_BY,
      nativeQuery = true)
  @Override
  List<Agency> searchWithTopic(@Param(value = "postcode") String postCode,
      @Param(value = "length") int length, @Param(value = "type") int consultingTypeId,
      @Param(value = "topicId") int topicId,
      @Param(value = "age") Integer age,
      @Param(value = "gender") String gender,
      @Param(value = "states") String states,
      Long tenantId);

  @Query("select a from Agency as a where a.id = :agencyId ")
  Optional<Agency> findById(Long agencyId);

}
