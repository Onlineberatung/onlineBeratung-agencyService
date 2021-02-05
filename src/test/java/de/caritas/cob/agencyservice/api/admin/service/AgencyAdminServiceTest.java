package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import de.caritas.cob.agencyservice.api.service.LogService;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_SUCHT;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.powermock.api.mockito.PowerMockito.when;
import static org.powermock.reflect.Whitebox.setInternalState;

import java.util.Optional;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.slf4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class AgencyAdminServiceTest {

  @InjectMocks
  AgencyAdminService agencyAdminService;
  @Mock
  AgencyRepository agencyRepository;
  @Mock
  private Logger logger;

  @Before
  public void setup() {
    setInternalState(LogService.class, "LOGGER", logger);
  }

  @Test(expected = InternalServerErrorException.class)
  public void saveAgency_Should_logExpectedErrorMessage_WhenDatabaseError() {

    when(agencyRepository.save(Mockito.any())).thenThrow(mock(DataAccessException.class));

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setConsultingType(ConsultingType.SOCIAL.getValue());
    agencyAdminService.saveAgency(agencyDTO);

    verify(this.logger, times(1)).error(eq("Database error while saving agency"));

  }

  @Test(expected = InternalServerErrorException.class)
  public void updateAgency_Should_logExpectedErrorMessage_WhenDatabaseError() {

    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.of(AGENCY_SUCHT));
    when(agencyRepository.save(Mockito.any())).thenThrow(mock(DataAccessException.class));

    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    agencyAdminService.updateAgency(AGENCY_ID, updateAgencyDTO);

    verify(this.logger, times(1)).error(eq("Database error while saving agency"));

  }

  @Test(expected = NotFoundException.class)
  public void updateAgency_Should_ThrowNotFoundException_WhenAgencyIsNotFound() {

    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.empty());

    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    agencyAdminService.updateAgency(AGENCY_ID, updateAgencyDTO);

  }

  @Test(expected = InternalServerErrorException.class)
  public void findAgencyById_Should_logExpectedMessage_WhenDatabaseError() {
    when(agencyRepository.findById(AGENCY_ID)).thenThrow(mock(DataAccessException.class));

    agencyAdminService.findAgencyById(AGENCY_ID);

    verify(this.logger, times(1))
        .info(eq(String.format("Database error while getting agency with id %s", AGENCY_ID)));
  }

  @Test(expected = NotFoundException.class)
  public void findAgencyById_Should_ThrowNotFoundException_WhenAgencyIsNotFound() {
    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.empty());

    agencyAdminService.findAgencyById(AGENCY_ID);
  }
}
