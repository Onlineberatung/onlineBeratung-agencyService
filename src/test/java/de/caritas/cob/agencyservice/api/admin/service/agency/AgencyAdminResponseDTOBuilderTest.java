package de.caritas.cob.agencyservice.api.admin.service.agency;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.api.model.AgencyAdminFullResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import de.caritas.cob.agencyservice.api.repository.agencypostcoderange.AgencyPostCodeRange;
import java.time.LocalDateTime;
import java.util.Collections;
import org.junit.Test;

public class AgencyAdminResponseDTOBuilderTest {

  @Test
  public void fromAgency_Should_returnFullMappedResponseDTO_When_agencyHasAllPropertiesSet() {
    Agency agency = new Agency();
    agency.setAgencyPostCodeRanges(Collections.singletonList(new AgencyPostCodeRange(1L, "from",
        "to", agency, null, null)));
    agency.setCity("city");
    agency.setPostCode("postcode");
    agency.setConsultingType(ConsultingType.CHILDREN);
    agency.setCreateDate(LocalDateTime.now());
    agency.setDeleteDate(LocalDateTime.MAX);
    agency.setUpdateDate(LocalDateTime.now());
    agency.setDescription("description");
    agency.setDioceseId(2L);
    agency.setId(3L);
    agency.setName("name");
    agency.setOffline(true);
    agency.setTeamAgency(true);

    AgencyAdminFullResponseDTO agencyResponseDTO = new AgencyAdminFullResponseDTOBuilder(agency)
        .fromAgency();

    assertThat(agencyResponseDTO.getEmbedded().getId(), is(3L));
    assertThat(agencyResponseDTO.getEmbedded().getCity(), is("city"));
    assertThat(agencyResponseDTO.getEmbedded().getConsultingType(), is(14));
    assertThat(agencyResponseDTO.getEmbedded().getCreateDate(), notNullValue());
    assertThat(agencyResponseDTO.getEmbedded().getUpdateDate(), notNullValue());
    assertThat(agencyResponseDTO.getEmbedded().getDeleteDate(), notNullValue());
    assertThat(agencyResponseDTO.getEmbedded().getDescription(), is("description"));
    assertThat(agencyResponseDTO.getEmbedded().getDioceseId(), is(2L));
    assertThat(agencyResponseDTO.getEmbedded().getName(), is("name"));
    assertThat(agencyResponseDTO.getEmbedded().getOffline(), is(true));
    assertThat(agencyResponseDTO.getEmbedded().getTeamAgency(), is(true));
    assertThat(agencyResponseDTO.getEmbedded().getPostcode(), is("postcode"));
  }

}
