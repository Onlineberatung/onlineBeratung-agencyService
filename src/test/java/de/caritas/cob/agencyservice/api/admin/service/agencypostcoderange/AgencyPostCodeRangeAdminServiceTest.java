package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.powermock.api.mockito.PowerMockito.when;
import static org.powermock.reflect.Whitebox.setInternalState;

import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.create.PostcodeRangeValidator;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
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
import org.slf4j.Logger;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class AgencyPostCodeRangeAdminServiceTest {

  @InjectMocks
  private AgencyPostCodeRangeAdminService agencyPostCodeRangeAdminService;
  @Mock
  private AgencyAdminService agencyAdminService;
  @Mock
  private AgencyService agencyService;
  @Mock
  private PostcodeRangeValidator postcodeRangeValidator;
  @Mock
  private AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;
  @Mock
  private Logger logger;

  private PostCodeRangeDTO postCodeRangeDTO;
  private EasyRandom easyRandom;

  @Before
  public void setup() {
    this.easyRandom = new EasyRandom();
    this.postCodeRangeDTO = this.easyRandom.nextObject(PostCodeRangeDTO.class);
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

  @Test
  public void createPostcodeRange_Should_ValidatePostcodeRanges() {
    when(agencyAdminService.findAgencyById(anyLong()))
        .thenReturn(easyRandom.nextObject(Agency.class));
    when(agencyPostCodeRangeRepository.save(any())).thenReturn(easyRandom.nextObject(
        AgencyPostCodeRange.class));

    agencyPostCodeRangeAdminService.createPostcodeRange(AGENCY_ID, postCodeRangeDTO);

    verify(postcodeRangeValidator, times(1))
        .validatePostcodeRange(postCodeRangeDTO);
    verify(postcodeRangeValidator, times(1))
        .validatePostcodeRangeForAgency(any(), any());
  }

  @Test
  public void createPostcodeRange_Should_SavePostcodeRange_WhenEveryParameterIsValid() {
    when(agencyAdminService.findAgencyById(anyLong()))
        .thenReturn(easyRandom.nextObject(Agency.class));
    when(agencyPostCodeRangeRepository.save(any())).thenReturn(easyRandom.nextObject(
        AgencyPostCodeRange.class));

    agencyPostCodeRangeAdminService.createPostcodeRange(AGENCY_ID, postCodeRangeDTO);

    verify(agencyPostCodeRangeRepository, times(1))
        .save(any());
  }
}
