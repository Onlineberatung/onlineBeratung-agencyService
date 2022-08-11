package de.caritas.cob.agencyservice.api.repository.agency;

import java.util.Arrays;
import java.util.Optional;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum FederalState {

  BADEN_WUERTTEMBERG("BW"),
  BAYERN("BY"),
  BERLIN("BE"),
  BRANDENBURG("BB"),
  BREMEN("HB"),
  HAMBURG("HH"),
  HESSEN("HE"),
  MECKLENBURG_VORPOMMERN("MV"),
  NIEDERSACHSEN("NI"),
  NORDRHEIN_WESTFALEN("NW"),
  RHEINLAND_PFALZ("RP"),
  SAARLAND("SL"),
  SACHSEN("SN"),
  SACHSEN_ANHALT("ST"),
  SCHLESWIG_HOLSTEIN("SH"),
  THUERINGEN("TH");

  private String shortcut;

  public static Optional<FederalState> findByShortcut(String shortcut) {
    return Arrays.stream(FederalState.values()).filter(f -> f.getShortcut().equals(shortcut))
        .findFirst();
  }
}
