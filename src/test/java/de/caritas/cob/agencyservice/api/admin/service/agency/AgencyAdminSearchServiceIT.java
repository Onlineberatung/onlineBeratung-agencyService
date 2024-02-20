package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.util.AuthenticatedUser;
import de.caritas.cob.agencyservice.api.model.Sort;
import de.caritas.cob.agencyservice.api.model.Sort.FieldEnum;
import de.caritas.cob.agencyservice.api.service.securityheader.SecurityHeaderSupplier;
import de.caritas.cob.agencyservice.config.apiclient.UserAdminServiceApiControllerFactory;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.AdminAgencyResponseDTO;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.useradminservice.generated.web.model.AgencyAdminResponseDTO;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpHeaders;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
class AgencyAdminSearchServiceIT {

  private static final long FIRST_AGENCY_ID = 2L;
  @Autowired
  private AgencyAdminSearchService agencyAdminSearchService;

  @MockBean
  private AuthenticatedUser authenticatedUser;

  @MockBean
  private de.caritas.cob.agencyservice.useradminservice.generated.web.AdminUserControllerApi adminUserControllerApi;

  @MockBean
  private UserAdminServiceApiControllerFactory userAdminServiceApiControllerFactory;

  @MockBean
  private SecurityHeaderSupplier securityHeaderSupplier;

  @Test
  void searchAgency_Should_FindAgencies() {
    // given, when
    var agencySearchResult = agencyAdminSearchService.searchAgencies("", 1, 10, new Sort());
    // then
    assertThat(agencySearchResult.getEmbedded()).isNotEmpty();
    assertThat(agencySearchResult.getEmbedded()).hasSize(10);
  }

  @Test
  void searchAgency_Should_FindOnlyAgenciesManagedByTheAdmin_WhenUserIsAgencyAdmin() {
    // given
    when(authenticatedUser.hasRestrictedAgencyPriviliges()).thenReturn(true);
    when(authenticatedUser.getUserId()).thenReturn("userId");
    when(securityHeaderSupplier.getKeycloakAndCsrfHttpHeaders()).thenReturn(new HttpHeaders());
    when(userAdminServiceApiControllerFactory.createControllerApi()).thenReturn(adminUserControllerApi);
    when(adminUserControllerApi.getAdminAgencies("userId")).thenReturn(Lists.newArrayList(2L, 3L));

    // when
    var agencySearchResult = agencyAdminSearchService.searchAgencies("", 1, 10, new Sort());

    // then
    assertThat(agencySearchResult.getEmbedded()).hasSize(2);
    assertThat(agencySearchResult.getEmbedded()).extracting("embedded.id").containsOnly(2L, 3L);
  }

  @Test
  void searchAgency_Should_FindOnlyAgenciesManagedByTheAdmin_WhenUserIsAgencyAdmin_AndSortByPostcodeAscending() {
    // given
    when(authenticatedUser.hasRestrictedAgencyPriviliges()).thenReturn(false);
    when(authenticatedUser.getUserId()).thenReturn("userId");
    when(securityHeaderSupplier.getKeycloakAndCsrfHttpHeaders()).thenReturn(new HttpHeaders());
    when(userAdminServiceApiControllerFactory.createControllerApi()).thenReturn(adminUserControllerApi);
    when(adminUserControllerApi.getAdminAgencies("userId")).thenReturn(Lists.newArrayList(2L, 3L));

    // when
    var agencySearchResult = agencyAdminSearchService.searchAgencies("", 1, 20, new Sort().field(Sort.FieldEnum.POSTCODE).order(Sort.OrderEnum.ASC));

    // then
    assertThat(agencySearchResult.getEmbedded()).hasSize(20);

    List<String> collect = agencySearchResult.getEmbedded().stream().filter(result -> result.getEmbedded().getPostcode() != null).map(p -> p.getEmbedded().getPostcode()).collect(Collectors.toList());
    assertThat(collect).isSorted();
  }

  @Test
  void searchAgency_Should_FindOnlyAgenciesManagedByTheAdmin_WhenUserIsAgencyAdmin_AndSortByOffline() {
    // given
    when(authenticatedUser.hasRestrictedAgencyPriviliges()).thenReturn(false);
    when(authenticatedUser.getUserId()).thenReturn("userId");
    when(securityHeaderSupplier.getKeycloakAndCsrfHttpHeaders()).thenReturn(new HttpHeaders());
    when(userAdminServiceApiControllerFactory.createControllerApi()).thenReturn(adminUserControllerApi);
    when(adminUserControllerApi.getAdminAgencies("userId")).thenReturn(Lists.newArrayList(2L, 3L));

    // when
    var agencySearchResult = agencyAdminSearchService.searchAgencies("", 1, 20, new Sort().field(
        FieldEnum.OFFLINE).order(Sort.OrderEnum.ASC));

    // then
    assertThat(agencySearchResult.getEmbedded()).hasSize(20);

    List<Boolean> collect = agencySearchResult.getEmbedded().stream().filter(result -> result.getEmbedded().getOffline() != null).map(p -> p.getEmbedded().getOffline()).collect(Collectors.toList());
    assertThat(collect).isSorted();
  }

  @Test
  void searchAgency_Should_FindOnlyAgenciesManagedByTheAdmin_WhenUserIsAgencyAdmin_AndSortByPostcodeDescending() {
    // given
    when(authenticatedUser.hasRestrictedAgencyPriviliges()).thenReturn(false);
    when(authenticatedUser.getUserId()).thenReturn("userId");
    when(securityHeaderSupplier.getKeycloakAndCsrfHttpHeaders()).thenReturn(new HttpHeaders());
    when(userAdminServiceApiControllerFactory.createControllerApi()).thenReturn(adminUserControllerApi);
    when(adminUserControllerApi.getAdminAgencies("userId")).thenReturn(Lists.newArrayList(2L, 3L));

    // when
    var agencySearchResult = agencyAdminSearchService.searchAgencies("", 1, 20, new Sort().field(Sort.FieldEnum.POSTCODE).order(Sort.OrderEnum.DESC));

    // then
    assertThat(agencySearchResult.getEmbedded()).hasSize(20);

    List<String> collect = agencySearchResult.getEmbedded().stream().filter(result -> result.getEmbedded().getPostcode() != null).map(p -> p.getEmbedded().getPostcode()).collect(Collectors.toList());
    assertThat(collect).isSortedAccordingTo(Comparator.reverseOrder());
  }

  @Test
  void searchAgency_Should_NotFindAnyAgencies_WhenUserIsAgencyAdminButDoesntManageAnyAgencies() {
    // given
    when(authenticatedUser.hasRestrictedAgencyPriviliges()).thenReturn(true);
    when(authenticatedUser.getUserId()).thenReturn("userId");
    when(securityHeaderSupplier.getKeycloakAndCsrfHttpHeaders()).thenReturn(new HttpHeaders());
    when(userAdminServiceApiControllerFactory.createControllerApi()).thenReturn(adminUserControllerApi);
    when(adminUserControllerApi.getAdminAgencies("userId")).thenReturn(Lists.newArrayList());

    // when
    var agencySearchResult = agencyAdminSearchService.searchAgencies("", 1, 10, new Sort());

    // then
    assertThat(agencySearchResult.getEmbedded()).isEmpty();

  }

  private AdminAgencyResponseDTO getAdminAgencies(Long... agencyIds) {
    AdminAgencyResponseDTO adminAgencyResponseDTO = new AdminAgencyResponseDTO();
    for (Long agencyId : agencyIds) {
      adminAgencyResponseDTO.addEmbeddedItem(new AgencyAdminFullResponseDTO().embedded(new AgencyAdminResponseDTO().id(agencyId)));
    }
    return adminAgencyResponseDTO;
  }


}