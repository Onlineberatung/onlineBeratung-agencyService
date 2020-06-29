package de.caritas.cob.AgencyService.api.service;

import static de.caritas.cob.AgencyService.testHelper.TestConstants.CONSULTING_TYPE_EMIGRATION;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.CONSULTING_TYPE_SUCHT;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.CONSULTING_TYPE_U25;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.WHITESPOT_AGENCY_ID;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.everyItem;
import static org.hamcrest.CoreMatchers.instanceOf;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import org.hamcrest.collection.IsEmptyCollection;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.dao.DataAccessException;
import de.caritas.cob.AgencyService.api.exception.ServiceException;
import de.caritas.cob.AgencyService.api.manager.consultingType.ConsultingTypeManager;
import de.caritas.cob.AgencyService.api.manager.consultingType.ConsultingTypeSettings;
import de.caritas.cob.AgencyService.api.manager.consultingType.registration.Registration;
import de.caritas.cob.AgencyService.api.manager.consultingType.whiteSpot.WhiteSpot;
import de.caritas.cob.AgencyService.api.model.AgencyResponseDTO;
import de.caritas.cob.AgencyService.api.repository.agency.Agency;
import de.caritas.cob.AgencyService.api.repository.agency.AgencyRepository;

@RunWith(MockitoJUnitRunner.class)
public class AgencyServiceTest {

  private final String POSTCODE = "postcode";
  private final String FIELD_AGENCY_ID = "id";
  private final String VALID_FULL_POSTCODE = "12345";
  private final String AGENCY_CITY = "testcity";
  private final String VALID_MEDIUM_POSTCODE = "884";
  private final int VALID_MEDIUM_INT = 3;
  private final Long AGENCY_ID = 98L;
  private final String AGENCY_NAME = "Test agency";
  private final String AGENCY_DESCRIPTION = "Test description";
  private final Agency AGENCY_SUCHT = new Agency(AGENCY_ID, 10L, AGENCY_NAME, AGENCY_DESCRIPTION,
      VALID_FULL_POSTCODE, "Test city", false, CONSULTING_TYPE_SUCHT, false, null);
  private final Agency AGENCY_ONLINE_U25 =
      new Agency(AGENCY_ID, 10L, AGENCY_NAME, AGENCY_DESCRIPTION, VALID_FULL_POSTCODE, "Test city",
          false, CONSULTING_TYPE_U25, false, null);
  private final Agency AGENCY_OFFLINE = new Agency(AGENCY_ID, 10L, AGENCY_NAME, AGENCY_DESCRIPTION,
      VALID_FULL_POSTCODE, "Test city", false, CONSULTING_TYPE_SUCHT, true, null);
  private final Agency TEAM_AGENCY = new Agency(AGENCY_ID, 10L, AGENCY_NAME, AGENCY_DESCRIPTION,
      VALID_FULL_POSTCODE, "Test city", true, CONSULTING_TYPE_SUCHT, false, null);
  private final AgencyResponseDTO AGENCY_RESPONSE_DTO =
      new AgencyResponseDTO(AGENCY_ID, AGENCY_NAME, VALID_FULL_POSTCODE, AGENCY_CITY, AGENCY_DESCRIPTION, false,
          false, CONSULTING_TYPE_SUCHT.getValue());
  private final int MIN_POSTCODE_SIZE_3 = 3;
  private final int MIN_POSTCODE_SIZE_5 = 5;
  private final WhiteSpot WHITESPOT_AGENCIES_SUCHT = new WhiteSpot(true, WHITESPOT_AGENCY_ID);
  private final WhiteSpot WHITESPOT_AGENCIES_U25 = new WhiteSpot(false, WHITESPOT_AGENCY_ID);
  private final WhiteSpot WHITESPOT_AGENCIES_EMIGRATION = new WhiteSpot(false, WHITESPOT_AGENCY_ID);
  private final Registration REGISTRATION_SUCHT = new Registration(MIN_POSTCODE_SIZE_3);
  private final Registration REGISTRATION_U25 = new Registration(MIN_POSTCODE_SIZE_3);
  private final Registration REGISTRATION_EMIGRATION = new Registration(MIN_POSTCODE_SIZE_5);
  private final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY =
      new ConsultingTypeSettings(CONSULTING_TYPE_SUCHT, WHITESPOT_AGENCIES_SUCHT,
          REGISTRATION_SUCHT);
  private final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_WITHOUT_WHITESPOT_AGENCY =
      new ConsultingTypeSettings(CONSULTING_TYPE_U25, WHITESPOT_AGENCIES_U25, REGISTRATION_U25);
  private final ConsultingTypeSettings CONSULTING_TYPE_SETTINGS_EMIGRATION =
      new ConsultingTypeSettings(CONSULTING_TYPE_U25, WHITESPOT_AGENCIES_EMIGRATION,
          REGISTRATION_EMIGRATION);
  private final List<Agency> EMPTY_AGENCY_LIST = new ArrayList<Agency>();
  private final List<Agency> AGENCY_LIST = Arrays.asList(AGENCY_SUCHT);

  @InjectMocks
  private AgencyService agencyService;
  @Mock
  private AgencyRepository agencyRepository;
  @Mock
  private LogService logService;
  @Mock
  ConsultingTypeManager consultingTypeManager;

  @Test
  public void getListOfAgencies_Should_ReturnServiceExceptionAndLogDatabaseError_OnDatabaseErrorFindByPostCodeAndConsultingType()
      throws Exception {

    @SuppressWarnings("serial")
    DataAccessException dbEx = new DataAccessException("db error") {};

    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY);
    when(agencyRepository.findByPostCodeAndConsultingType(VALID_MEDIUM_POSTCODE, VALID_MEDIUM_INT,
        CONSULTING_TYPE_SUCHT)).thenThrow(dbEx);

    try {
      agencyService.getListOfAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT);
      fail("Expected exception: ServiceException");
    } catch (ServiceException serviceException) {
      assertTrue("Excepted ServiceException thrown", true);
    }

    verify(logService, times(1)).logDatabaseError(dbEx);
  }

  @Test
  public void getListOfAgencies_Should_ReturnServiceExceptionAndLogNumberFormatError_OnInvalidWhiteSpotAgencyId()
      throws Exception {

    NumberFormatException nfEx = new NumberFormatException();

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_MEDIUM_POSTCODE, VALID_MEDIUM_INT,
        CONSULTING_TYPE_SUCHT)).thenReturn(EMPTY_AGENCY_LIST);
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY);
    when(agencyRepository.findByIdAndDeleteDateNull(Mockito.anyLong())).thenThrow(nfEx);

    try {
      agencyService.getListOfAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT);
      fail("Expected exception: ServiceException");
    } catch (ServiceException serviceException) {
      assertTrue("Excepted ServiceException thrown", true);
    }

    verify(logService, times(1)).logNumberFormatException(nfEx);;
  }

  @Test
  public void getListOfAgencies_Should_ReturnServiceExceptionAndLogDatabaseError_OnDatabaseErrorfindByIdAndDeleteDateNull()
      throws Exception {

    @SuppressWarnings("serial")
    DataAccessException dbEx = new DataAccessException("db error") {};

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_MEDIUM_POSTCODE, VALID_MEDIUM_INT,
        CONSULTING_TYPE_SUCHT)).thenReturn(EMPTY_AGENCY_LIST);
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY);

    when(agencyRepository.findByIdAndDeleteDateNull(Mockito.anyLong())).thenThrow(dbEx);

    try {
      agencyService.getListOfAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT);
      fail("Expected exception: ServiceException");
    } catch (ServiceException serviceException) {
      assertTrue("Excepted ServiceException thrown", true);
    }

    verify(logService, times(1)).logDatabaseError(dbEx);
  }

  @Test
  public void getListOfAgencies_Should_ReturnListOfAgencyResponseDTO_WhenDBSelectIsSuccessfull()
      throws Exception {

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_MEDIUM_POSTCODE, VALID_MEDIUM_INT,
        CONSULTING_TYPE_SUCHT)).thenReturn(AGENCY_LIST);
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY);

    assertThat(agencyService.getListOfAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT),
        everyItem(instanceOf(AgencyResponseDTO.class)));
    assertThat(agencyService.getListOfAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT))
        .extracting(POSTCODE).contains(VALID_FULL_POSTCODE);
  }

  @Test
  public void getListOfAgencies_Should_ReturnWhiteSpotAgency_WhenNoAgencyFoundForGivenPostcodeAndAgencyHasSetWhiteSpotAgency()
      throws Exception {

    Optional<Agency> agency = Optional.of(AGENCY_SUCHT);

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_MEDIUM_POSTCODE, VALID_MEDIUM_INT,
        CONSULTING_TYPE_SUCHT)).thenReturn(EMPTY_AGENCY_LIST);
    when(agencyRepository.findByIdAndDeleteDateNull(Mockito.anyLong())).thenReturn(agency);
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY);

    assertThat(agencyService.getListOfAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT))
        .extracting(FIELD_AGENCY_ID).contains(AGENCY_ID);
  }

  @Test
  public void getListOfAgencies_Should_ReturnEmptyList_WhenNoAgencyFoundForGivenPostcodeAndAgencyHasNotSetWhiteSpotAgency()
      throws Exception {

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_MEDIUM_POSTCODE, VALID_MEDIUM_INT,
        CONSULTING_TYPE_SUCHT)).thenReturn(new ArrayList<Agency>());
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITHOUT_WHITESPOT_AGENCY);

    assertThat(agencyService.getListOfAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT),
        IsEmptyCollection.empty());
  }

  @Test
  public void getListOfAgencies_Should_ReturnEmptyList_WhenPostcodeSizeIsSmallerThanMinSettingsValue()
      throws Exception {

    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_EMIGRATION);

    assertThat(agencyService.getListOfAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_EMIGRATION),
        IsEmptyCollection.empty());
  }

  @Test
  public void getAgency_Should_ReturnServiceExceptionAndLogDatabaseError_OnDatabaseError()
      throws Exception {

    @SuppressWarnings("serial")
    DataAccessException dbEx = new DataAccessException("db error") {};

    when(agencyRepository.findByIdAndDeleteDateNull(AGENCY_ID)).thenThrow(dbEx);

    try {
      agencyService.getAgency(AGENCY_ID);
      fail("Expected exception: ServiceException");
    } catch (ServiceException serviceException) {
      assertTrue("Excepted ServiceException thrown", true);
    }

    verify(logService, times(1)).logDatabaseError(dbEx);
  }

  @Test
  public void getAgency_Should_Return_False_WhenAgencyIsNoTeamAgency() throws Exception {

    when(agencyRepository.findByIdAndDeleteDateNull(AGENCY_ID))
        .thenReturn(Optional.of(AGENCY_SUCHT));
    AgencyResponseDTO result = agencyService.getAgency(AGENCY_ID);
    assertEquals(false, result.isTeamAgency());
  }

  @Test
  public void getAgency_Should_Return_True_WhenAgencyIsTeamAgency() throws Exception {

    when(agencyRepository.findByIdAndDeleteDateNull(AGENCY_ID))
        .thenReturn(Optional.of(TEAM_AGENCY));
    AgencyResponseDTO result = agencyService.getAgency(AGENCY_ID);
    assertEquals(true, result.isTeamAgency());
  }

  @Test
  public void getAgency_Should_ReturnAgencyResponseDTO_WhenDBSelectIsSuccessfull()
      throws Exception {

    when(agencyRepository.findByIdAndDeleteDateNull(AGENCY_ID))
        .thenReturn(Optional.of(AGENCY_SUCHT));

    AgencyResponseDTO result = agencyService.getAgency(AGENCY_ID);

    assertEquals(AGENCY_RESPONSE_DTO.getPostcode(), result.getPostcode());
    assertEquals(AGENCY_RESPONSE_DTO.getDescription(), result.getDescription());
    assertEquals(AGENCY_RESPONSE_DTO.getName(), result.getName());
    assertEquals(AGENCY_RESPONSE_DTO.getId(), result.getId());
    assertEquals(AGENCY_RESPONSE_DTO.isTeamAgency(), result.isTeamAgency());
    assertEquals(AGENCY_RESPONSE_DTO.isOffline(), result.isOffline());
    assertEquals(AGENCY_RESPONSE_DTO.getConsultingType(), result.getConsultingType());
  }

  @Test
  public void getAgency_Should_ReturnCorrectOfflineFlag_WhenAgencyIsOnline() throws Exception {

    when(agencyRepository.findByIdAndDeleteDateNull(AGENCY_ID))
        .thenReturn(Optional.of(AGENCY_ONLINE_U25));
    AgencyResponseDTO result = agencyService.getAgency(AGENCY_ID);
    assertEquals(result.isOffline(), false);

  }

  @Test
  public void getAgency_Should_ReturnCorrectOfflineFlag_WhenAgencyIsOffline() throws Exception {

    when(agencyRepository.findByIdAndDeleteDateNull(AGENCY_ID))
        .thenReturn(Optional.of(AGENCY_OFFLINE));
    AgencyResponseDTO result = agencyService.getAgency(AGENCY_ID);
    assertEquals(result.isOffline(), true);

  }

  @Test
  public void getAgency_Should_ReturnNull_WhenNoAgencyFound() throws Exception {

    when(agencyRepository.findByIdAndDeleteDateNull(AGENCY_ID)).thenReturn(Optional.empty());

    assertEquals(null, agencyService.getAgency(AGENCY_ID));
  }

}
