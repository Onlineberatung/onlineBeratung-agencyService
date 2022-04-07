package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRangeRepository;
import org.springframework.beans.factory.annotation.Autowired;

public class AgencyPostcodeRangeAdminServiceITBase {

  @Autowired
  private AgencyPostcodeRangeAdminService agencyPostcodeRangeAdminService;

  @Autowired
  private AgencyPostcodeRangeRepository agencyPostcodeRangeRepository;

  public void findPostcodeRangesForAgency_Should_returnExpectedResult_When_postcodeRangesExists() {
    var postcodeRange = this.agencyPostcodeRangeAdminService
        .findPostcodeRangesForAgency(0L)
        .getEmbedded();

    assertThat(postcodeRange, notNullValue());
    assertThat(postcodeRange.getId(), notNullValue());
    assertThat(postcodeRange.getPostcodeRanges(), notNullValue());
  }

  public void findPostcodeRangesForAgency_Should_haveExpectedLinks_When_postcodeRangesExists() {
    var links = this.agencyPostcodeRangeAdminService
        .findPostcodeRangesForAgency(15L).getLinks();

    assertThat(links.getSelf(), notNullValue());
    assertThat(links.getSelf().getHref(),
        endsWith("/agencyadmin/postcoderanges/15"));
    assertThat(links.getDelete(), notNullValue());
    assertThat(links.getDelete().getHref(),
        endsWith("/agencyadmin/postcoderanges/15"));
    assertThat(links.getUpdate(), notNullValue());
    assertThat(links.getUpdate().getHref(),
        endsWith("/agencyadmin/postcoderanges/15"));
  }

  public void deleteAgencyPostcodeRange_Should_deletePostcodeRange_When_agencyIdExists() {
    var agencyId = 15L;

    this.agencyPostcodeRangeAdminService.deleteAgencyPostcodeRange(agencyId);

    assertThat(this.agencyPostcodeRangeRepository.findAllByAgencyId(agencyId), hasSize(0));
  }

  public void deleteAgencyPostcodeRange_Should_throwNotFound_When_agencyIdNotExists() {
    var agencyId = -1L;

    this.agencyPostcodeRangeAdminService.deleteAgencyPostcodeRange(agencyId);
  }

}
