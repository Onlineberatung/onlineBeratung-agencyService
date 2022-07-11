package de.caritas.cob.agencyservice.api.repository.agency;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@TestPropertySource(properties = {"spring.profiles.active=testing"})
@TestPropertySource(properties = "multitenancy.enabled=true")
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.ANY)
@ExtendWith(SpringExtension.class)
@DataJpaTest
class AgencyRepositoryTenantAwareIT {

  @Autowired private AgencyTenantAwareRepository agencyTenantAwareRepository;

  @Test
  void findByPostCodeAndConsultingTypeId_Should_findAgencyByPostcodeAndConsultingType() {
    // given, when
    var agencyList = agencyTenantAwareRepository.findByPostCodeAndConsultingTypeId("45501", 5, 20, 1L);
    // then
    assertThat(agencyList).hasSize(1);
  }

  @Test
  void findByPostCodeAndConsultingTypeId_Should_NotFindAgencyByPostcodeAndConsultingTypeIfTenantIdDoesNotMatch() {
    // given, when
    var agencyList = agencyTenantAwareRepository.findByPostCodeAndConsultingTypeId("45501", 5, 20, 2L);
    // then
    assertThat(agencyList).isEmpty();
  }

  @Test
  void findByPostCodeAndConsultingTypeId_Should_findAgencyByPostcodeAndConsultingTypeAndTopicId() {
    // given, when
    var agencyList = agencyTenantAwareRepository.findByPostCodeAndConsultingTypeIdAndTopicId("45501", 5, 20, 1, 1L);
    // then
    assertThat(agencyList).hasSize(1);
    assertThat(agencyList.get(0).getId()).isEqualTo(1735);
    assertThat(agencyList.get(0).getAgencyTopics()).extracting("topicId").contains(0L, 1L);
  }

  @Test
  void findByPostCodeAndConsultingTypeId_Should_NotFindAgencyByPostcodeAndConsultingTypeAndTopicIdIfTopicIdDoesNotMatch() {
    // given, when
    var agencyList = agencyTenantAwareRepository.findByPostCodeAndConsultingTypeIdAndTopicId("45501", 5, 20, 10, 1L);
    // then
    assertThat(agencyList).isEmpty();
  }

  @Test
  void findByPostCodeAndConsultingTypeId_Should_NotFindAgencyByPostcodeAndConsultingTypeAndTopicIdIfTenantIdDoesNotMatch() {
    // given, when
    var agencyList = agencyTenantAwareRepository.findByPostCodeAndConsultingTypeIdAndTopicId("45501", 5, 20, 1, 0L);
    // then
    assertThat(agencyList).isEmpty();
  }
}
