package de.caritas.cob.agencyservice.api.service;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

@Service
@Scope(scopeName = WebApplicationContext.SCOPE_APPLICATION)
public class TenantService {

  public String getTenantId() {
    return "1";
  }

}
