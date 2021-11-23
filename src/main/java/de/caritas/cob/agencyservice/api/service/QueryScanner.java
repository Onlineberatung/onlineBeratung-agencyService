package de.caritas.cob.agencyservice.api.service;

import static org.apache.commons.lang3.StringUtils.isNoneBlank;

import org.springframework.stereotype.Service;

@Service
public class QueryScanner {

  public String escapeForLucene(String searchString) {
    if (isNoneBlank(searchString)) {
      var stringBuilder = new StringBuilder();

      for (int i = 0; i < searchString.length(); ++i) {
        char c = searchString.charAt(i);
        if ("äöüÄÖÜ".indexOf(c) > -1 || c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z'
            || c >= '0' && c <= '9') {
          stringBuilder.append(c);
        } else if (c == '&') {
          stringBuilder.append("&amp;");
        } else if (Character.isWhitespace(c)) {
          stringBuilder.append("&#").append(c).append(";");
        } else if (!Character.isISOControl(c)) {
          if (Character.isHighSurrogate(c)) {
            char low = searchString.charAt(i + 1);
            int codePoint = Character.toCodePoint(c, low);
            if (Character.isDefined(codePoint)) {
              stringBuilder.append("&#").append(codePoint).append(";");
            }
            ++i;
          } else {
            if (Character.isDefined(c)) {
              stringBuilder.append("&#").append(c).append(";");
            }
          }
        }
      }

      return stringBuilder.toString();
    } else {
      return searchString;
    }
  }
}
