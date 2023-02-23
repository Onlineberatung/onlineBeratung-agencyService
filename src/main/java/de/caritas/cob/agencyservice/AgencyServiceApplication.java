package de.caritas.cob.agencyservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class AgencyServiceApplication {

  public static void main(String[] args) {
    SpringApplication.run(AgencyServiceApplication.class, args);
  }

}
