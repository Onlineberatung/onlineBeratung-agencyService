package de.caritas.cob.agencyservice.api.admin.hallink;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import de.caritas.cob.agencyservice.api.model.HalLink;
import de.caritas.cob.agencyservice.api.model.HalLink.MethodEnum;
import org.springframework.hateoas.Link;
import org.springframework.http.HttpEntity;

public interface HalLinkBuilder {

  default HalLink buildHalLink(HttpEntity<?> httpEntity, MethodEnum method) {
    Link link = linkTo(httpEntity).withSelfRel();
    HalLink halLink = new HalLink();
    halLink.setHref(link.getHref());
    halLink.setMethod(method);
    halLink.setTemplated(link.isTemplated());
    return halLink;
  }

}
