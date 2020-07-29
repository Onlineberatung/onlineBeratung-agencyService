package de.caritas.cob.AgencyService.api.service;

import static de.caritas.cob.AgencyService.testHelper.TestConstants.AGENCY_ID;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.AGENCY_IDS_LIST;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.AGENCY_LIST;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.AGENCY_OFFLINE;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.AGENCY_ONLINE_U25;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.AGENCY_RESPONSE_DTO;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.AGENCY_SUCHT;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.CONSULTING_TYPE_EMIGRATION;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_EMIGRATION;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_WITHOUT_WHITESPOT_AGENCY;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.CONSULTING_TYPE_SUCHT;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.EMPTY_AGENCY_LIST;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.FIELD_AGENCY_ID;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.POSTCODE;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.VALID_FULL_POSTCODE;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.VALID_MEDIUM_INT;
import static de.caritas.cob.AgencyService.testHelper.TestConstants.VALID_MEDIUM_POSTCODE;
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
import java.util.Collections;
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
import de.caritas.cob.AgencyService.api.model.AgencyResponseDTO;
import de.caritas.cob.AgencyService.api.repository.agency.Agency;
import de.caritas.cob.AgencyService.api.repository.agency.AgencyRepository;

@RunWith(MockitoJUnitRunner.class)
public class AgencyServiceTest {

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
      agencyService.getAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT);
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
      agencyService.getAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT);
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
      agencyService.getAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT);
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

    assertThat(agencyService.getAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT),
        everyItem(instanceOf(AgencyResponseDTO.class)));
    assertThat(agencyService.getAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT))
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

    assertThat(agencyService.getAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT))
        .extracting(FIELD_AGENCY_ID).contains(AGENCY_ID);
  }

  @Test
  public void getListOfAgencies_Should_ReturnEmptyList_WhenNoAgencyFoundForGivenPostcodeAndAgencyHasNotSetWhiteSpotAgency()
      throws Exception {

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_MEDIUM_POSTCODE, VALID_MEDIUM_INT,
        CONSULTING_TYPE_SUCHT)).thenReturn(new ArrayList<Agency>());
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITHOUT_WHITESPOT_AGENCY);

    assertThat(agencyService.getAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_SUCHT),
        IsEmptyCollection.empty());
  }

  @Test
  public void getListOfAgencies_Should_ReturnEmptyList_When_PostcodeSizeIsSmallerThanMinSettingsValue()
      throws Exception {

    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_EMIGRATION);

    assertThat(agencyService.getAgencies(VALID_MEDIUM_POSTCODE, CONSULTING_TYPE_EMIGRATION),
        IsEmptyCollection.empty());
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnServiceExceptionAndLogDatabaseError_OnDatabaseError()
      throws Exception {

    @SuppressWarnings("serial")
    DataAccessException dbEx = new DataAccessException("db error") {};

    when(agencyRepository.findByIdIn(AGENCY_IDS_LIST)).thenThrow(dbEx);

    try {
      agencyService.getAgencies(Collections.singletonList(AGENCY_ID));
      fail("Expected exception: ServiceException");
    } catch (ServiceException serviceException) {
      assertTrue("Excepted ServiceException thrown", true);
    }

    verify(logService, times(1)).logDatabaseError(dbEx);
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnListOfAgencyResponseDTO_When_DBSelectIsSuccessfull()
      throws Exception {

    when(agencyRepository.findByIdIn(AGENCY_IDS_LIST))
        .thenReturn(AGENCY_LIST);

    AgencyResponseDTO result = agencyService.getAgencies(AGENCY_IDS_LIST).get(0);

    assertEquals(AGENCY_RESPONSE_DTO.getPostcode(), result.getPostcode());
    assertEquals(AGENCY_RESPONSE_DTO.getCity(), result.getCity());
    assertEquals(AGENCY_RESPONSE_DTO.getDescription(), result.getDescription());
    assertEquals(AGENCY_RESPONSE_DTO.getName(), result.getName());
    assertEquals(AGENCY_RESPONSE_DTO.getId(), result.getId());
    assertEquals(AGENCY_RESPONSE_DTO.isTeamAgency(), result.isTeamAgency());
    assertEquals(AGENCY_RESPONSE_DTO.isOffline(), result.isOffline());
    assertEquals(AGENCY_RESPONSE_DTO.getConsultingType(), result.getConsultingType());
    assertThat(agencyService.getAgencies(Collections.singletonList(AGENCY_ID)),
        everyItem(instanceOf(AgencyResponseDTO.class)));
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnCorrectOfflineFlag_When_AgencyIsOnline() throws Exception {

    when(agencyRepository.findByIdIn(AGENCY_IDS_LIST))
        .thenReturn(Collections.singletonList(AGENCY_ONLINE_U25));

    AgencyResponseDTO result = agencyService.getAgencies(Collections.singletonList(AGENCY_ID)).get(0);

    assertEquals(result.isOffline(), false);
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnCorrectOfflineFlag_When_AgencyIsOffline() throws Exception {

    when(agencyRepository.findByIdIn(AGENCY_IDS_LIST))
        .thenReturn(Collections.singletonList(AGENCY_OFFLINE));

    AgencyResponseDTO result = agencyService.getAgencies(AGENCY_IDS_LIST).get(0);

    assertEquals(result.isOffline(), true);
  }

  @Test
  public void getAgencies_Should_ReturnEmptyList_When_NoAgencyFoundForGivenId()
      throws Exception {

    when(agencyRepository.findByIdIn(AGENCY_IDS_LIST)).thenReturn(new ArrayList<Agency>());

    assertThat(agencyService.getAgencies(AGENCY_IDS_LIST),
        IsEmptyCollection.empty());
  }
}
