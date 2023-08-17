package de.caritas.cob.agencyservice.api.admin.service.agency;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class AgencyAdminSearch {

  private String keyword;
  private int pageNumber;
  private int pageSize;
  private String sortField;
  private boolean ascending;


}
