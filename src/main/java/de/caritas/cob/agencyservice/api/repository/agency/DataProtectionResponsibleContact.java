package de.caritas.cob.agencyservice.api.repository.agency;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class DataProtectionResponsibleContact {

  private String nameAndLegalForm;

  private String postCode;

  private String city;

  private String phoneNumber;

  private String email;

}
