package de.caritas.cob.agencyservice.config;

import static org.assertj.core.api.Assertions.assertThat;
import com.google.common.collect.Maps;
import de.caritas.cob.agencyservice.api.repository.agency.FederalState;
import java.util.Map;
import java.util.Set;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;


@ExtendWith(MockitoExtension.class)
class AuthenticatedUserConfigTest {

  AuthenticatedUserConfig authenticatedUserConfig = new AuthenticatedUserConfig();

  @Test
  void getFederalStatesAttribute_Should_ProperlyParseStatesForMultipleStates() {
    // given
    Map<String, Object> claimMap = Maps.newHashMap();
    claimMap.put("states", FederalState.SACHSEN.getShortcut() + "," + FederalState.NIEDERSACHSEN.getShortcut());

    // when
    Set<FederalState> federalStatesAttribute = authenticatedUserConfig.getFederalStatesAttribute(
        claimMap);

    // then
    assertThat(federalStatesAttribute).containsOnly(FederalState.SACHSEN, FederalState.NIEDERSACHSEN);
  }

  @Test
  void getFederalStatesAttribute_Should_ProperlyParseStatesForJustASingleState() {
    // given
    Map<String, Object> claimMap = Maps.newHashMap();
    claimMap.put("states", FederalState.SACHSEN.getShortcut());

    // when
    Set<FederalState> federalStatesAttribute = authenticatedUserConfig.getFederalStatesAttribute(
        claimMap);

    // then
    assertThat(federalStatesAttribute).containsOnly(FederalState.SACHSEN);
  }

  @Test
  void getFederalStatesAttribute_Should_NotRecognizeStateIfNoShortcutIsSet() {
    // given
    Map<String, Object> claimMap = Maps.newHashMap();
    claimMap.put("states", FederalState.SACHSEN);

    // when
    Set<FederalState> federalStatesAttribute = authenticatedUserConfig.getFederalStatesAttribute(
        claimMap);

    // then
    assertThat(federalStatesAttribute).isEmpty();
  }

  @Test
  void getFederalStatesAttribute_Should_ReturnEmptySetIfClaimDoesNotExist() {
    // given
    Map<String, Object> claimMap = Maps.newHashMap();

    // when
    Set<FederalState> federalStatesAttribute = authenticatedUserConfig.getFederalStatesAttribute(
        claimMap);

    // then
    assertThat(federalStatesAttribute).isEmpty();
  }

  @Test
  void getFederalStatesAttribute_Should_ReturnEmptySetIfClaimContainsEmptyString() {
    // given
    Map<String, Object> claimMap = Maps.newHashMap();
    claimMap.put("states", " ");
    // when
    Set<FederalState> federalStatesAttribute = authenticatedUserConfig.getFederalStatesAttribute(
        claimMap);

    // then
    assertThat(federalStatesAttribute).isEmpty();
  }



}