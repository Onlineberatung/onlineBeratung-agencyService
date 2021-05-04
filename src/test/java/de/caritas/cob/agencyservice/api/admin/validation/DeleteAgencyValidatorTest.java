package de.caritas.cob.agencyservice.api.admin.validation;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_KREUZBUND;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.CONSULTING_TYPE_SUCHT;
import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.ConflictException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.LockedConsultingTypeException;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeManager;
import de.caritas.cob.agencyservice.api.manager.consultingtype.ConsultingTypeSettings;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.ConsultantAdminResponseDTO;
import java.util.Collections;
import java.util.stream.Collectors;
import org.jeasy.random.EasyRandom;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class DeleteAgencyValidatorTest {

  @InjectMocks
  DeleteAgencyValidator deleteAgencyValidator;

  @Mock
  UserAdminService userAdminService;

  @Mock
  ConsultingTypeManager consultingTypeManager;

  private final EasyRandom easyRandom = new EasyRandom();

  @Test(expected = LockedConsultingTypeException.class)
  public void validate_Should_throwLockedConsultingTypeException_When_agencyTypeIsKreuzbund()
      throws MissingConsultingTypeException {
    Agency agency = this.easyRandom.nextObject(Agency.class);
    ConsultingTypeSettings consultingTypeSettings = this.easyRandom.nextObject(ConsultingTypeSettings.class);
    consultingTypeSettings.setLockedAgencies(true);

    when(consultingTypeManager.getConsultantTypeSettings(anyInt())).thenReturn(consultingTypeSettings);

    agency.setConsultingTypeId(CONSULTING_TYPE_SUCHT);
    this.deleteAgencyValidator.validate(agency);
  }

  @Test(expected = ConflictException.class)
  public void validate_Should_throwConflictException_When_agencyStillHasAConsultantAssigned()
      throws MissingConsultingTypeException {
    when(this.userAdminService.getConsultantsOfAgency(any(), anyInt(), anyInt()))
        .thenReturn(
            this.easyRandom
                .objects(ConsultantAdminResponseDTO.class, 1)
                .collect(Collectors.toList()));

    ConsultingTypeSettings consultingTypeSettings = this.easyRandom.nextObject(ConsultingTypeSettings.class);
    consultingTypeSettings.setLockedAgencies(false);
    when(consultingTypeManager.getConsultantTypeSettings(anyInt())).thenReturn(consultingTypeSettings);

    Agency agency = this.easyRandom.nextObject(Agency.class);
    agency.setConsultingTypeId(CONSULTING_TYPE_SUCHT);
    this.deleteAgencyValidator.validate(agency);
  }

  @Test
  public void validate_Should_notThrowExceptions_When_agencyIsReadyToDelete()
      throws MissingConsultingTypeException {
    when(this.userAdminService.getConsultantsOfAgency(any(), anyInt(), anyInt()))
        .thenReturn(Collections.emptyList());

    ConsultingTypeSettings consultingTypeSettings = this.easyRandom.nextObject(ConsultingTypeSettings.class);
    consultingTypeSettings.setLockedAgencies(false);
    when(consultingTypeManager.getConsultantTypeSettings(anyInt())).thenReturn(consultingTypeSettings);

    Agency agency = this.easyRandom.nextObject(Agency.class);
    agency.setConsultingTypeId(CONSULTING_TYPE_SUCHT);
    assertDoesNotThrow(() -> this.deleteAgencyValidator.validate(agency));
  }
}
