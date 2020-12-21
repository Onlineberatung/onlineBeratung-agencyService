package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.POSTCODE_RANGE_ID;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;
import static org.powermock.reflect.Whitebox.setInternalState;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import de.caritas.cob.agencyservice.api.service.LogService;
import java.util.Collections;
import java.util.Optional;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.slf4j.Logger;
import org.springframework.dao.DataAccessException;

@RunWith(MockitoJUnitRunner.class)
public class AgencyPostCodeRangeAdminServiceTest {

  @InjectMocks
  private AgencyPostCodeRangeAdminService agencyPostCodeRangeAdminService;
  @Mock
  private AgencyService agencyService;
  @Mock
  private AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;
  @Mock
  private Logger logger;

  @Before
  public void setup() {
    setInternalState(LogService.class, "LOGGER", logger);
  }

  @Test
  public void deleteAgencyPostcodeRange_Should_setAgencyOffline_When_givenPostcodeRangeIsTheLast() {
    AgencyPostCodeRange postCodeRange = new AgencyPostCodeRange();
    Agency agency = new Agency();
    agency.setAgencyPostCodeRanges(Collections.singletonList(postCodeRange));
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

  @Test(expected = InternalServerErrorException.class)
  public void deleteAgencyPostcodeRange_Should_ThrowInternalServerErrorAndLogDatabaseError_When_DatabaseError() {

    AgencyPostCodeRange postCodeRange = new EasyRandom().nextObject(AgencyPostCodeRange.class);
    when(this.agencyPostCodeRangeRepository.findById(anyLong()))
        .thenReturn(Optional.of(postCodeRange));
    doThrow(new DataAccessException("database error") {}).when(this.agencyPostCodeRangeRepository).deleteById(anyLong());

    this.agencyPostCodeRangeAdminService.deleteAgencyPostcodeRange(POSTCODE_RANGE_ID);

    verify(this.logger, times(1)).info(eq(String
        .format("Error while deleting agency post code range with id %s",
            POSTCODE_RANGE_ID)));

  }

}
