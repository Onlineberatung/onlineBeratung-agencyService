package de.caritas.cob.agencyservice.api.repository.agency;

import de.caritas.cob.agencyservice.api.repository.TenantUnaware;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * Repository for the Agency entity
 *
 */
@Repository("agencyTenantUnawareRepository")
@TenantUnaware
public interface AgencyTenantUnawareRepository extends JpaRepository<Agency, Long>, AgencyRepository {

  @Query(
      value = SELECT_WITHOUT_TOPICS
          + GROUP_BY_ORDER_BY,
      nativeQuery = true)
  List<Agency> searchWithoutTopic(@Param(value = "postcode") String postCode,
      @Param(value = "length") int length, @Param(value = "type") Integer consultingTypeId,
      @Param(value = "age") Integer age,
      @Param(value = "gender") String gender,
      Long tenantId);


  @Query(
      value = SELECT_WITH_TOPICS
          + GROUP_BY_ORDER_BY,
      nativeQuery = true)
  List<Agency> searchWithTopic(@Param(value = "postcode") String postCode,
      @Param(value = "length") int length, @Param(value = "type") Integer consultingTypeId,
      @Param(value = "topicId") int topicId,
      @Param(value = "age") Integer age,
      @Param(value = "gender") String gender,
      Long tenantId);

  Optional<Agency> findByIdAndDeleteDateNull(Long agencyId);

  List<Agency> findByIdIn(List<Long> agencyIds);

  List<Agency> findByConsultingTypeId(int consultingTypeId);

  List<Agency> findByTenantId(Long tenantId);
}
