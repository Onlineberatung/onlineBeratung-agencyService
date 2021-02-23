package de.caritas.cob.agencyservice.config;

import de.caritas.cob.agencyservice.api.admin.service.agency.AgencyReindexer;
import javax.persistence.EntityManagerFactory;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.Search;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

/**
 * Contains some general spring boot application configurations
 */
@Configuration
@EnableCaching
@ComponentScan(basePackages = {"de.caritas.cob.agencyservice"})
public class AppConfig {

  /**
   * Activate the messages.properties for validation messages
   */
  @Bean
  public LocalValidatorFactoryBean validator(MessageSource messageSource) {
    LocalValidatorFactoryBean validatorFactoryBean = new LocalValidatorFactoryBean();
    validatorFactoryBean.setValidationMessageSource(messageSource);
    return validatorFactoryBean;
  }

  /**
   * Builds an indexer for hibernate search.
   *
   * @param entityManagerFactory the manager factory bean
   * @return an {@link AgencyReindexer} used to reindex entities
   */
  @Bean
  public AgencyReindexer agencyReindexer(EntityManagerFactory entityManagerFactory) {
    FullTextEntityManager manager =
        Search.getFullTextEntityManager(entityManagerFactory.createEntityManager());
    return new AgencyReindexer(manager);
  }

}
