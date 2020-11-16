package de.caritas.cob.agencyservice.api.admin.service;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.notNullValue;

import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.api.repository.agency.Agency;
import de.caritas.cob.agencyservice.api.repository.agency.AgencyPostCodeRange;
import de.caritas.cob.agencyservice.api.repository.agency.ConsultingType;
import java.time.LocalDateTime;
import java.util.Collections;
import org.junit.Test;

public class AgencyAdminResponseDTOBuilderTest {

  @Test
  public void fromAgency_Should_returnFullMappedResponseDTO_When_agencyHasAllPropertiesSet() {
    Agency agency = new Agency();
    agency.setAgencyPostCodeRanges(Collections.singletonList(new AgencyPostCodeRange(1L, "from",
        "to", agency)));
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

    AgencyAdminResponseDTO agencyResponseDTO = new AgencyAdminResponseDTOBuilder(agency).fromAgency();

    assertThat(agencyResponseDTO.getAgencyId(), is(3L));
    assertThat(agencyResponseDTO.getCity(), is("city"));
    assertThat(agencyResponseDTO.getConsultingType(), is(14));
    assertThat(agencyResponseDTO.getCreateDate(), notNullValue());
    assertThat(agencyResponseDTO.getUpdateDate(), notNullValue());
    assertThat(agencyResponseDTO.getDeleteDate(), notNullValue());
    assertThat(agencyResponseDTO.getDescription(), is("description"));
    assertThat(agencyResponseDTO.getDioceseId(), is(2L));
    assertThat(agencyResponseDTO.getName(), is("name"));
    assertThat(agencyResponseDTO.getOffline(), is(true));
    assertThat(agencyResponseDTO.getTeamAgency(), is(true));
    assertThat(agencyResponseDTO.getPostcode(), is("postcode"));
    assertThat(agencyResponseDTO.getPostCodeRanges().get(0).getPostcodeFrom(), is("from"));
    assertThat(agencyResponseDTO.getPostCodeRanges().get(0).getPostcodeTo(), is("to"));
  }

}
