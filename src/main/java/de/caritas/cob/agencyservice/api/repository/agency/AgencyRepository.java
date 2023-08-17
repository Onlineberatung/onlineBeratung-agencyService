package de.caritas.cob.agencyservice.api.repository.agency;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 * Repository for the Agency entity
 *
 */
public interface AgencyRepository extends JpaRepository<Agency, Long> {

  String AND_WITH_BRACKET = "AND (";
  String SELECT_WITH_TOPICS = "SELECT a.*, :tenantId FROM agency a "
      + "INNER JOIN agency_postcode_range r ON a.id = r.agency_id "
      + "INNER JOIN agency_topic at ON a.id = at.agency_id "
      + "WHERE (CAST(:postcode AS INT) BETWEEN CAST(SUBSTR(r.postcode_from, 1, :length) AS int) "
      + "AND CAST(SUBSTR(r.postcode_to, 1, :length) AS int)) " + "AND a.is_offline = false "
      + "AND (:type is NULL OR a.consulting_type = :type) "
      + "AND at.topic_id = :topicId "
      + AND_WITH_BRACKET
      + " (:age IS NULL) OR (a.age_from <= :age)"
      + ") "
      + AND_WITH_BRACKET
      + " (:age IS NULL) OR (COALESCE(a.age_to, :age) >= :age)"
      + ") "
      + "AND ((:counselling_relation IS NULL) OR (a.counselling_relations LIKE CONCAT('%,',:counselling_relation,'%') OR a.counselling_relations LIKE CONCAT(:counselling_relation,'%'))) "
      + "AND ((:gender IS NULL) OR (a.genders LIKE CONCAT('%,',:gender,'%') OR a.genders LIKE CONCAT(:gender,'%'))) "
      + "AND a.delete_date IS NULL ";

  String SELECT_WITHOUT_TOPICS = "SELECT a.*, :tenantId FROM agency a "
      + "INNER JOIN agency_postcode_range r ON a.id = r.agency_id "
      + "WHERE "
      + "(CAST(:postcode AS INT) BETWEEN CAST(SUBSTR(r.postcode_from, 1, :length) AS int) "
      + "AND CAST(SUBSTR(r.postcode_to, 1, :length) AS int)) " + "AND a.is_offline = false "
      + "AND (:type is NULL OR a.consulting_type = :type) "
      + AND_WITH_BRACKET
      + " (:age IS NULL) OR (a.age_from <= :age)"
      + ") "
      + AND_WITH_BRACKET
      + " (:age IS NULL) OR (COALESCE(a.age_to, :age) >= :age)"
      + ") "
      + "AND ((:counselling_relation IS NULL) OR (a.counselling_relations LIKE CONCAT('%,',:counselling_relation,'%') OR a.counselling_relations LIKE CONCAT(:counselling_relation,'%'))) "
      + "AND ((:gender IS NULL) OR (a.genders LIKE CONCAT('%,',:gender,'%') OR a.genders LIKE CONCAT(:gender,'%'))) "
      + "AND a.delete_date IS NULL ";

  String GROUP_BY_ORDER_BY = "GROUP BY a.id "
      + "ORDER BY a.postcode DESC";

  /**
   * Returns a list of {@link Agency}s that are assigned to the given post code.
   *
   * @param postCode the postcode
   * @param length the length
   * @return a {@link List} of {@link Agency} instances
   */
  @Query(
      value = SELECT_WITHOUT_TOPICS
          + GROUP_BY_ORDER_BY,
      nativeQuery = true)
  List<Agency> searchWithoutTopic(@Param(value = "postcode") String postCode,
      @Param(value = "length") int length, @Param(value = "type") Integer consultingTypeId,
      @Param(value = "age") Integer age,
      @Param(value = "gender") String gender,
      @Param(value = "counselling_relation") String counsellingRelation,
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
      @Param(value = "counselling_relation") String counsellingRelation,
      Long tenantId);

  Optional<Agency> findByIdAndDeleteDateNull(Long agencyId);

  List<Agency> findByIdIn(List<Long> agencyIds);

  List<Agency> findByConsultingTypeId(int consultingTypeId);

  Optional<Agency> findById(Long agencyIds);

  List<Agency> findAllByDeleteDateNotNull();

  Agency save(Agency agency);
}
