package de.caritas.cob.agencyservice.api.admin.service.agency;

import de.caritas.cob.agencyservice.api.admin.hallink.AgencyLinksBuilder;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyLinks;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

/**
 * Builder to build an {@link AgencyAdminFullResponseDTO()} from an {@link Agency} instance.
 */
@RequiredArgsConstructor
public class AgencyAdminFullResponseDTOBuilder {

  private final @NonNull Agency agency;

  /**
   * Creates an {@link AgencyAdminFullResponseDTO()} with HAL-Links from an {@link Agency}
   * instance.
   *
   * @return an {@link AgencyAdminFullResponseDTO()} instance
   */
  public AgencyAdminFullResponseDTO fromAgency() {
    return new AgencyAdminFullResponseDTO()
        .embedded(createAgency())
        .links(createAgencyLinks());
  }

  private AgencyAdminResponseDTO createAgency() {
    return new AgencyAdminResponseDTO()
        .id(this.agency.getId())
        .dioceseId(this.agency.getDioceseId())
        .name(this.agency.getName())
        .city(this.agency.getCity())
        .consultingType(this.agency.getConsultingTypeId())
        .description(this.agency.getDescription())
        .postcode(this.agency.getPostCode())
        .teamAgency(this.agency.isTeamAgency())
        .url(this.agency.getUrl())
        .external((this.agency.isExternal()))
        .offline(this.agency.isOffline())
        .createDate(String.valueOf(this.agency.getCreateDate()))
        .updateDate(String.valueOf(this.agency.getUpdateDate()))
        .deleteDate(String.valueOf(this.agency.getDeleteDate()));
  }

  private AgencyLinks createAgencyLinks() {

    return AgencyLinksBuilder.getInstance(agency).buildAgencyLinks();

  }

}
