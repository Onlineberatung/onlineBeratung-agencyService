package de.caritas.cob.agencyservice.api.repository;

import static de.caritas.cob.agencyservice.api.repository.agency.ConsultingType.KREUZBUND;
import static de.caritas.cob.agencyservice.api.repository.agency.ConsultingType.SUPPORTGROUPVECHTA;
import static de.caritas.cob.agencyservice.api.repository.agency.ConsultingType.U25;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ConsultingTypeTest {

  @Test
  public void isGroupChatAgency_Should_returnTrue_When_consultingTypeIsKreuzbund() {
    boolean isGroupChatAgency = KREUZBUND.isGroupChatAgency();

    assertTrue(isGroupChatAgency);
  }

  @Test
  public void isGroupChatAgency_Should_returnTrue_When_consultingTypeIsSupportGroupVechta() {
    boolean isGroupChatAgency = SUPPORTGROUPVECHTA.isGroupChatAgency();

    assertTrue(isGroupChatAgency);
  }

  @Test
  public void isGroupChatAgency_Should_returnFalse_When_consultingTypeIsU25() {
    boolean isGroupChatAgency = U25.isGroupChatAgency();;

    assertFalse(isGroupChatAgency);
  }

}
