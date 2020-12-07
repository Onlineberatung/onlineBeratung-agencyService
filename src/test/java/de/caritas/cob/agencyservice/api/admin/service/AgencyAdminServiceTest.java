package de.caritas.cob.agencyservice.api.admin.service;

import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import de.caritas.cob.agencyservice.api.service.LogService;

import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.powermock.api.mockito.PowerMockito.when;
import static org.powermock.reflect.Whitebox.setInternalState;

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
  public void saveAgency_Should_logExpectedInfoMessage_WhenDatabaseError() {

    when(agencyRepository.save(Mockito.any())).thenThrow(Mockito.mock(DataAccessException.class));

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setConsultingType(ConsultingType.SOCIAL.getValue());
    agencyAdminService.saveAgency(agencyDTO);

    verify(this.logger, times(1)).info(eq("Database error while saving agency"));

  }

}
