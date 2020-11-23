package de.caritas.cob.agencyservice.api.admin.service;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
public class AgencyAdminSearchServiceIT {

  @Autowired
  private AgencyAdminSearchService agencyAdminSearchService;

  @Test
  public void searchAgencies_Should_returnOneResult_When_perPageIsSetToOne() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies("", 0, 1);

    assertThat(agencies, hasSize(1));
  }

  @Test
  public void searchAgencies_Should_returnOneResult_When_perPageIsSetToOneAndPageIsSetToOne() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies("", 1, 1);

    assertThat(agencies, hasSize(1));
  }

  @Test
  public void searchAgencies_Should_returnEmptyList_When_paginationParamsAreZero() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies(null, 0, 0);

    assertThat(agencies, hasSize(0));
  }

  @Test
  public void searchAgencies_Should_returnEmptyList_When_paginationParamsAreNegative() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies(null, -100, -1000);

    assertThat(agencies, hasSize(0));
  }

  @Test
  public void searchAgencies_Should_returnAllEntities_When_keywordIsNull() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies(null, 0, 1133);

    assertThat(agencies, hasSize(1133));
  }

  @Test
  public void searchAgencies_Should_returnAllEntities_When_keywordIsEmpty() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies("", 0, 1133);

    assertThat(agencies, hasSize(1133));
  }

  @Test
  public void searchAgencies_Should_returnPaginatedEntities_When_paginationParamsAreSplitted() {
    List<AgencyAdminResponseDTO> firstPage = this.agencyAdminSearchService.searchAgencies("", 1, 1000);
    List<AgencyAdminResponseDTO> secondPage = this.agencyAdminSearchService.searchAgencies("", 2, 1000);

    assertThat(firstPage, hasSize(1000));
    assertThat(secondPage, hasSize(133));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_nameContainsDashIndexedValues() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies("Oberschwaben", 0, 2);

    agencies.forEach(agency -> assertThat(agency.getName(), containsString("Oberschwaben")));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_keywordIsValidPlz() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies("88662", 0, 5);

    agencies.forEach(agency -> assertThat(agency.getCity(), is("Überlingen")));
  }

  @Test
  public void searchAgencies_Should_returnMatchingAgencies_When_keywordIsContainedInDifferentFields() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies("1", 0, 500);

    agencies.forEach(agency -> {
      String resultSet = agency.getCity()
          + agency.getName()
          + agency.getPostcode()
          + agency.getDioceseId().toString();
      assertThat(resultSet, containsString("1"));
    });
  }

  @Test
  public void searchAgencies_Should_returnFirstMatchOnDioceseId_When_keywordIsValidDioceseId() {
    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies("1", 0, 5);

    AgencyAdminResponseDTO firstResult = agencies.get(0);
    assertThat(firstResult.getDioceseId(), is(1L));
  }

  @Test
  public void searchAgencies_Should_returnValidResult_When_keywordareSpecialCharacters() {
    String specialChars = "!§$%&/()=?#'*+`^^><";

    List<AgencyAdminResponseDTO> agencies = this.agencyAdminSearchService.searchAgencies(specialChars, 0, 5);

    assertThat(agencies, notNullValue());
  }

}
