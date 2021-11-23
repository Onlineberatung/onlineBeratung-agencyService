package de.caritas.cob.agencyservice.api.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class QueryScannerTest {

  @InjectMocks
  private QueryScanner underTest;

  @Test
  public void escapeForLuceneShouldReturnNullOnNull() {
    var escapedString = underTest.escapeForLucene(null);

    assertNull(escapedString);
  }

  @Test
  public void escapeForLuceneShouldReturnEmptyOnEmptyString() {
    var escapedString = underTest.escapeForLucene("");

    assertEquals("", escapedString);
  }

  @Test
  public void escapeForLuceneShouldReturnSameAlphanumericString() {
    var text = RandomStringUtils.randomAlphanumeric(32);
    var escapedString = underTest.escapeForLucene(text);

    assertEquals(text, escapedString);
  }

  @Test
  public void escapeForLuceneShouldReturnSameUmlauts() {
    var specialText = RandomStringUtils.random(32, "äöüÄÖÜ");
    var changedString = underTest.escapeForLucene(specialText);

    assertEquals(specialText, changedString);
  }

  @Test
  public void escapeForLuceneShouldEscapeOnSpecialCharacters() {
    var specialText = RandomStringUtils.random(4, "+-|!(){}[]^\"~*?:\\/");
    var escapedString = underTest.escapeForLucene(specialText);

    assertEquals(specialText.length() * 4, escapedString.length());
    assertTrue(escapedString.startsWith("&#"));
  }

  @Test
  public void escapeForLuceneShouldEscapeOnAmpersand() {
    var specialText = RandomStringUtils.randomAlphanumeric(32) + "&"
        + RandomStringUtils.randomAlphanumeric(31);
    var escapedString = underTest.escapeForLucene(specialText);

    assertEquals(64 + 4, escapedString.length());
    assertTrue(escapedString.contains("&amp;"));
  }
}
