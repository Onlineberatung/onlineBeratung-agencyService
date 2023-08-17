package de.caritas.cob.agencyservice.config;

import net.sf.ehcache.config.CacheConfiguration;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableCaching
public class CacheManagerConfig {

  public static final String CONSULTING_TYPE_CACHE = "consultingTypeCache";

  public static final String APPLICATION_SETTINGS_CACHE = "applicationSettingsCache";
  public static final String TENANT_CACHE = "tenantCache";
  public static final String TOPICS_CACHE = "topicsCache";

  @Value("${cache.consulting.type.configuration.maxEntriesLocalHeap}")
  private long consultingTypeMaxEntriesLocalHeap;

  @Value("${cache.consulting.type.configuration.eternal}")
  private boolean consultingTypeEternal;

  @Value("${cache.consulting.type.configuration.timeToIdleSeconds}")
  private long consultingTypeTimeToIdleSeconds;

  @Value("${cache.consulting.type.configuration.timeToLiveSeconds}")
  private long consultingTypeTimeToLiveSeconds;

  @Value("${cache.tenant.configuration.maxEntriesLocalHeap}")
  private long tenantMaxEntriesLocalHeap;

  @Value("${cache.tenant.configuration.eternal}")
  private boolean tenantEternal;

  @Value("${cache.tenant.configuration.timeToIdleSeconds}")
  private long tenantTimeToIdleSeconds;

  @Value("${cache.tenant.configuration.timeToLiveSeconds}")
  private long tenantTimeToLiveSeconds;

  @Value("${cache.topic.configuration.maxEntriesLocalHeap}")
  private long topicMaxEntriesLocalHeap;

  @Value("${cache.topic.configuration.eternal}")
  private boolean topicEternal;

  @Value("${cache.topic.configuration.timeToIdleSeconds}")
  private long topicTimeToIdleSeconds;

  @Value("${cache.topic.configuration.timeToLiveSeconds}")
  private long topicTimeToLiveSeconds;

  @Value("${cache.applicationsettings.configuration.maxEntriesLocalHeap}")
  private long applicationSettingsMaxEntriesLocalHeap;

  @Value("${cache.applicationsettings.configuration.eternal}")
  private boolean applicationSettingsEternal;

  @Value("${cache.applicationsettings.configuration.timeToIdleSeconds}")
  private long applicationSettingsTimeToIdleSeconds;

  @Value("${cache.applicationsettings.configuration.timeToLiveSeconds}")
  private long applicationSettingsTimeToLiveSeconds;

  @Bean(destroyMethod = "shutdown")
  public net.sf.ehcache.CacheManager ehCacheManager() {
    var config = new net.sf.ehcache.config.Configuration();
    config.addCache(buildConsultingTypeCacheConfiguration());
    config.addCache(buildTenantCacheConfiguration());
    config.addCache(buildTopicCacheConfiguration());
    config.addCache(buildApplicationSettingsCacheConfiguration());
    return net.sf.ehcache.CacheManager.newInstance(config);
  }

  private CacheConfiguration buildTopicCacheConfiguration() {
    var topicCacheConfiguration = new CacheConfiguration();
    topicCacheConfiguration.setName(TOPICS_CACHE);
    topicCacheConfiguration.setMaxEntriesLocalHeap(topicMaxEntriesLocalHeap);
    topicCacheConfiguration.setEternal(topicEternal);
    topicCacheConfiguration.setTimeToIdleSeconds(topicTimeToIdleSeconds);
    topicCacheConfiguration.setTimeToLiveSeconds(topicTimeToLiveSeconds);
    return topicCacheConfiguration;
  }

  private CacheConfiguration buildApplicationSettingsCacheConfiguration() {
    var topicCacheConfiguration = new CacheConfiguration();
    topicCacheConfiguration.setName(APPLICATION_SETTINGS_CACHE);
    topicCacheConfiguration.setMaxEntriesLocalHeap(topicMaxEntriesLocalHeap);
    topicCacheConfiguration.setEternal(topicEternal);
    topicCacheConfiguration.setTimeToIdleSeconds(topicTimeToIdleSeconds);
    topicCacheConfiguration.setTimeToLiveSeconds(topicTimeToLiveSeconds);
    return topicCacheConfiguration;
  }

  private CacheConfiguration buildConsultingTypeCacheConfiguration() {
    var consultingTypeCacheConfiguration = new CacheConfiguration();
    consultingTypeCacheConfiguration.setName(CONSULTING_TYPE_CACHE);
    consultingTypeCacheConfiguration.setMaxEntriesLocalHeap(consultingTypeMaxEntriesLocalHeap);
    consultingTypeCacheConfiguration.setEternal(consultingTypeEternal);
    consultingTypeCacheConfiguration.setTimeToIdleSeconds(consultingTypeTimeToIdleSeconds);
    consultingTypeCacheConfiguration.setTimeToLiveSeconds(consultingTypeTimeToLiveSeconds);
    return consultingTypeCacheConfiguration;
  }

  private CacheConfiguration buildTenantCacheConfiguration() {
    var tenantCacheConfiguration = new CacheConfiguration();
    tenantCacheConfiguration.setName(TENANT_CACHE);
    tenantCacheConfiguration.setMaxEntriesLocalHeap(tenantMaxEntriesLocalHeap);
    tenantCacheConfiguration.setEternal(tenantEternal);
    tenantCacheConfiguration.setTimeToIdleSeconds(tenantTimeToIdleSeconds);
    tenantCacheConfiguration.setTimeToLiveSeconds(tenantTimeToLiveSeconds);
    return tenantCacheConfiguration;
  }
}
