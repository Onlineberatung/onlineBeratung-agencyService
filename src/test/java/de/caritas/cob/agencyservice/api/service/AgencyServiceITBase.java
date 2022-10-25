package de.caritas.cob.agencyservice.api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;

import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.model.FullAgencyResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_PREGNANCY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_PREGNANCY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_U25;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.greaterThan;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;
import static org.powermock.api.mockito.PowerMockito.when;

public class AgencyServiceITBase {

  @Autowired
  private AgencyService agencyService;
  @Autowired
  private AgencyRepository agencyRepository;
  @MockBean
  private ConsultingTypeManager consultingTypeManager;

  public void getAgencies_Should_returnMatchingAgencies_When_postcodeAndConsultingTypeIsGiven()
      throws MissingConsultingTypeException {

    when(consultingTypeManager.getConsultingTypeSettings(CONSULTING_TYPE_PREGNANCY)).thenReturn(CONSULTING_TYPE_SETTINGS_PREGNANCY);
    String postCode = "88662";

    List<FullAgencyResponseDTO> resultAgencies = agencyService
        .getAgencies(postCode, CONSULTING_TYPE_PREGNANCY, Optional.empty(), Optional.empty(), Optional.empty());

    assertThat(resultAgencies, hasSize(1));
    FullAgencyResponseDTO resultAgency = resultAgencies.get(0);
    assertThat(resultAgency.getId(), is(883L));
  }

  public void setAgencyOffline_Should_FlagAgencyAsOfflineAndSetUpdateDate() {

    Agency agencyBefore = agencyRepository.findById(883L)
        .orElseThrow(RuntimeException::new);
    agencyService.setAgencyOffline(883L);
    Agency agencyAfter = agencyRepository.findById(883L)
        .orElseThrow(RuntimeException::new);
    assertTrue(agencyAfter.isOffline());
    assertNotEquals(agencyBefore.getUpdateDate(), agencyAfter.getUpdateDate());
  }

  public void getAgenciesByConsultingType_Should_returnResults_When_ConsultingTypeIsValid() {
    List<AgencyResponseDTO> agencies = this.agencyService.getAgencies(CONSULTING_TYPE_U25);

    assertThat(agencies, hasSize(greaterThan(0)));
  }

}
