package de.caritas.cob.agencyservice.api.admin.validation.validators;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.admin.service.UserAdminService;
import de.caritas.cob.agencyservice.api.admin.validation.validators.model.ValidateAgencyDTO;

import de.caritas.cob.agencyservice.api.exception.httpresponses.AgencyAccessDeniedException;
import de.caritas.cob.agencyservice.api.util.AuthenticatedUser;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AgencyUpdatePermissionValidatorTest {

  public static final long AGENCY_ID = 1L;

  @InjectMocks
  AgencyUpdatePermissionValidator agencyUpdatePermissionValidator;

  @Mock
  AuthenticatedUser authenticatedUser;

  @Mock
  UserAdminService userAdminService;
  @Mock
  ValidateAgencyDTO validateAgencyDto;

  @Test
  void validate_Should_PassValidationIfUserHasNotRestricted() {
    // given, when
    agencyUpdatePermissionValidator.validate(validateAgencyDto);
    // then
    Mockito.verifyNoInteractions(userAdminService);
  }

  @Test
  void validate_Should_PassValidationIfUserHasPermissionsForAgency() {
    // given
    when(validateAgencyDto.getId()).thenReturn(AGENCY_ID);
    when(authenticatedUser.hasRestrictedAgencyPriviliges()).thenReturn(true);
    when(authenticatedUser.getUserId()).thenReturn("userId");
    when(userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId())).thenReturn(Lists.newArrayList(AGENCY_ID, 2L));
    // when
    agencyUpdatePermissionValidator.validate(validateAgencyDto);
    // then
    Mockito.verify(userAdminService).getAdminUserAgencyIds(authenticatedUser.getUserId());
  }

  @Test
  void validate_Should_ThrowExceptionIfUserDoesNotHavePermissionsForAgency() {
    // given
    when(validateAgencyDto.getId()).thenReturn(AGENCY_ID);
    when(authenticatedUser.hasRestrictedAgencyPriviliges()).thenReturn(true);
    when(authenticatedUser.getUserId()).thenReturn("userId");
    when(userAdminService.getAdminUserAgencyIds(authenticatedUser.getUserId())).thenReturn(Lists.newArrayList(2L, 3L));
    // when, then
    assertThrows(AgencyAccessDeniedException.class, () -> agencyUpdatePermissionValidator.validate(validateAgencyDto));
  }


}