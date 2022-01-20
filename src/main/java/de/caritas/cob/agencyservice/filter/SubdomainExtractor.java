package de.caritas.cob.agencyservice.filter;

import com.google.common.net.InternetDomainName;
import java.util.Optional;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
public class SubdomainExtractor {

  public Optional<String> getCurrentSubdomain() {
    var request =
        ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
            .getRequest();
    return extractSubdomain(request.getServerName());
  }

  Optional<String> extractSubdomain(String site) {
    var domainName = InternetDomainName.from(site);
    if (domainName.hasParent()) {
      var subDomain = site.replaceAll(domainName.topPrivateDomain().toString(), "");
      return Optional.of(subDomain.substring(0, subDomain.length() - 1));
    } else {
      return Optional.empty();
    }
  }
}
