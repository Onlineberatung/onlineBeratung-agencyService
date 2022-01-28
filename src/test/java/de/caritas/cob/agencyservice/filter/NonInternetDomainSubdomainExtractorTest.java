package de.caritas.cob.agencyservice.filter;


import static java.util.Optional.of;
import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;

import java.net.URISyntaxException;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class NonInternetDomainSubdomainExtractorTest {

  private static final String MUCOVISCIDOSE = "mucoviscidose";
  private static final String ONLINBEBERATUNG_LOCAL = ".onlineberatung.local";
  private static final String AGENCYSERVICE_DEFAULT = ".agencyservice.default";

  private NonInternetDomainSubdomainExtractor subdomainExtractor = getSubdomainExtractor();

  private NonInternetDomainSubdomainExtractor getSubdomainExtractor() {
    var subdomainExtractor = new NonInternetDomainSubdomainExtractor();
    subdomainExtractor.setApplicationBaseUrl("https://onlineberatung.local");
    return subdomainExtractor;
  }

  @Test
  void resolveSubdomain_Should_resolveSubdomainForOnlineberatungLocal() throws URISyntaxException {
    // given
    String url = MUCOVISCIDOSE + ONLINBEBERATUNG_LOCAL;

    // when, then
    assertThat(subdomainExtractor.resolveSubdomain(url, "")).isEqualTo(of(MUCOVISCIDOSE));
  }

  @Test
  void resolveSubdomain_Should_resolveSubdomainFromOriginHeader() throws URISyntaxException {
    // given
    String url = MUCOVISCIDOSE + AGENCYSERVICE_DEFAULT;
    // when, then
    assertThat(
        subdomainExtractor.resolveSubdomain(url, MUCOVISCIDOSE + ONLINBEBERATUNG_LOCAL)).isEqualTo(
        of(MUCOVISCIDOSE));
  }

  @Test
  void resolveSubdomain_Should_resolveSubdomainFromOriginHeaderIfDomainIncludesHttpPrefix()
      throws URISyntaxException {
    // given
    String url = "http://" + MUCOVISCIDOSE + AGENCYSERVICE_DEFAULT;
    // when, then
    assertThat(subdomainExtractor.resolveSubdomain(url,
        "http://" + MUCOVISCIDOSE + ONLINBEBERATUNG_LOCAL)).isEqualTo(of(MUCOVISCIDOSE));
  }

  @Test
  void resolveSubdomain_Should_resolveSubdomainFromOriginHeaderIfDomainIncludesHttpsPrefix()
      throws URISyntaxException {
    // given
    String url = "https://" + MUCOVISCIDOSE + AGENCYSERVICE_DEFAULT;
    // when, then
    assertThat(subdomainExtractor.resolveSubdomain(url, "https://" + MUCOVISCIDOSE + ONLINBEBERATUNG_LOCAL)).isEqualTo(of(MUCOVISCIDOSE));
  }

  @Test
  void resolveSubdomain_Should_resolveEmptySubdomainForLocalhost() throws URISyntaxException {
    // given
    String url = "localhost";
    // when, then
    assertThat(subdomainExtractor.resolveSubdomain(url, "")).isEmpty();
  }
}