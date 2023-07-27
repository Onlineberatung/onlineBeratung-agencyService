package de.caritas.cob.agencyservice.filter;


import static java.util.Collections.enumeration;
import static java.util.Optional.of;
import static org.assertj.core.api.AssertionsForInterfaceTypes.assertThat;
import static org.mockito.Mockito.when;

import com.google.common.collect.Lists;
import java.net.URISyntaxException;
import java.util.Enumeration;
import jakarta.servlet.http.HttpServletRequest;
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

  @Mock
  HttpServletRequest request;

  @Mock
  Enumeration<String> headerNames;

  @InjectMocks
  SubdomainExtractor subdomainExtractor;

  @Test
  void resolveSubdomain_Should_resolveSubdomain() throws URISyntaxException {
    // given
    String url = MUCOVISCIDOSE + ONLINBEBERATUNG_DE;
    // when, then
    assertThat(subdomainExtractor.getSubdomain(url)).isEqualTo(of("mucoviscidose"));
  }

}