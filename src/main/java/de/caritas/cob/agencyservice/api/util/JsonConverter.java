package de.caritas.cob.agencyservice.api.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.json.JsonReadFeature;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.RuntimeJsonMappingException;
import de.caritas.cob.agencyservice.api.model.DataProtectionContactDTO;

public class JsonConverter {

  private JsonConverter() {
    // Utility class
  }

  public static String convertToJson(Object object) {
    if (object == null) {
      return null;
    }
    return serializeToJsonString(object);
  }

  public static DataProtectionContactDTO convertFromJsonNullSafe(String jsonString) {
    if (jsonString == null) {
      return new DataProtectionContactDTO();
    }
    return deserializeFromJsonString(jsonString, DataProtectionContactDTO.class);
  }

  public static DataProtectionContactDTO convertFromJson(String jsonString) {
    return deserializeFromJsonString(jsonString, DataProtectionContactDTO.class);
  }

  private static <T> T deserializeFromJsonString(String jsonString, Class<T> clazz) {
    try {
      var objectMapper =
          new ObjectMapper()
              .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
              .configure(JsonReadFeature.ALLOW_UNESCAPED_CONTROL_CHARS.mappedFeature(), true);
      return objectMapper.readValue(jsonString, clazz);
    } catch (JsonProcessingException e) {
      throw new RuntimeJsonMappingException(e.getMessage());
    }
  }

  private static <T> String serializeToJsonString(T object) {
    try {
      return new ObjectMapper().writeValueAsString(object);
    } catch (JsonProcessingException e) {
      throw new RuntimeJsonMappingException(e.getMessage());
    }
  }
}
