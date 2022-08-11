package de.caritas.cob.agencyservice.api.repository.agency;

import javax.persistence.AttributeConverter;

public class FederalStateAttributeConverter implements AttributeConverter<FederalState, String> {

  @Override
  public String convertToDatabaseColumn(FederalState federalState) {
    return federalState == null ? null : federalState.getShortcut();
  }

  @Override
  public FederalState convertToEntityAttribute(String dbValue) {
    return FederalState.findByShortcut(dbValue).orElse(null);
  }
}
