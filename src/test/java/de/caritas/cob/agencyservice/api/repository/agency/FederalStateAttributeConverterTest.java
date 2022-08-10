package de.caritas.cob.agencyservice.api.repository.agency;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class FederalStateAttributeConverterTest {

  FederalStateAttributeConverter federalStateAttributeConverter = new FederalStateAttributeConverter();

  @Test
  void convertToDatabaseColumn_Should_ConvertNullToNull() {
    assertThat(federalStateAttributeConverter.convertToDatabaseColumn(null)).isNull();
  }

  @Test
  void convertToDatabaseColumn_Should_ConvertNotNullEnumValueToShortcutString() {
    assertThat(
        federalStateAttributeConverter.convertToDatabaseColumn(FederalState.SACHSEN)).isEqualTo(
        FederalState.SACHSEN.getShortcut());
  }

  @Test
  void convertToEntityAttribute_Should_ConvertShortcutToValidEnumValue() {
    assertThat(federalStateAttributeConverter.convertToEntityAttribute(
        FederalState.SACHSEN.getShortcut())).isEqualTo(FederalState.SACHSEN);
  }

  @Test
  void convertToEntityAttribute_Should_ConvertNullToNull() {
    assertThat(federalStateAttributeConverter.convertToEntityAttribute(null)).isNull();
  }
}