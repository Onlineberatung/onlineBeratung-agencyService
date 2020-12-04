package de.caritas.cob.agencyservice.api.exception.customheader;

import de.caritas.cob.agencyservice.api.exception.httpresponses.HttpStatusExceptionReason;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;

@RequiredArgsConstructor
public class CustomHttpHeader {

  private final @NonNull HttpStatusExceptionReason httpStatusExceptionReason;

  public HttpHeaders buildHeader() {
    HttpHeaders headers = new HttpHeaders();
    headers.add("X-Reason", httpStatusExceptionReason.name());
    return headers;
  }
}
