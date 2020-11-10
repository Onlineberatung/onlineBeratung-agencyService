package de.caritas.cob.agencyservice.api.repository.agency;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

/**
 * Repository for the AgencyPostCodeRange entity.
 */
public interface AgencyPostCodeRangeRepository extends CrudRepository<AgencyPostCodeRange, Long> {

  List<AgencyPostCodeRange> findByAgency(Agency agency);

}
