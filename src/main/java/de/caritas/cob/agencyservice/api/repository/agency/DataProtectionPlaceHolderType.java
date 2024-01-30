package de.caritas.cob.agencyservice.api.repository.agency;

import lombok.Getter;

@Getter
public enum DataProtectionPlaceHolderType {
  DATA_PROTECTION_RESPONSIBLE("responsible"),
  DATA_PROTECTION_OFFICER("dataProtectionOfficer");

  private final String placeholderVariable;

  DataProtectionPlaceHolderType(String placeholderVariable) {
    this.placeholderVariable = placeholderVariable;
  }

  public static boolean anyExistsInText(String privacy) {
    return DATA_PROTECTION_RESPONSIBLE.existsInText(privacy)
        || DATA_PROTECTION_OFFICER.existsInText(privacy);
  }

  public boolean existsInText(String text) {
    return text.contains(getPlaceholder());
  }

  public String getPlaceholder() {
    return "${" + placeholderVariable + "}";
  }
}
