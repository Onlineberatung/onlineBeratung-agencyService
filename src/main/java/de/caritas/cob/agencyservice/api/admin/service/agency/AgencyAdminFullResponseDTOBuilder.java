package de.caritas.cob.agencyservice.api.admin.service.agency;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import de.caritas.cob.agencyservice.api.admin.hallink.AgencyLinksBuilder;
import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.model.AgencyLinks;
import de.caritas.cob.agencyservice.api.model.DemographicsDTO;
import de.caritas.cob.agencyservice.api.model.TopicDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agencytopic.AgencyTopic;
import java.util.List;
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
    var responseDTO = new AgencyAdminResponseDTO()
        .id(this.agency.getId())
        .tenantId(agency.getTenantId())
        .name(this.agency.getName())
        .city(this.agency.getCity())
        .consultingType(this.agency.getConsultingTypeId())
        .description(this.agency.getDescription())
        .postcode(this.agency.getPostCode())
        .teamAgency(this.agency.isTeamAgency())
        .url(this.agency.getUrl())
        .external((this.agency.isExternal()))
        .offline(this.agency.isOffline())
        .topics(getTopics())
        .counsellingRelations(splitToList(agency.getCounsellingRelations()))
        .createDate(String.valueOf(this.agency.getCreateDate()))
        .updateDate(String.valueOf(this.agency.getUpdateDate()))
        .deleteDate(String.valueOf(this.agency.getDeleteDate()))
            .dataProtection(new DataProtectionDTOBuilder(this.agency).fromAgency());

    responseDTO.demographics(getDemographics(this.agency));
    return responseDTO;
  }

  private List<AgencyAdminResponseDTO.CounsellingRelationsEnum> splitToList(String counsellingRelationsAsCommaSeparatedString) {
    if (counsellingRelationsAsCommaSeparatedString == null) {
      return Lists.newArrayList();
    } else {
      return Splitter.on(",").trimResults()
          .splitToList(counsellingRelationsAsCommaSeparatedString).stream().map(AgencyAdminResponseDTO.CounsellingRelationsEnum::valueOf).toList();
    }
  }

  private DemographicsDTO getDemographics(Agency agency) {
    return agency.hasAnyDemographicsAttributes() ? new DemographicsConverter().convertToDTO(agency)
        : null;
  }

  private List<TopicDTO> getTopics() {
    // workaround to force loading of topics

    var agencyTopics = agency.getAgencyTopics();
    if (agencyTopics != null) {
      return getTopics(agencyTopics);
    } else {
      return Lists.newArrayList();
    }
  }

  private List<TopicDTO> getTopics(List<AgencyTopic> agencyTopics) {
    return agencyTopics.stream().map(AgencyTopic::getTopicData).toList();
  }

  private AgencyLinks createAgencyLinks() {
    return AgencyLinksBuilder.getInstance(agency).buildAgencyLinks();
  }
}
