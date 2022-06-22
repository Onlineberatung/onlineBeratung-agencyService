package de.caritas.cob.agencyservice.api.repository.agency;

import static org.assertj.core.api.Assertions.assertThat;

import de.caritas.cob.agencyservice.api.repository.agencytopic.AgencyTopic;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@TestPropertySource(properties = {"spring.profiles.active=testing"})
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.ANY)
@ExtendWith(SpringExtension.class)
@DataJpaTest
class AgencyRepositoryIT {

  @Autowired private AgencyRepository agencyRepository;

  @Test
  void findById_Should_loadAgencyWithTopics() {
    // given, when
    var optionalAgency = agencyRepository.findById(0L);
    var agency = optionalAgency.orElseThrow(RuntimeException::new);
    // then
    assertThat(agency.getId()).isZero();
    assertThat(agency.getAgencyTopics())
        .hasSize(2)
        .extracting(AgencyTopic::getId)
        .containsExactly(0L, 1L);
  }

  @Test
  void findByPostCodeAndConsultingTypeId_Should_findAgencyByPostcodeAndConsultingType() {
    // given, when
    var agencyList = agencyRepository.findByPostCodeAndConsultingTypeId("53113", 5, 0, 1L);
    // then
    assertThat(agencyList).hasSize(2);
  }


  @Test
  void findByPostCodeAndConsultingTypeId_Should_findAgencyByPostcodeAndConsultingTypeAndTopicId() {
    // given, when
    var agencyList = agencyRepository.findByPostCodeAndConsultingTypeIdAndTopicId("53113", 5, 0, 1, 1L);
    // then
    assertThat(agencyList).hasSize(1);
    assertThat(agencyList.get(0).getId()).isZero();
    assertThat(agencyList.get(0).getAgencyTopics()).extracting("topicId").containsExactly(0L, 1L);
  }

  @Test
  void save_Should_cascadeTopics_When_newTopicIsAdded() {
    // given
    var optionalAgency = agencyRepository.findById(0L);
    var agency = optionalAgency.orElseThrow(RuntimeException::new);
    // when
    AgencyTopic newAssignedTopic = AgencyTopic.builder().agency(agency).topicId(1L).build();
    agency.getAgencyTopics().add(newAssignedTopic);
    agencyRepository.save(agency);
    // then
    var agencyUpdated = agencyRepository.findById(0L).orElseThrow(RuntimeException::new);
    assertThat(agencyUpdated.getAgencyTopics())
        .hasSize(3)
        .extracting(AgencyTopic::getId)
        .containsExactly(0L, 1L, 100000L);
  }

  @Test
  void save_Should_cascadeTopics_When_existingTopicIsRemoved() {
    // given
    var optionalAgency = agencyRepository.findById(0L);
    var agency = optionalAgency.orElseThrow(RuntimeException::new);
    // when
    agency.getAgencyTopics().remove(0);
    agencyRepository.save(agency);
    // then
    var optionalAgencyUpdated = agencyRepository.findById(0L);
    assertThat(optionalAgencyUpdated).isPresent();
    var agencyUpdated = optionalAgencyUpdated.get();
    assertThat(agencyUpdated.getAgencyTopics())
        .hasSize(1)
        .extracting(AgencyTopic::getId)
        .containsExactly(1L);
  }

  @Test
  void save_Should_cascadeTopics_When_allTopicsAreRemoved() {
    // given
    var optionalAgency = agencyRepository.findById(0L);
    var agency = optionalAgency.orElseThrow(RuntimeException::new);
    // when
    agency.getAgencyTopics().clear();
    agencyRepository.save(agency);
    // then
    var optionalAgencyUpdated = agencyRepository.findById(0L);
    assertThat(optionalAgencyUpdated).isPresent();
    var agencyUpdated = optionalAgencyUpdated.get();
    assertThat(agencyUpdated.getAgencyTopics()).isEmpty();
  }
}
