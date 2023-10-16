package de.caritas.cob.agencyservice.api.repository.agency;

public enum DataProtectionResponsibleEntity {

  AGENCY_RESPONSIBLE("AGENCY_RESPONSIBLE"),

  ALTERNATIVE_REPRESENTATIVE("ALTERNATIVE_REPRESENTATIVE"),

  DATA_PROTECTION_OFFICER("DATA_PROTECTION_OFFICER");

  private String value;

  DataProtectionResponsibleEntity(String value) {
    this.value = value;
  }


}
