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
  void findByPostCodeAndConsultingTypeId_Should_FindAgenciesByPostcodeAndConsultingType() {
    // given, when
    var agencies = agencyTenantAwareRepository.findByPostCodeAndConsultingTypeId("45501", 5, 20, 1L);
    // then
    assertThat(agencies).hasSize(1);
  }

  @Test
  void findByPostCodeAndConsultingTypeId_Should_NotFindAnyAgencyByPostcodeAndConsultingType_When_TenantIdDoesNotMatch() {
    // given, when
    var agencies = agencyTenantAwareRepository.findByPostCodeAndConsultingTypeId("45501", 5, 20, 2L);
    // then
    assertThat(agencies).isEmpty();
  }

  @Test
  void findByPostCodeAndConsultingTypeId_Should_FindAgenciesByPostcodeAndConsultingTypeAndTopicId() {
    // given, when
    var agencies = agencyTenantAwareRepository.findByPostCodeAndConsultingTypeIdAndTopicId("45501", 5, 20, 1, 1L);
    // then
    assertThat(agencies).hasSize(1);
    assertThat(agencies.get(0).getId()).isEqualTo(1735);
    assertThat(agencies.get(0).getAgencyTopics()).extracting("topicId").contains(0L, 1L);
  }

  @Test
  void findByPostCodeAndConsultingTypeId_Should_NotFindAnyAgencyByPostcodeAndConsultingTypeAndTopicId_When_TopicIdDoesNotMatch() {
    // given, when
    var agencies = agencyTenantAwareRepository.findByPostCodeAndConsultingTypeIdAndTopicId("45501", 5, 20, 10, 1L);
    // then
    assertThat(agencies).isEmpty();
  }

  @Test
  void findByPostCodeAndConsultingTypeId_Should_NotFindAnyAgencyByPostcodeAndConsultingTypeAndTopicId_When_TenantIdDoesNotMatch() {
    // given, when
    var agencies = agencyTenantAwareRepository.findByPostCodeAndConsultingTypeIdAndTopicId("45501", 5, 20, 1, 0L);
    // then
    assertThat(agencies).isEmpty();
  }
}
