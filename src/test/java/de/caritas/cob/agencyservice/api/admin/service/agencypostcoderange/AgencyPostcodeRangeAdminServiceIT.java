package de.caritas.cob.agencyservice.api.admin.service.agencypostcoderange;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.api.exception.httpresponses.NotFoundException;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostcodeRangeRepository;
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
public class AgencyPostcodeRangeAdminServiceIT extends AgencyPostcodeRangeAdminServiceITBase {

  @Autowired
  private AgencyPostcodeRangeAdminService agencyPostcodeRangeAdminService;

  @Autowired
  private AgencyPostcodeRangeRepository agencyPostcodeRangeRepository;

  @Test
  public void findPostcodeRangesForAgency_Should_returnExpectedResult_When_postcodeRangesExists() {
    super.findPostcodeRangesForAgency_Should_returnExpectedResult_When_postcodeRangesExists();
  }

  @Test
  public void findPostcodeRangesForAgency_Should_haveExpectedLinks_When_postcodeRangesExists() {
    super.findPostcodeRangesForAgency_Should_haveExpectedLinks_When_postcodeRangesExists();
  }

  @Test
  @Transactional
  public void deleteAgencyPostcodeRange_Should_deletePostcodeRange_When_agencyIdExists() {
    super.deleteAgencyPostcodeRange_Should_deletePostcodeRange_When_agencyIdExists();
  }

  @Test(expected = NotFoundException.class)
  public void deleteAgencyPostcodeRange_Should_throwNotFound_When_agencyIdNotExists() {
    super.deleteAgencyPostcodeRange_Should_throwNotFound_When_agencyIdNotExists();
  }

}
