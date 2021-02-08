package de.caritas.cob.agencyservice.api.config.apiclient;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

import de.caritas.cob.agencyservice.AgencyServiceApplication;
import de.caritas.cob.agencyservice.useradminservice.generated.web.AdminUserControllerApi;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AgencyServiceApplication.class)
@TestPropertySource(properties = "spring.profiles.active=testing")
@AutoConfigureTestDatabase(replace = Replace.ANY)
public class UserAdminServiceApiClientConfigIT {

  @Autowired
  private AdminUserControllerApi adminUserControllerApi;

  @Value("${user.admin.service.api.url}")
  private String adminUserApiBaseUrl;

  @Test
  public void configureUserControllerApi_Should_setCorrectApiUrl() {
    String apiClientUrl = this.adminUserControllerApi.getApiClient().getBasePath();

    assertThat(apiClientUrl, is(this.adminUserApiBaseUrl));
  }

}
