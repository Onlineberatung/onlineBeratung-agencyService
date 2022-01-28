package de.caritas.cob.agencyservice.filter;


import static java.util.Collections.enumeration;
import static java.util.Optional.of;
import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;
import static org.mockito.Mockito.when;

import com.google.common.collect.Lists;
import java.net.URISyntaxException;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class SubdomainExtractorTest {

  private static final String MUCOVISCIDOSE = "mucoviscidose";
  private static final String ONLINBEBERATUNG_DE = ".onlineberatung.de";
  private static final String ONLINBEBERATUNG_LOCAL = ".onlineberatung.local";
  private static final String AGENCYSERVICE_DEFAULT = ".agencyservice.default";

  @Mock
  HttpServletRequest request;

  @Mock
  Enumeration<String> headerNames;

  @Mock
  NonInternetDomainSubdomainExtractor nonInternetDomainSubdomainExtractor;

  @InjectMocks
  SubdomainExtractor subdomainExtractor;

  @Test
  void resolveSubdomain_Should_resolveSubdomain() throws URISyntaxException {
    // given
    String url = MUCOVISCIDOSE + ONLINBEBERATUNG_DE;
    // when, then
    assertThat(subdomainExtractor.resolveSubdomain(url, request)).isEqualTo(of(MUCOVISCIDOSE));
  }

  @Test
  void resolveSubdomain_Should_resolveSubdomainForOnlineberatungLocal() throws URISyntaxException {
    // given
    String url = MUCOVISCIDOSE + ONLINBEBERATUNG_LOCAL;
    when(request.getHeaderNames()).thenReturn(headerNames);
    // when
    subdomainExtractor.resolveSubdomain(url, request);
    // then
    Mockito.verify(nonInternetDomainSubdomainExtractor).resolveSubdomain(url, null);
  }

  @Test
  void resolveSubdomain_Should_resolveSubdomainForCompoundSubdomain() throws URISyntaxException {
    // given
    String url = "compound.subdomain" + ONLINBEBERATUNG_DE;
    // when, then
    assertThat(subdomainExtractor.resolveSubdomain(url, request)).isEqualTo(
        of("compound.subdomain"));
  }

  @Test
  void resolveSubdomain_Should_resolveSubdomainFromOriginHeader() throws URISyntaxException {
    // given
    when(request.getHeaderNames()).thenReturn(enumeration(Lists.newArrayList("origin")));
    String originHeader = MUCOVISCIDOSE + ONLINBEBERATUNG_LOCAL;
    when(request.getHeader("origin")).thenReturn(originHeader);
    String url = MUCOVISCIDOSE + AGENCYSERVICE_DEFAULT;

    // when
    subdomainExtractor.resolveSubdomain(url, request);
    // then
    Mockito.verify(nonInternetDomainSubdomainExtractor).resolveSubdomain(url, originHeader);

  }

  @Test
  void resolveSubdomain_Should_resolveEmptySubdomainForLocalhost() throws URISyntaxException {
    // given
    when(request.getHeaderNames()).thenReturn(headerNames);
    String url = "localhost";
    // when, then
    assertThat(subdomainExtractor.resolveSubdomain(url, request)).isEmpty();
  }
}