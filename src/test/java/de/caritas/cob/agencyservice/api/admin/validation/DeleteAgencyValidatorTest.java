package de.caritas.cob.agencyservice.api.admin.validation;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.when;

import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.exception.httpresponses.ConflictException;
import de.caritas.cob.agencyservice.api.exception.httpresponses.LockedConsultingTypeException;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
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

  private final EasyRandom easyRandom = new EasyRandom();

  @Test(expected = LockedConsultingTypeException.class)
  public void validate_Should_throwLockedConsultingTypeException_When_agencyTypeIsKreuzbund() {
    Agency agency = this.easyRandom.nextObject(Agency.class);
    agency.setConsultingType(ConsultingType.KREUZBUND);
    this.deleteAgencyValidator.validate(agency);
  }

  @Test(expected = LockedConsultingTypeException.class)
  public void validate_Should_throwLockedConsultingTypeException_When_agencyTypeIsSupportGroup() {
    Agency agency = this.easyRandom.nextObject(Agency.class);
    agency.setConsultingType(ConsultingType.SUPPORTGROUP);
    this.deleteAgencyValidator.validate(agency);
  }

  @Test(expected = ConflictException.class)
  public void validate_Should_throwConflictException_When_agencyStillHasAConsultantAssigned() {
    when(this.userAdminService.getConsultantsOfAgency(any(), anyInt(), anyInt()))
        .thenReturn(
            this.easyRandom
                .objects(ConsultantAdminResponseDTO.class, 1)
                .collect(Collectors.toList()));

    Agency agency = this.easyRandom.nextObject(Agency.class);
    agency.setConsultingType(ConsultingType.SUCHT);
    this.deleteAgencyValidator.validate(agency);
  }

  @Test
  public void validate_Should_notThrowExceptions_When_agencyIsReadyToDelete() {
    when(this.userAdminService.getConsultantsOfAgency(any(), anyInt(), anyInt()))
        .thenReturn(Collections.emptyList());

    Agency agency = this.easyRandom.nextObject(Agency.class);
    agency.setConsultingType(ConsultingType.SUCHT);
    assertDoesNotThrow(() -> this.deleteAgencyValidator.validate(agency));
  }
}
