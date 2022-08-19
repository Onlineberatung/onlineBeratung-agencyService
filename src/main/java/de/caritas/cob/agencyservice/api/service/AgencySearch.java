package de.caritas.cob.agencyservice.api.service;

import java.util.Optional;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class AgencySearch {

  private String postCode;
  private int consultingTypeId;
  private Optional<Integer> optionalTopicId;
  private Optional<Integer> age;
  private Optional<String> gender;
}
