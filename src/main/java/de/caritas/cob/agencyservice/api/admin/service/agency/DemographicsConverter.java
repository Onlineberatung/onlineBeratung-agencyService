package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.springframework.util.StringUtils.isEmpty;

import com.google.common.base.Joiner;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.DemographicsDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.Agency.AgencyBuilder;
import de.caritas.cob.agencyservice.api.repository.agency.Gender;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Builder to build an {@link AgencyAdminFullResponseDTO()} from an {@link Agency} instance.
 */
@RequiredArgsConstructor
@Component
public class DemographicsConverter {

  public DemographicsDTO convertToDTO(Agency agency) {
    return new DemographicsDTO().ageTo(nullSafeToInteger(agency.getAgeTo()))
        .ageFrom(nullSafeToInteger(agency.getAgeFrom())).genders(getGenderNames(agency));
  }

  public void convertToEntity(DemographicsDTO demographicsDTO, AgencyBuilder agencyBuilder) {
    convertGender(demographicsDTO, agencyBuilder);
    agencyBuilder.ageTo(nullSafeToShort(demographicsDTO.getAgeTo()));
    agencyBuilder.ageFrom(nullSafeToShort(demographicsDTO.getAgeFrom()));
  }

  private Short nullSafeToShort(Integer age) {
    return age != null ? age.shortValue() : null;
  }

  private void convertGender(DemographicsDTO demographicsDTO, AgencyBuilder agencyBuilder) {
    List<String> genders = getValidatedGenders(demographicsDTO);
    if (genders != null) {
      agencyBuilder.genders(joinToCommaSeparatedValues(genders));
    }
  }

  private String joinToCommaSeparatedValues(List<String> genders) {
    return Joiner.on(",").skipNulls().join(genders);
  }

  private List<String> getValidatedGenders(
      DemographicsDTO demographicsDTO) {
    return (demographicsDTO.getGenders() != null) ? getValidatedGendersForNonEmptyCollection(demographicsDTO) : Lists.newArrayList();
  }

  private List<String> getValidatedGendersForNonEmptyCollection(DemographicsDTO demographicsDTO) {
    return demographicsDTO.getGenders().stream()
        .map(genderName -> Gender.valueOf(genderName).name())
        .collect(Collectors.toList());
  }

  private List<String> getGenderNames(
      Agency agency) {
    return isEmpty(agency.getGenders()) ? Lists.newArrayList()
        : splitGenderToList(agency.getGenders());
  }

  private List<String> splitGenderToList(String gender) {
    return Splitter.on(",").trimResults()
        .splitToList(gender);
  }

  private Integer nullSafeToInteger(Short ageTo) {
    return ageTo != null ? Integer.valueOf(ageTo) : null;
  }
}
