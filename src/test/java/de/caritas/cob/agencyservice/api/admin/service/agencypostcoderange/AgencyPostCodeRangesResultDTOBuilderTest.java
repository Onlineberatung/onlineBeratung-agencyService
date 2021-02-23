package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import static de.caritas.cob.agencyservice.testHelper.TestConstants.AGENCY_ID;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.PAGE_1;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.PAGE_2;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.PAGE_3;
import static de.caritas.cob.agencyservice.testHelper.TestConstants.PER_PAGE_1;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;
import static org.junit.Assert.assertEquals;

import de.caritas.cob.agencyservice.api.model.AgencyPostcodeRangesResultDTO;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import de.caritas.cob.agencyservice.api.model.PaginationLinks;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import java.util.stream.Collectors;
import org.jeasy.random.EasyRandom;
import org.junit.Before;
import org.junit.Test;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

public class AgencyPostCodeRangesResultDTOBuilderTest {

  private Page<AgencyPostCodeRange> agencyPostCodeRanges;

  @Before
  public void init() {
    EasyRandom easyRandom = new EasyRandom();
    this.agencyPostCodeRanges = new PageImpl(easyRandom.objects(AgencyPostCodeRange.class, 5)
        .collect(Collectors.toList()));
  }

  @Test
  public void build_Should_Return_CorrectNumberOfResults() {

    AgencyPostcodeRangesResultDTO result = AgencyPostCodeRangesResultDTOBuilder.getInstance()
        .withPage(PAGE_1)
        .withPerPage(PER_PAGE_1)
        .withResultPage(this.agencyPostCodeRanges)
        .withAgencyId(AGENCY_ID)
        .build();

    assertEquals(Integer.toUnsignedLong(result.getEmbedded().size()),
        this.agencyPostCodeRanges.getTotalElements());
  }

  @Test
  public void build_Should_Return_ValidHalLinks() {

    AgencyPostcodeRangesResultDTO result = AgencyPostCodeRangesResultDTOBuilder.getInstance()
        .withPage(PAGE_2)
        .withPerPage(PER_PAGE_1)
        .withResultPage(this.agencyPostCodeRanges)
        .withAgencyId(AGENCY_ID)
        .build();
    PaginationLinks paginationLinks = result.getLinks();

    assertThat(paginationLinks.getSelf().getHref(),
        endsWith("/agencyadmin/agency/" + AGENCY_ID + "/postcoderanges?page=" + PAGE_2 + "&perPage="
            + PER_PAGE_1));
    assertEquals(paginationLinks.getSelf().getMethod().getValue(), MethodEnum.GET.getValue());
    assertThat(paginationLinks.getNext().getHref(),
        endsWith("/agencyadmin/agency/" + AGENCY_ID + "/postcoderanges?page=" + PAGE_3 + "&perPage="
            + PER_PAGE_1));
    assertThat(paginationLinks.getPrevious().getHref(),
        endsWith("/agencyadmin/agency/" + AGENCY_ID + "/postcoderanges?page=" + PAGE_1 + "&perPage="
            + PER_PAGE_1));
  }

  @Test
  public void build_Should_havePreviousLink_When_currentPageIsNotTheFirst() {
    AgencyPostcodeRangesResultDTO result = AgencyPostCodeRangesResultDTOBuilder.getInstance()
        .withPage(PAGE_2)
        .withPerPage(PER_PAGE_1)
        .withResultPage(this.agencyPostCodeRanges)
        .withAgencyId(AGENCY_ID)
        .build();
    PaginationLinks paginationLinks = result.getLinks();

    assertThat(paginationLinks.getPrevious(), notNullValue());
    assertThat(paginationLinks.getPrevious().getHref(),
        endsWith("/agencyadmin/agency/" + AGENCY_ID + "/postcoderanges?page=" + PAGE_1 + "&perPage="
            + PER_PAGE_1));
  }

  @Test
  public void build_Should_notHavePreviousLink_When_currentPageIsTheFirst() {
    AgencyPostcodeRangesResultDTO result = AgencyPostCodeRangesResultDTOBuilder.getInstance()
        .withPage(PAGE_1)
        .withPerPage(PER_PAGE_1)
        .withResultPage(this.agencyPostCodeRanges)
        .withAgencyId(AGENCY_ID)
        .build();
    PaginationLinks paginationLinks = result.getLinks();

    assertThat(paginationLinks.getPrevious(), nullValue());
  }

  @Test
  public void build_Should_haveNextLink_When_currentPageIsNotTheLast() {
    AgencyPostcodeRangesResultDTO result = AgencyPostCodeRangesResultDTOBuilder.getInstance()
        .withPage(PAGE_2)
        .withPerPage(PER_PAGE_1)
        .withResultPage(this.agencyPostCodeRanges)
        .withAgencyId(AGENCY_ID)
        .build();
    PaginationLinks paginationLinks = result.getLinks();

    assertThat(paginationLinks.getNext(), notNullValue());
    assertThat(paginationLinks.getNext().getHref(),
        endsWith("/agencyadmin/agency/" + AGENCY_ID + "/postcoderanges?page=" + PAGE_3 + "&perPage="
            + PER_PAGE_1));
  }

  @Test
  public void build_Should_notHaveNextLink_When_currentPageIsTheLast() {
    AgencyPostcodeRangesResultDTO result = AgencyPostCodeRangesResultDTOBuilder.getInstance()
        .withPage(5)
        .withPerPage(PER_PAGE_1)
        .withResultPage(this.agencyPostCodeRanges)
        .withAgencyId(AGENCY_ID)
        .build();
    PaginationLinks paginationLinks = result.getLinks();

    assertThat(paginationLinks.getNext(), nullValue());
  }
}
