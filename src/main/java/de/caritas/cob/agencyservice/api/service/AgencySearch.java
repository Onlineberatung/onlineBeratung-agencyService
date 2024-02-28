package de.caritas.cob.agencyservice.api.service;

import java.util.Optional;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class AgencySearch {

  private Optional<String> postCode;
  private Optional<Integer> consultingTypeId;
  private Optional<Integer> topicId;
  private Optional<Integer> age;
  private Optional<String> gender;

  private Optional<String> counsellingRelation;
}
