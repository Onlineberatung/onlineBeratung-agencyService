package de.caritas.cob.agencyservice.api.service;

import lombok.Getter;

@Getter
public enum DataProtectionPlaceHolderType {
  DATA_PROTECTION_RESPONSIBLE("responsible"),
  DATA_PROTECTION_OFFICER("dataProtectionOfficer");

  private final String placeholderVariable;

  DataProtectionPlaceHolderType(String placeholderVariable) {
    this.placeholderVariable = placeholderVariable;
  }
}
