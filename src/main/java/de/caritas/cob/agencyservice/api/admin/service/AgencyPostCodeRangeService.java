package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyPostCodeRangeRepository;
import java.util.List;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * Wrapper service to provide cached access to {@link AgencyPostCodeRange}.
 */
@Service
@RequiredArgsConstructor
public class AgencyPostCodeRangeService {

  private final @NonNull AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;

  /**
   * Finds all related {@link AgencyPostCodeRange} for given {@link Agency}.
   *
   * @param agency the {@link Agency} to search {@link AgencyPostCodeRange} for
   * @return a list conaining all regarding {@link AgencyPostCodeRange}
   */
  @Cacheable("findPostCodeRangeByAgency")
  public List<AgencyPostCodeRange> findPostCodeRangeByAgency(Agency agency) {
    return this.agencyPostCodeRangeRepository.findByAgency(agency);
  }

}
