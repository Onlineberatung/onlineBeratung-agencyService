package de.caritas.cob.agencyservice.config;

import org.keycloak.adapters.KeycloakConfigResolver;
import org.keycloak.adapters.springboot.KeycloakSpringBootConfigResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class KeycloakConfiguration {
  @Bean
  public KeycloakConfigResolver keyCloakConfigResolver() {
    return new KeycloakSpringBootConfigResolver();
  }
}
