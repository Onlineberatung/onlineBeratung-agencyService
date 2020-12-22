package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static org.hibernate.validator.internal.metadata.core.ConstraintHelper.MESSAGE;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.startsWith;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.powermock.api.mockito.PowerMockito.when;
import static org.powermock.reflect.Whitebox.setInternalState;

import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminService;
import de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange.create.PostcodeRangeValidator;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import de.caritas.cob.agencyservice.api.service.LogService;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.slf4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class AgencyPostCodeRangeAdminServiceTest {

  @InjectMocks
  private AgencyPostCodeRangeAdminService agencyPostCodeRangeAdminService;
  @Mock
  private AgencyAdminService agencyAdminService;
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

  @Test(expected = InternalServerErrorException.class)
  public void createPostcodeRange_Should_ThrowInternalServerErrorExceptionAndLogDatabaseError_WhenDatabaseErrorOccurs() {
    when(agencyAdminService.findAgencyById(anyLong()))
        .thenReturn(easyRandom.nextObject(Agency.class));
    when(agencyPostCodeRangeRepository.save(any())).thenThrow(new DataAccessException(MESSAGE) {
    });

    agencyPostCodeRangeAdminService.createPostcodeRange(AGENCY_ID, postCodeRangeDTO);

    verify(this.logger, times(1)).error(startsWith("Database error: {}"));
  }
}
