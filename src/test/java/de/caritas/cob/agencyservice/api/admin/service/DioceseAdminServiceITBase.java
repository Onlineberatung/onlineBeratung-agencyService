package de.caritas.cob.agencyservice.api.admin.service;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.model.DioceseResponseDTO;
import de.caritas.cob.agencyservice.api.model.PaginationLinks;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

public class DioceseAdminServiceITBase {

  @Autowired
  protected DioceseAdminService dioceseAdminService;

  public void findAllDioceses_Should_returnOneResult_When_perPageIsSetToOne() {
    List<DioceseResponseDTO> dioceses = this.dioceseAdminService
        .findAllDioceses(0, 1)
        .getEmbedded();

    assertThat(dioceses, hasSize(1));
  }

  public void findAllDioceses_Should_returnOneResult_When_perPageIsSetToOneAndPageIsSetToOne() {
    List<DioceseResponseDTO> dioceses = this.dioceseAdminService
        .findAllDioceses(1, 1)
        .getEmbedded();

    assertThat(dioceses, hasSize(1));
  }

  public void findAllDioceses_Should_returnOneResult_When_paginationParamsAreZero() {
    List<DioceseResponseDTO> dioceses = this.dioceseAdminService
        .findAllDioceses(0, 0)
        .getEmbedded();

    assertThat(dioceses, hasSize(1));
  }

  public void findAllDioceses_Should_returnOneResult_When_paginationParamsAreNegative() {
    List<DioceseResponseDTO> dioceses = this.dioceseAdminService
        .findAllDioceses(-100, -1000)
        .getEmbedded();

    assertThat(dioceses, hasSize(1));
  }

  public void buildAgencyAdminSearchResult_Should_haveExpectedLinks_When_AllParamsAreProvided() {
    PaginationLinks paginationLinks = this.dioceseAdminService
        .findAllDioceses(1, 20).getLinks();

    assertThat(paginationLinks.getSelf(), notNullValue());
    assertThat(paginationLinks.getSelf().getHref(),
        endsWith("/agencyadmin/dioceses?page=1&perPage=20"));
    assertThat(paginationLinks.getPrevious(), nullValue());
    assertThat(paginationLinks.getNext(), notNullValue());
    assertThat(paginationLinks.getNext().getHref(),
        endsWith("/agencyadmin/dioceses?page=2&perPage=20"));
  }
}
