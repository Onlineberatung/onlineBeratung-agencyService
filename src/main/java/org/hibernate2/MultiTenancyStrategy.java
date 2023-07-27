package org.hibernate2;

import java.util.Map;

public enum MultiTenancyStrategy {

  DATABASE,
  DISCRIMINATOR,
  NONE,
  SCHEMA;

  public static MultiTenancyStrategy determineMultiTenancyStrategy(Map strategy) {
    return NONE;
  }
}
