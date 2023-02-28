package de.caritas.cob.agencyservice.api.workflow;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;

import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRangeRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class DeleteAgencyServiceTest {

  @Mock
  AgencyRepository agencyRepository;

  @Mock
  AgencyPostcodeRangeRepository agencyPostcodeRangeRepository;

  @InjectMocks
  DeleteAgencyService deleteAgencyService;

  @Test
  void deleteAgenciesMarkedForDeletion_Should_callRepositoryToDeleteAllAgenciesMarkedForDeletion() {
    // given
    Agency agency1 = new Agency();
    agency1.setId(1L);
    Agency agency2 = new Agency();
    agency2.setId(2L);
    Mockito.when(agencyRepository.findAllByDeleteDateNotNull()).thenReturn(Lists.newArrayList(
        agency1, agency2));
    // when
    deleteAgencyService.deleteAgenciesMarkedForDeletion();
    // then
    Mockito.verify(agencyPostcodeRangeRepository).deleteAllByAgencyId(agency1.getId());
    Mockito.verify(agencyRepository).delete(agency1);
    Mockito.verify(agencyPostcodeRangeRepository).deleteAllByAgencyId(agency2.getId());
    Mockito.verify(agencyRepository).delete(agency2);
  }
}