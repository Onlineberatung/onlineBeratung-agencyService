package de.caritas.cob.agencyservice.api.util;

import static de.caritas.cob.agencyservice.api.util.HttpUrlUtils.removeHttpPrefix;
import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;

class HttpUrlUtilsTest {

  @Test
  void removeHttpPrefix_Should_RemoveHttp() {
    assertThat(removeHttpPrefix("http://onlineberatung.local")).isEqualTo("onlineberatung.local");
  }

  @Test
  void removeHttpPrefix_Should_RemoveHttps() {
    assertThat(removeHttpPrefix("https://onlineberatung.local")).isEqualTo("onlineberatung.local");
  }

  @Test
  void removeHttpPrefix_Should_GetExceptionIfSiteIsNull() {
    // then
    assertThrows(NullPointerException.class, () -> {
      // when
      removeHttpPrefix(null);
    });
  }
}