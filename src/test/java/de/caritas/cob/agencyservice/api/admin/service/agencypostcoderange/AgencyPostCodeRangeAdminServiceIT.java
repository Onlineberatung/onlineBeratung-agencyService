package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.model.PaginationLinks;
import de.caritas.cob.agencyservice.api.model.PostCodeRangeResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRangeRepository;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
public class AgencyPostCodeRangeAdminServiceIT {

  @Autowired
  private AgencyPostCodeRangeAdminService agencyPostCodeRangeAdminService;

  @Autowired
  private AgencyPostCodeRangeRepository agencyPostCodeRangeRepository;

  @Test
  public void findPostCodeRangesForAgency_Should_returnOneResult_When_perPageIsSetToOne() {
    var postCodeRanges = this.agencyPostCodeRangeAdminService
        .findPostcodeRangesForAgency(0, 1, 0L)
        .getEmbedded();

    assertThat(postCodeRanges, hasSize(1));
  }

  @Test
  public void findPostCodeRangesForAgency_Should_returnExpectedResult_When_perPageIsSetToOne() {
    var postCodeRange = this.agencyPostCodeRangeAdminService
        .findPostcodeRangesForAgency(0, 1, 0L)
        .getEmbedded()
        .iterator()
        .next()
        .getEmbedded();

    assertThat(postCodeRange, notNullValue());
    assertThat(postCodeRange.getAgencyId(), notNullValue());
    assertThat(postCodeRange.getId(), notNullValue());
    assertThat(postCodeRange.getPostcodeFrom(), notNullValue());
    assertThat(postCodeRange.getPostcodeTo(), notNullValue());
    assertThat(postCodeRange.getCreateDate(), notNullValue());
    assertThat(postCodeRange.getUpdateDate(), notNullValue());
  }

  @Test
  public void findPostCodeRangesForAgency_Should_returnOneResult_When_pageIsSetToOneAndPerPageIsSetToOne() {
    var postCodeRanges = this.agencyPostCodeRangeAdminService
        .findPostcodeRangesForAgency(1, 1, 15L)
        .getEmbedded();

    assertThat(postCodeRanges, hasSize(1));
  }

  @Test
  public void findPostCodeRangesForAgency_Should_returnOneResult_When_paginationParamsAreZero() {
    var postCodeRanges = this.agencyPostCodeRangeAdminService
        .findPostcodeRangesForAgency(0, 0, 0L)
        .getEmbedded();

    assertThat(postCodeRanges, hasSize(1));
  }

  @Test
  public void findPostCodeRangesForAgency_Should_returnOneResult_When_paginationParamsAreNegative() {
    var postCodeRanges = this.agencyPostCodeRangeAdminService
        .findPostcodeRangesForAgency(-100, -10, 0L)
        .getEmbedded();

    assertThat(postCodeRanges, hasSize(1));
  }


  @Test
  public void findPostCodeRangesForAgency_Should_returnPaginatedEntities_When_paginationParamsAreSplitted() {
    var firstPage = this.agencyPostCodeRangeAdminService
        .findPostcodeRangesForAgency(1, 20, 15L)
        .getEmbedded();
    var secondPage = this.agencyPostCodeRangeAdminService
        .findPostcodeRangesForAgency(2, 20, 15L)
        .getEmbedded();

    assertThat(firstPage, hasSize(20));
    assertThat(secondPage, hasSize(10));
  }

  @Test
  public void findPostCodeRangesForAgency_Should_haveExpectedLinks_When_AllParamsAreProvided() {
    var paginationLinks = this.agencyPostCodeRangeAdminService
        .findPostcodeRangesForAgency(2, 2, 15L).getLinks();

    assertThat(paginationLinks.getSelf(), notNullValue());
    assertThat(paginationLinks.getSelf().getHref(),
        endsWith("/agencyadmin/agencies/15/postcoderanges?page=2&perPage=2"));
    assertThat(paginationLinks.getNext(), notNullValue());
    assertThat(paginationLinks.getNext().getHref(),
        endsWith("/agencyadmin/agencies/15/postcoderanges?page=3&perPage=2"));
    assertThat(paginationLinks.getPrevious(), notNullValue());
    assertThat(paginationLinks.getPrevious().getHref(),
        endsWith("/agencyadmin/agencies/15/postcoderanges?page=1&perPage=2"));
  }

  @Test
  @Transactional
  public void deleteAgencyPostcodeRange_Should_deletePostcodeRange_When_postcodeRangeIdExists() {
    var agencyPostCodeRangeId = 14351L;

    this.agencyPostCodeRangeAdminService.deleteAgencyPostcodeRange(agencyPostCodeRangeId);

    assertThat(this.agencyPostCodeRangeRepository.findById(agencyPostCodeRangeId).isPresent(),
        is(false));
  }

  @Test(expected = NotFoundException.class)
  public void deleteAgencyPostcodeRange_Should_throwNotFound_When_postcodeRangeIdNotExists() {
    var agencyPostCodeRangeId = -1L;

    this.agencyPostCodeRangeAdminService.deleteAgencyPostcodeRange(agencyPostCodeRangeId);
  }

  @Test
  public void findPostcodeRangeById_Should_returnExpectedPostcodeRange_When_postcodeRangeExists() {
    var postCodeRange = this.agencyPostCodeRangeAdminService.findPostcodeRangeById(1L);

    assertThat(postCodeRange, notNullValue());
    assertThat(postCodeRange.getLinks(), notNullValue());
    assertThat(postCodeRange.getEmbedded(), notNullValue());
  }

  @Test(expected = NotFoundException.class)
  public void findPostcodeRangeById_Should_throwNotFoundException_When_postcodeRangeDoesNotExists() {
    this.agencyPostCodeRangeAdminService.findPostcodeRangeById(-1L);
  }

}
