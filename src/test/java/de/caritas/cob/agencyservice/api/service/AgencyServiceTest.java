package de.caritas.cob.agencyservice.api.service;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_IDS_LIST;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_LIST;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_OFFLINE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ONLINE_U25;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_RESPONSE_DTO;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_EMIGRATION;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_EMIGRATION;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_WITHOUT_WHITESPOT_AGENCY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.EMPTY_AGENCY_LIST;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.FIELD_AGENCY_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.POSTCODE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE_LENGTH;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.everyItem;
import static org.hamcrest.CoreMatchers.instanceOf;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InternalServerErrorException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.model.AgencyResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyRepository;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import org.hamcrest.collection.IsEmptyCollection;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;
import org.slf4j.Logger;
import org.springframework.dao.DataAccessException;

@RunWith(MockitoJUnitRunner.class)
public class AgencyServiceTest {

  @Mock
  ConsultingTypeManager consultingTypeManager;
  @InjectMocks
  private AgencyService agencyService;
  @Mock
  private AgencyRepository agencyRepository;

  @Test
  public void getListOfAgencies_Should_ReturnServiceExceptionAndLogDatabaseError_OnDatabaseErrorFindByPostCodeAndConsultingType()
      throws MissingConsultingTypeException {

    DataAccessException dbEx = new DataAccessException("db error") {
    };

    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY);
    when(agencyRepository.findByPostCodeAndConsultingType(VALID_POSTCODE, VALID_POSTCODE_LENGTH,
        CONSULTING_TYPE_SUCHT)).thenThrow(dbEx);

    try {
      agencyService.getAgencies(VALID_POSTCODE, CONSULTING_TYPE_SUCHT);
      fail("Expected exception: ServiceException");
    } catch (InternalServerErrorException internalServerErrorException) {
      assertTrue("Excepted ServiceException thrown", true);
    }
  }

  @Test
  public void getListOfAgencies_Should_ReturnServiceException_OnInvalidWhiteSpotAgencyId()
      throws MissingConsultingTypeException {

    NumberFormatException nfEx = new NumberFormatException();

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_POSTCODE, VALID_POSTCODE_LENGTH,
        CONSULTING_TYPE_SUCHT)).thenReturn(EMPTY_AGENCY_LIST);
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY);
    when(agencyRepository.findByIdAndDeleteDateNull(Mockito.anyLong())).thenThrow(nfEx);

    try {
      agencyService.getAgencies(VALID_POSTCODE, CONSULTING_TYPE_SUCHT);
      fail("Expected exception: ServiceException");
    } catch (InternalServerErrorException internalServerErrorException) {
      assertTrue("Excepted ServiceException thrown", true);
    }
  }

  @Test
  public void getListOfAgencies_Should_ReturnServiceException_OnDatabaseErrorfindByIdAndDeleteDateNull()
      throws MissingConsultingTypeException {

    DataAccessException dbEx = new DataAccessException("db error") {
    };

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_POSTCODE, VALID_POSTCODE_LENGTH,
        CONSULTING_TYPE_SUCHT)).thenReturn(EMPTY_AGENCY_LIST);
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY);

    when(agencyRepository.findByIdAndDeleteDateNull(Mockito.anyLong())).thenThrow(dbEx);

    try {
      agencyService.getAgencies(VALID_POSTCODE, CONSULTING_TYPE_SUCHT);
      fail("Expected exception: ServiceException");
    } catch (InternalServerErrorException internalServerErrorException) {
      assertTrue("Excepted ServiceException thrown", true);
    }
  }

  @Test
  public void getListOfAgencies_Should_ReturnListOfAgencyResponseDTO_WhenDBSelectIsSuccessfull()
      throws MissingConsultingTypeException {

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_POSTCODE, VALID_POSTCODE_LENGTH,
        CONSULTING_TYPE_SUCHT)).thenReturn(AGENCY_LIST);
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY);

    assertThat(agencyService.getAgencies(VALID_POSTCODE, CONSULTING_TYPE_SUCHT),
        everyItem(instanceOf(AgencyResponseDTO.class)));
    assertThat(agencyService.getAgencies(VALID_POSTCODE, CONSULTING_TYPE_SUCHT))
        .extracting(POSTCODE).contains(POSTCODE);
  }

  @Test
  public void getListOfAgencies_Should_ReturnWhiteSpotAgency_WhenNoAgencyFoundForGivenPostcodeAndAgencyHasSetWhiteSpotAgency()
      throws MissingConsultingTypeException {

    Optional<Agency> agency = Optional.of(AGENCY_SUCHT);

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_POSTCODE, VALID_POSTCODE_LENGTH,
        CONSULTING_TYPE_SUCHT)).thenReturn(EMPTY_AGENCY_LIST);
    when(agencyRepository.findByIdAndDeleteDateNull(Mockito.anyLong())).thenReturn(agency);
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITH_WHITESPOT_AGENCY);

    assertThat(agencyService.getAgencies(VALID_POSTCODE, CONSULTING_TYPE_SUCHT))
        .extracting(FIELD_AGENCY_ID).contains(AGENCY_ID);
  }

  @Test
  public void getListOfAgencies_Should_ReturnEmptyList_WhenNoAgencyFoundForGivenPostcodeAndAgencyHasNotSetWhiteSpotAgency()
      throws MissingConsultingTypeException {

    when(agencyRepository.findByPostCodeAndConsultingType(VALID_POSTCODE, VALID_POSTCODE_LENGTH,
        CONSULTING_TYPE_SUCHT)).thenReturn(new ArrayList<>());
    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_WITHOUT_WHITESPOT_AGENCY);

    assertThat(agencyService.getAgencies(VALID_POSTCODE, CONSULTING_TYPE_SUCHT),
        IsEmptyCollection.empty());
  }

  @Test
  public void getListOfAgencies_Should_ReturnEmptyList_When_PostcodeSizeIsSmallerThanMinSettingsValue()
      throws MissingConsultingTypeException {

    when(consultingTypeManager.getConsultantTypeSettings(Mockito.any()))
        .thenReturn(CONSULTING_TYPE_SETTINGS_EMIGRATION);

    assertThat(agencyService.getAgencies(VALID_POSTCODE, CONSULTING_TYPE_EMIGRATION),
        IsEmptyCollection.empty());
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnServiceException_OnDatabaseError() {

    List<Long> agencyIds = Collections.singletonList(AGENCY_ID);
    DataAccessException dbEx = new DataAccessException("db error") {
    };

    when(agencyRepository.findByIdIn(AGENCY_IDS_LIST)).thenThrow(dbEx);

    try {
      agencyService.getAgencies(agencyIds);
      fail("Expected exception: ServiceException");
    } catch (InternalServerErrorException internalServerErrorException) {
      assertTrue("Excepted ServiceException thrown", true);
    }
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnListOfAgencyResponseDTO_When_DBSelectIsSuccessfull() {

    when(agencyRepository.findByIdIn(AGENCY_IDS_LIST))
        .thenReturn(AGENCY_LIST);

    AgencyResponseDTO result = agencyService.getAgencies(AGENCY_IDS_LIST).get(0);

    assertEquals(AGENCY_RESPONSE_DTO.getPostcode(), result.getPostcode());
    assertEquals(AGENCY_RESPONSE_DTO.getCity(), result.getCity());
    assertEquals(AGENCY_RESPONSE_DTO.getDescription(), result.getDescription());
    assertEquals(AGENCY_RESPONSE_DTO.getName(), result.getName());
    assertEquals(AGENCY_RESPONSE_DTO.getId(), result.getId());
    assertEquals(AGENCY_RESPONSE_DTO.getTeamAgency(), result.getTeamAgency());
    assertEquals(AGENCY_RESPONSE_DTO.getOffline(), result.getOffline());
    assertEquals(AGENCY_RESPONSE_DTO.getConsultingType(), result.getConsultingType());
    assertThat(agencyService.getAgencies(Collections.singletonList(AGENCY_ID)),
        everyItem(instanceOf(AgencyResponseDTO.class)));
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnCorrectOfflineFlag_When_AgencyIsOnline() {

    when(agencyRepository.findByIdIn(AGENCY_IDS_LIST))
        .thenReturn(Collections.singletonList(AGENCY_ONLINE_U25));

    AgencyResponseDTO result = agencyService.getAgencies(Collections.singletonList(AGENCY_ID))
        .get(0);

    assertEquals(false, result.getOffline());
  }

  @Test
  public void getAgencies_With_Ids_Should_ReturnCorrectOfflineFlag_When_AgencyIsOffline() {

    when(agencyRepository.findByIdIn(AGENCY_IDS_LIST))
        .thenReturn(Collections.singletonList(AGENCY_OFFLINE));

    AgencyResponseDTO result = agencyService.getAgencies(AGENCY_IDS_LIST).get(0);

    assertEquals(true, result.getOffline());
  }

  @Test
  public void getAgencies_Should_ReturnEmptyList_When_NoAgencyFoundForGivenId() {

    when(agencyRepository.findByIdIn(AGENCY_IDS_LIST))
        .thenReturn(new ArrayList<>());

    assertThat(agencyService.getAgencies(AGENCY_IDS_LIST),
        IsEmptyCollection.empty());
  }

  @Test(expected = InternalServerErrorException.class)
  public void getAgencies_Should_ThrowInternalServerError_When_MissingConsultingTypeExceptionIsThrown()
      throws MissingConsultingTypeException {

    when(consultingTypeManager.getConsultantTypeSettings(any()))
        .thenThrow(new MissingConsultingTypeException(""));
    agencyService.getAgencies("", null);
  }

  @Test(expected = InternalServerErrorException.class)
  public void setAgencyOffline_Should_ThrowInternalServerError_When_WhenDatabaseErrorDuringFindById() {

    when(agencyRepository.findById(AGENCY_ID))
        .thenThrow(new DataAccessException("database error") {
        });
    agencyService.setAgencyOffline(AGENCY_ID);
  }

  @Test(expected = InternalServerErrorException.class)
  public void setAgencyOffline_Should_ThrowInternalServerError_When_WhenDatabaseErrorDuringSave() {

    when(agencyRepository.findById(AGENCY_SUCHT.getId())).thenReturn(Optional.of(AGENCY_SUCHT));
    when(agencyRepository.save(any()))
        .thenThrow(new DataAccessException("database error") {
        });
    agencyService.setAgencyOffline(AGENCY_SUCHT.getId());
  }

  @Test
  public void setAgencyOffline_Should_SaveAgency() {

    EasyRandom easyRandom = new EasyRandom();
    Agency agency = easyRandom.nextObject(Agency.class);

    when(agencyRepository.findById(agency.getId())).thenReturn(Optional.of(agency));
    agencyService.setAgencyOffline(agency.getId());

    verify(agencyRepository, times(1)).save(any());

  }

  @Test(expected = NotFoundException.class)
  public void setAgencyOffline_Should_ThrowNotFoundException_WhenAgencyIsNotFound() {

    when(agencyRepository.findById(AGENCY_ID)).thenReturn(Optional.empty());
    agencyService.setAgencyOffline(AGENCY_ID);

  }

}
