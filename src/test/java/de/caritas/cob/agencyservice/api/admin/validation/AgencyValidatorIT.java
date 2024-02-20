package de.caritas.cob.agencyservice.api.admin.validation;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SETTINGS_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_CONSULTING_TYPE_VALUE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_POSTCODE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_POSTCODE;
import static java.util.Collections.singletonList;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.AgencyServiceApplication;

import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.util.AuthenticatedUser;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTOAllOfWhiteSpot;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.ConsultantAdminResponseDTO;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.annotation.DirtiesContext.ClassMode;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
@DirtiesContext(classMode = ClassMode.BEFORE_CLASS)
public class AgencyValidatorIT {

  @Autowired
  private AgencyValidator agencyValidator;

  @MockBean
  private UserAdminService userAdminService;

  @MockBean
  private ConsultingTypeManager consultingTypeManager;

  @MockBean
  private AuthenticatedUser authenticatedUser;

  @Test(expected = InvalidPostcodeException.class)
  public void validate_Should_ThrowInvalidPostcodeException_WhenCreateAndAgencyPostcodeIsInvalid() {
    AgencyDTO agencyDTO = getValidAgencyDTO();
    agencyDTO.setPostcode(INVALID_POSTCODE);
    agencyValidator.validate(agencyDTO);
  }

  @Test
  public void validate_Should_NotThrowInvalidPostcodeException_WhenCreateAndAgencyPostcodeIsValid() {
    AgencyDTO agencyDTO = getValidAgencyDTO();
    agencyDTO.setPostcode(VALID_POSTCODE);
    agencyValidator.validate(agencyDTO);
  }

  @Test(expected = InvalidConsultingTypeException.class)
  public void validate_Should_ThrowInvalidConsultingTypeException_WhenCreateAndAgencyConsultingTypeIsInvalid()
      throws MissingConsultingTypeException {
    when(consultingTypeManager.getConsultingTypeSettings(anyInt())).thenThrow(new MissingConsultingTypeException(""));
    AgencyDTO agencyDTO = getValidAgencyDTO();
    agencyDTO.setConsultingType(INVALID_CONSULTING_TYPE_VALUE);
    agencyValidator.validate(agencyDTO);
  }

  @Test
  public void validate_Should_NotThrowInvalidConsultingTypeException_WhenCreateAndAgencyConsultingTypeIsValid() {
    AgencyDTO agencyDTO = getValidAgencyDTO();
    agencyDTO.setConsultingType(CONSULTING_TYPE_SUCHT);
    agencyValidator.validate(agencyDTO);
  }

  @Test(expected = InvalidPostcodeException.class)
  public void validate_Should_ThrowInvalidPostcodeException_WhenUpdateAndAgencyPostcodeIsInvalid()
      throws MissingConsultingTypeException {
    when(consultingTypeManager.getConsultingTypeSettings(0)).thenReturn(CONSULTING_TYPE_SETTINGS_SUCHT);
    UpdateAgencyDTO updateAgencyDTO = getValidUpdateAgencyDTO();
    updateAgencyDTO.setPostcode(INVALID_POSTCODE);
    agencyValidator.validate(1L, updateAgencyDTO);
  }

  @Test
  public void validate_Should_NotThrowInvalidPostcodeException_WhenUpdateAndAgencyPostcodeIsValid()
      throws MissingConsultingTypeException {
    when(consultingTypeManager.getConsultingTypeSettings(0)).thenReturn(CONSULTING_TYPE_SETTINGS_SUCHT);
    UpdateAgencyDTO updateAgencyDTO = getValidUpdateAgencyDTO();
    updateAgencyDTO.setPostcode(VALID_POSTCODE);
    agencyValidator.validate(1L, updateAgencyDTO);
  }

  @Test(expected = InvalidOfflineStatusException.class)
  public void validate_Should_ThrowInvalidOfflineStatusException_WhenUpdateAndOfflineStatusIsInvalid()
      throws MissingConsultingTypeException {
    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = getValidUpdateAgencyDTO();
    updateAgencyDTO.setOffline(false);
    var extendedConsultingTypeResponseDTO = new ExtendedConsultingTypeResponseDTO();
    extendedConsultingTypeResponseDTO.setWhiteSpot(easyRandom.nextObject(ExtendedConsultingTypeResponseDTOAllOfWhiteSpot.class));
    when(consultingTypeManager.getConsultingTypeSettings(19)).thenReturn(extendedConsultingTypeResponseDTO);
    agencyValidator.validate(1734L, updateAgencyDTO);
  }

  @Test
  public void validate_Should_NotThrowInvalidOfflineStatusException_WhenUpdateAndOfflineStatusIsValid()
      throws MissingConsultingTypeException {
    when(this.userAdminService.getConsultantsOfAgency(anyLong(), anyInt(), anyInt()))
        .thenReturn(singletonList(mock(ConsultantAdminResponseDTO.class)));

    when(consultingTypeManager.getConsultingTypeSettings(0)).thenReturn(CONSULTING_TYPE_SETTINGS_SUCHT);

    UpdateAgencyDTO updateAgencyDTO = getValidUpdateAgencyDTO();
    updateAgencyDTO.setOffline(false);
    agencyValidator.validate(1L, updateAgencyDTO);
  }

  private AgencyDTO getValidAgencyDTO() {

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setConsultingType(CONSULTING_TYPE_SUCHT);
    agencyDTO.setPostcode(VALID_POSTCODE);
    return agencyDTO;

  }

  private UpdateAgencyDTO getValidUpdateAgencyDTO() {
    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setPostcode(VALID_POSTCODE);
    return updateAgencyDTO;
  }


}
