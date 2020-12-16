package de.caritas.cob.agencyservice.api.admin.validation;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SUCHT;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_CONSULTING_TYPE_VALUE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_DIOCESE_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.INVALID_POSTCODE;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.VALID_FULL_POSTCODE;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidDioceseException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidOfflineStatusException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.InvalidPostcodeException;
import de.caritas.cob.agencyservice.api.model.AgencyDTO;
import de.caritas.cob.agencyservice.api.model.UpdateAgencyDTO;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
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

  @Test(expected = InvalidPostcodeException.class)
  public void validate_Should_ThrowInvalidPostcodeException_WhenCreateAndAgencyPostcodeIsInvalid() {
    AgencyDTO agencyDTO = getValidAgencyDTO();
    agencyDTO.setPostcode(INVALID_POSTCODE);
    agencyValidator.validate(agencyDTO);
  }

  @Test
  public void validate_Should_NotThrowInvalidPostcodeException_WhenCreateAndAgencyPostcodeIsValid() {
    AgencyDTO agencyDTO = getValidAgencyDTO();
    agencyDTO.setPostcode(VALID_FULL_POSTCODE);
    agencyValidator.validate(agencyDTO);
  }

  @Test(expected = InvalidConsultingTypeException.class)
  public void validate_Should_ThrowInvalidConsultingTypeException_WhenCreateAndAgencyConsultingTypeIsInvalid() {
    AgencyDTO agencyDTO = getValidAgencyDTO();
    agencyDTO.setConsultingType(INVALID_CONSULTING_TYPE_VALUE);
    agencyValidator.validate(agencyDTO);
  }

  @Test
  public void validate_Should_NotThrowInvalidConsultingTypeException_WhenCreateAndAgencyConsultingTypeIsValid() {
    AgencyDTO agencyDTO = getValidAgencyDTO();
    agencyDTO.setConsultingType(CONSULTING_TYPE_SUCHT.getValue());
    agencyValidator.validate(agencyDTO);
  }

  @Test(expected = InvalidDioceseException.class)
  public void validate_Should_ThrowInvalidDioceseException_WhenCreateAndAgencyDioceseIdIsInvalid() {
    AgencyDTO agencyDTO = getValidAgencyDTO();
    agencyDTO.setDioceseId(INVALID_DIOCESE_ID);
    agencyValidator.validate(agencyDTO);
  }

  @Test
  public void validate_Should_NotThrowInvalidDioceseException_WhenCreateAndAgencyDioceseIdIsValid() {
    AgencyDTO agencyDTO = getValidAgencyDTO();
    agencyDTO.setDioceseId(0L);
    agencyValidator.validate(agencyDTO);
  }

  @Test(expected = InvalidPostcodeException.class)
  public void validate_Should_ThrowInvalidPostcodeException_WhenUpdateAndAgencyPostcodeIsInvalid() {
    UpdateAgencyDTO updateAgencyDTO = getValidUpdateAgencyDTO();
    updateAgencyDTO.setPostcode(INVALID_POSTCODE);
    agencyValidator.validate(1L, updateAgencyDTO);
  }

  @Test
  public void validate_Should_NotThrowInvalidPostcodeException_WhenUpdateAndAgencyPostcodeIsValid() {
    UpdateAgencyDTO updateAgencyDTO = getValidUpdateAgencyDTO();
    updateAgencyDTO.setPostcode(VALID_FULL_POSTCODE);
    agencyValidator.validate(1L, updateAgencyDTO);
  }

  @Test(expected = InvalidDioceseException.class)
  public void validate_Should_ThrowInvalidDioceseException_WhenUpdateAndAgencyDioceseIdIsInvalid() {
    UpdateAgencyDTO updateAgencyDTO = getValidUpdateAgencyDTO();
    updateAgencyDTO.setDioceseId(INVALID_DIOCESE_ID);
    agencyValidator.validate(1L, updateAgencyDTO);
  }

  @Test
  public void validate_Should_NotThrowInvalidDioceseException_WhenUpdateAndAgencyDioceseIdIsValid() {
    UpdateAgencyDTO updateAgencyDTO = getValidUpdateAgencyDTO();
    updateAgencyDTO.setDioceseId(0L);
    agencyValidator.validate(1L, updateAgencyDTO);
  }

  @Test(expected = InvalidOfflineStatusException.class)
  public void validate_Should_ThrowInvalidOfflineStatusException_WhenUpdateAndOfflineStatusIsInvalid() {
    UpdateAgencyDTO updateAgencyDTO = getValidUpdateAgencyDTO();
    updateAgencyDTO.setOffline(false);
    agencyValidator.validate(1734L, updateAgencyDTO);
  }

  @Test
  public void validate_Should_NotThrowInvalidOfflineStatusException_WhenUpdateAndOfflineStatusIsValid() {
    UpdateAgencyDTO updateAgencyDTO = getValidUpdateAgencyDTO();
    updateAgencyDTO.setOffline(false);
    agencyValidator.validate(1L, updateAgencyDTO);
  }

  private AgencyDTO getValidAgencyDTO() {

    EasyRandom easyRandom = new EasyRandom();
    AgencyDTO agencyDTO = easyRandom.nextObject(AgencyDTO.class);
    agencyDTO.setConsultingType(CONSULTING_TYPE_SUCHT.getValue());
    agencyDTO.setPostcode(VALID_FULL_POSTCODE);
    agencyDTO.setDioceseId(0L);
    return agencyDTO;

  }

  private UpdateAgencyDTO getValidUpdateAgencyDTO() {

    EasyRandom easyRandom = new EasyRandom();
    UpdateAgencyDTO updateAgencyDTO = easyRandom.nextObject(UpdateAgencyDTO.class);
    updateAgencyDTO.setPostcode(VALID_FULL_POSTCODE);
    updateAgencyDTO.setDioceseId(0L);
    return updateAgencyDTO;

  }


}
