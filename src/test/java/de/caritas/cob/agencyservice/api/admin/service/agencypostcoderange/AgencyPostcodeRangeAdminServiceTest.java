package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.not;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.powermock.api.mockito.PowerMockito.when;
import static org.powermock.reflect.Whitebox.setInternalState;
import static org.springframework.test.util.ReflectionTestUtils.setField;

import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.PostcodeRangeDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRange;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRangeRepository;
import de.caritas.cob.agencyservice.api.service.AgencyService;
import de.caritas.cob.agencyservice.api.service.LogService;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.slf4j.Logger;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class AgencyPostcodeRangeAdminServiceTest {

  @InjectMocks
  private AgencyPostcodeRangeAdminService agencyPostcodeRangeAdminService;
  @Mock
  private AgencyAdminService agencyAdminService;
  @Mock
  private AgencyService agencyService;
  @Mock
  private PostcodeRangeValidator postcodeRangeValidator;
  @Mock
  private AgencyPostcodeRangeRepository agencyPostcodeRangeRepository;
  @Mock
  private Logger logger;

  private PostcodeRangeDTO postcodeRangeDTO;
  private EasyRandom easyRandom;

  @Before
  public void setup() {
    this.easyRandom = new EasyRandom();
    this.postcodeRangeDTO = this.easyRandom.nextObject(PostcodeRangeDTO.class);
    setField(agencyPostcodeRangeAdminService, "postcodeRangeValidator", postcodeRangeValidator);
    setInternalState(LogService.class, "LOGGER", logger);
  }

  @Test
  public void deleteAgencyPostcodeRange_Should_setAgencyOffline_When_givenPostcodeRangeIsTheLast() {
    var postcodeRange = new AgencyPostcodeRange();
    var agency = new Agency();
    agency.setAgencyPostcodeRanges(Collections.singletonList(postcodeRange));
    postcodeRange.setAgency(agency);
    when(this.agencyPostcodeRangeRepository.findAllByAgencyId(anyLong()))
        .thenReturn(Set.of(postcodeRange));

    this.agencyPostcodeRangeAdminService.deleteAgencyPostcodeRange(1L);

    verify(this.agencyService, times(1)).setAgencyOffline(any());
  }

  @Test
  public void createPostcodeRange_Should_ValidatePostcodeRanges() {
    when(agencyAdminService.findAgencyById(anyLong()))
        .thenReturn(easyRandom.nextObject(Agency.class));
    when(agencyPostcodeRangeRepository.save(any())).thenReturn(easyRandom.nextObject(
        AgencyPostcodeRange.class));

    agencyPostcodeRangeAdminService.createPostcodeRanges(AGENCY_ID, postcodeRangeDTO);

    verify(postcodeRangeValidator, times(1)).validatePostcodeRanges(any());
  }

  @Test
  public void createPostcodeRange_Should_SavePostcodeRange_WhenEveryParameterIsValid() {
    when(agencyAdminService.findAgencyById(anyLong()))
        .thenReturn(easyRandom.nextObject(Agency.class));
    when(agencyPostcodeRangeRepository.save(any())).thenReturn(easyRandom.nextObject(
        AgencyPostcodeRange.class));

    agencyPostcodeRangeAdminService.createPostcodeRanges(AGENCY_ID, postcodeRangeDTO);

    verify(agencyPostcodeRangeRepository, times(1))
        .save(any());
  }

  @Test
  public void updatePostcodeRange_Should_ValidatePostcodeRanges() {
    when(agencyPostcodeRangeRepository.findAllByAgencyId(anyLong()))
        .thenReturn((Set.of(easyRandom.nextObject(AgencyPostcodeRange.class))));
    when(agencyPostcodeRangeRepository.save(any())).thenReturn(easyRandom.nextObject(
        AgencyPostcodeRange.class));

    agencyPostcodeRangeAdminService.updatePostcodeRange(AGENCY_ID, postcodeRangeDTO);

    verify(postcodeRangeValidator, times(1)).validatePostcodeRanges(any());
  }

  @Test
  public void updatePostcodeRange_Should_SavePostcodeRange_WhenEveryParameterIsValid() {
    when(agencyPostcodeRangeRepository.findAllByAgencyId(anyLong()))
        .thenReturn((Set.of(easyRandom.nextObject(AgencyPostcodeRange.class))));
    when(agencyPostcodeRangeRepository.save(any())).thenReturn(easyRandom.nextObject(
        AgencyPostcodeRange.class));

    agencyPostcodeRangeAdminService.updatePostcodeRange(AGENCY_ID, postcodeRangeDTO);

    verify(agencyPostcodeRangeRepository, times(1)).save(any());
  }

  @Test
  @SuppressWarnings("unchecked")
  public void updatePostcodeRange_Should_RemovePostcodeToOverwrite_BeforeValidation() {
    AgencyPostcodeRange agencyPostCodeRange = easyRandom.nextObject(AgencyPostcodeRange.class);

    when(agencyPostcodeRangeRepository.findAllByAgencyId(anyLong()))
        .thenReturn(Set.of(agencyPostCodeRange));
    when(agencyPostcodeRangeRepository.save(any())).thenReturn(easyRandom.nextObject(
        AgencyPostcodeRange.class));

    agencyPostcodeRangeAdminService.updatePostcodeRange(AGENCY_ID, postcodeRangeDTO);
    ArgumentCaptor<Set<AgencyPostcodeRange>> captor = ArgumentCaptor.forClass((Class) List.class);
    verify(postcodeRangeValidator).validatePostcodeRanges(captor.capture());
    assertThat(captor.getValue(), not(hasItem(agencyPostCodeRange)));
  }

  @Test(expected = NotFoundException.class)
  public void updatePostcodeRange_Should_Throw_NotFoundException_When_noPostcodeRangeExistsForAgency() {
    agencyPostcodeRangeAdminService.updatePostcodeRange(AGENCY_ID, postcodeRangeDTO);
  }
}
