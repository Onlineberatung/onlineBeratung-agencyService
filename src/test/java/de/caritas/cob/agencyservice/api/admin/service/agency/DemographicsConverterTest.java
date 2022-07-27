package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.assertj.core.api.Assertions.assertThat;

import de.caritas.cob.agencyservice.api.model.DemographicsDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import org.junit.jupiter.api.Test;

class DemographicsConverterTest {

  @Test
  void fromAgency_Should_ConvertEmptyGenderListWhenGenderIsNull() {
    // given
    Agency agency = givenAgencyWithDemographicsGenderValue(null);
    DemographicsConverter demographicsConverter = new DemographicsConverter();

    // when
    DemographicsDTO demographicsDTO = demographicsConverter.convertToDTO(agency);

    // then
    assertThat(demographicsDTO.getGenders()).isEmpty();
  }

  @Test
  void fromAgency_Should_ConvertToEmptyGenderListWhenEmptyString() {
    // given
    Agency agency = givenAgencyWithDemographicsGenderValue("");
    DemographicsConverter demographicsConverter = new DemographicsConverter();

    // when
    DemographicsDTO demographicsDTO = demographicsConverter.convertToDTO(agency);

    // then
    assertThat(demographicsDTO.getGenders()).isEmpty();
  }

  @Test
  void fromAgency_Should_ConvertGenderList() {
    // given
    Agency agency = givenAgencyWithDemographicsGenderValue("FEMALE,MALE");
    DemographicsConverter demographicsConverter = new DemographicsConverter();

    // when
    DemographicsDTO demographicsDTO = demographicsConverter.convertToDTO(agency);

    // then
    assertThat(demographicsDTO.getGenders()).containsExactly("FEMALE", "MALE");
  }

  private Agency givenAgencyWithDemographicsGenderValue(String gender) {
    Agency agency = givenAgencyWithAgeRange();
    agency.setGenders(gender);
    return agency;
  }

  private Agency givenAgencyWithAgeRange() {
    Agency agency = new Agency();
    agency.setAgeTo((short) 55);
    agency.setAgeFrom((short) 100);
    return agency;
  }
}