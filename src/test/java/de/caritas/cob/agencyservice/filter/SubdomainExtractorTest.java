package de.caritas.cob.agencyservice.filter;


import static java.util.Optional.of;
import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;

import org.junit.jupiter.api.Test;

class SubdomainExtractorTest {

  private static final String MUCOVISCIDOSE = "mucoviscidose";
  private static final String ONLINBEBERATUNG_DE = ".onlinbeberatung.de";
  private SubdomainExtractor subdomainExtractor = new SubdomainExtractor();

  @Test
  void resolveSubdomain_Should_resolveSubdomain() {
    // given
    String url = MUCOVISCIDOSE + ONLINBEBERATUNG_DE;
    // when, then
    assertThat(subdomainExtractor.extractSubdomain(url)).isEqualTo(of(MUCOVISCIDOSE));
  }

  @Test
  void resolveSubdomain_Should_resolveSubdomainForCompoudSubdomain() {
    // given
    String url = "compound.subdomain" + ONLINBEBERATUNG_DE;
    // when, then
    assertThat(subdomainExtractor.extractSubdomain(url)).isEqualTo(of("compound.subdomain"));
  }

  @Test
  void resolveSubdomain_Should_resolveEmptySubdomainForLocalhost() {
    // given
    String url = "localhost";
    // when, then
    assertThat(subdomainExtractor.extractSubdomain(url)).isEmpty();
  }

}