package de.caritas.cob.agencyservice.api.manager.consultingtype;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import de.caritas.cob.agencyservice.api.service.LogService;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.PostConstruct;
import lombok.NonNull;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

@Service
public class ConsultingTypeManager {

  @Value("${consulting.types.settings.json.path}")
  private String consultingTypesSettingsJsonPath;

  private Map<Integer, ConsultingTypeSettings> consultingTypeSettingsMap;

  @PostConstruct
  private void init() throws IOException {

    LogService.logInfo("Start initializing consulting type settings...");

    ObjectMapper mapper = new ObjectMapper();
    TypeReference<ConsultingTypeSettings> typeReference = new TypeReference<>() {};

    consultingTypeSettingsMap = new HashMap<>();

    File dir = new ClassPathResource(getConsultingTypesSettingsJsonPath()).getFile();
    File[] directoryListing = dir.listFiles((FilenameFilter) new WildcardFileFilter("*.json"));
    if (directoryListing != null) {
      for (File settingsFile : directoryListing) {
        InputStream inputStream = new FileInputStream(settingsFile);
        ConsultingTypeSettings consultingTypeSettings = mapper
            .readValue(inputStream, typeReference);
        consultingTypeSettingsMap
            .put(consultingTypeSettings.getConsultingTypeId(), consultingTypeSettings);
      }
    }
    LogService.logInfo("Finished initializing consulting type settings...");

  }

  @NonNull
  public ConsultingTypeSettings getConsultantTypeSettings(int consultingTypeId)
      throws MissingConsultingTypeException {

    if (consultingTypeSettingsMap.containsKey(consultingTypeId)
        && consultingTypeSettingsMap.get(consultingTypeId) != null) {
      return consultingTypeSettingsMap.get(consultingTypeId);
    } else {
      throw new MissingConsultingTypeException(
          String.format("No settings for consulting type %s found.", consultingTypeId));
    }

  }

  public String getConsultingTypesSettingsJsonPath() {
    return consultingTypesSettingsJsonPath;
  }

}
