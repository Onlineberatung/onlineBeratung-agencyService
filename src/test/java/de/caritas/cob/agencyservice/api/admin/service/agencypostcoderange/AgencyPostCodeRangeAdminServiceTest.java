package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import java.util.Optional;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class AgencyPostCodeRangeAdminServiceTest {

  @InjectMocks
  private AgencyPostCodeRangeAdminService agencyPostCodeRangeAdminService;

  @Mock
  private AgencyService agencyService;

  @Mock
  private AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;

  @Test
  public void deleteAgencyPostcodeRange_Should_setAgencyOffline_When_givenPostcodeRangeIsTheLast() {
    AgencyPostCodeRange postCodeRange = new AgencyPostCodeRange();
    Agency agency = new Agency();
    postCodeRange.setAgency(agency);
    when(this.agencyPostCodeRangeRepository.findById(anyLong()))
        .thenReturn(Optional.of(postCodeRange));

    this.agencyPostCodeRangeAdminService.deleteAgencyPostcodeRange(1L);

    verify(this.agencyService, times(1)).setAgencyOffline(any());
  }

  @Test
  public void deleteAgencyPostcodeRange_Should_notSetAgencyOffline_When_givenPostcodeRangeIsNotTheLast() {
    AgencyPostCodeRange postCodeRange = new EasyRandom().nextObject(AgencyPostCodeRange.class);
    when(this.agencyPostCodeRangeRepository.findById(anyLong()))
        .thenReturn(Optional.of(postCodeRange));

    this.agencyPostCodeRangeAdminService.deleteAgencyPostcodeRange(1L);

    verifyNoInteractions(this.agencyService);
  }

}
