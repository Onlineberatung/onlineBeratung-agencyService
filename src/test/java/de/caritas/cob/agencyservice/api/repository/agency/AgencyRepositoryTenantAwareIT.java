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

  @Autowired
  private AgencyTenantAwareRepository agencyTenantAwareRepository;

  @Test
  void searchWithoutTopic_Should_FindAgenciesByPostcodeAndConsultingType() {
    // given, when
    var agencies = agencyTenantAwareRepository.searchWithoutTopic("45501", 5, 20,
        null, null, null, 1L);
    // then
    assertThat(agencies).hasSize(1);
  }

  @Test
  void searchWithoutTopic_Should_FindAgenciesByPostcodeAndConsultingTypeAndCounsellingRelation() {
    // given, when
    var agencies = agencyTenantAwareRepository.searchWithoutTopic("45501", 5, 20,
        null, null, "RELATIVE_COUNSELLING", 1L);
    // then
    assertThat(agencies).hasSize(1);
    assertThat(agencies.get(0).getId()).isEqualTo(1735);
  }

  @Test
  void searchWithoutTopic_Should_NotFindAgenciesByPostcodeAndConsultingTypeAndCounsellingRelation_When_CounsellingRelationDoesNotMatch() {
    // given, when
    var agencies = agencyTenantAwareRepository.searchWithoutTopic("45501", 5, 20,
        null, null, "SELF_COUNSELLING", 1L);
    // then
    assertThat(agencies).isEmpty();
  }

  @Test
  void searchWithoutTopic_Should_NotFindAnyAgencyByPostcodeAndConsultingType_When_TenantIdDoesNotMatch() {
    // given, when
    var agencies = agencyTenantAwareRepository.searchWithoutTopic("45501", 5, 20,
        null, null, null, 2L);
    // then
    assertThat(agencies).isEmpty();
  }

  @Test
  void searchWithTopic_Should_FindAgenciesByPostcodeAndConsultingTypeAndTopicId() {
    // given, when
    var agencies = agencyTenantAwareRepository.searchWithTopic("45501",
        5, 20, 1, null, null, null, 1L);
    // then
    assertThat(agencies).hasSize(1);
    assertThat(agencies.get(0).getId()).isEqualTo(1735);
    assertThat(agencies.get(0).getAgencyTopics()).extracting("topicId").contains(0L, 1L);
  }

  @Test
  void searchWithTopic_Should_FindAgenciesByPostcodeAndConsultingTypeAndTopicIdAndCounsellingRelation() {
    // given, when
    var agencies = agencyTenantAwareRepository.searchWithTopic("45501",
        5, 20, 1, null, null, "RELATIVE_COUNSELLING", 1L);
    // then
    assertThat(agencies).hasSize(1);
    assertThat(agencies.get(0).getId()).isEqualTo(1735);
    assertThat(agencies.get(0).getAgencyTopics()).extracting("topicId").contains(0L, 1L);
  }

  @Test
  void searchWithTopic_Should_NotFindAgenciesByPostcodeAndConsultingTypeAndTopicIdAndNonMatchingCounsellingRelation() {
    // given, when
    var agencies = agencyTenantAwareRepository.searchWithTopic("45501",
        5, 20, 1, null, null, "SELF_COUNSELLING", 1L);
    // then
    assertThat(agencies).isEmpty();
  }


  @Test
  void searchWithTopic_Should_NotFindAnyAgencyByPostcodeAndConsultingTypeAndTopicId_When_TopicIdDoesNotMatch() {
    // given, when
    var agencies = agencyTenantAwareRepository.searchWithTopic("45501",
        5, 20, 10, null, null, null, 1L);
    // then
    assertThat(agencies).isEmpty();
  }

  @Test
  void searchWithTopic_Should_NotFindAnyAgencyByPostcodeAndConsultingTypeAndTopicId_When_TenantIdDoesNotMatch() {
    // given, when
    var agencies = agencyTenantAwareRepository.searchWithTopic("45501",
        5, 20, 1, null, null, null, 0L);
    // then
    assertThat(agencies).isEmpty();
  }


  @Test
  void searchWithoutTopic_Should_findAgenciesByPostcodeAndConsultingTypeAndAgeAndGender_WhenGenderIsMaleAndTenantIdEqualToTwo() {
    // given, when
    var agencyList = agencyTenantAwareRepository.searchWithoutTopic("99999", 5, 19, 30, "MALE", null, 2L);
    // then
    assertThat(agencyList).hasSize(1);
    assertThat(agencyList).extracting(a -> a.getId()).containsExactly(1738L);
  }

  @Test
  void searchWithoutTopic_Should_findOnlyOneAgencyByPostcodeAndConsultingTypeAndAgeAndGender_WhenGenderIsDiversAndTenantIdEqualToOne() {
    // given, when
    var agencyList = agencyTenantAwareRepository.searchWithoutTopic("99999", 5, 19, 30, "DIVERS", null, 1L);
    // then
    assertThat(agencyList).hasSize(1);
    assertThat(agencyList).extracting(a -> a.getId()).containsExactly(1737L);
  }

  @Test
  void searchWithoutTopic_Should_notFindAnyAgenciesByPostcodeAndConsultingTypeAndAgeAndGender_WhenGenderIsNotMatchingAnyAgency() {
    // given, when
    var agencyList = agencyTenantAwareRepository.searchWithoutTopic("99999", 5, 19, 30, "NOTMATCHING", null, 1L);
    // then
    assertThat(agencyList).isEmpty();
  }

  @Test
  void searchWithoutTopic_Should_findExactlyOneAgencyByPostcodeAndConsultingTypeAndAge_WhenAgeMatchesWithJustOneAgencyAndTenantEqualToOne() {
    // given, when
    var agencyList = agencyTenantAwareRepository.searchWithoutTopic("99999", 5, 19, 50, "DIVERS", null, 2L);
    // then
    assertThat(agencyList).hasSize(1);
    assertThat(agencyList).extracting(a -> a.getId()).containsExactly(1738L);
  }

  @Test
  void searchWithoutTopic_Should_notFindAnyAgencyByPostcodeAndConsultingTypeAndAge_WhenAgeDoesNotMatchWithAnyAgency() {
    // given, when
    var agencyList = agencyTenantAwareRepository.searchWithoutTopic("99999", 5, 19, 5, "MALE", null, 1L);
    // then
    assertThat(agencyList).isEmpty();
  }
}
