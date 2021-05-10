package de.caritas.cob.agencyservice.api.manager.consultingtype;

import de.caritas.cob.agencyservice.api.service.ConsultingTypeService;
import de.caritas.cob.agencyservice.consultingtypeservice.generated.web.model.ExtendedConsultingTypeResponseDTO;
import de.caritas.cob.agencyservice.api.exception.MissingConsultingTypeException;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;

@Service
@Getter
@RequiredArgsConstructor
public class ConsultingTypeManager {

  private final @NonNull ConsultingTypeService consultingTypeService;

  /**
   * Returns the {@link ExtendedConsultingTypeResponseDTO} for the provided consulting ID.
   *
   * @param consultingTypeId The consulting ID for which the seetings are searched
   * @return {@link ExtendedConsultingTypeResponseDTO} for the provided consulting ID
   * @throws MissingConsultingTypeException when no settings for provided consulting type where
   *                                        found
   */
  public ExtendedConsultingTypeResponseDTO getConsultingTypeSettings(int consultingTypeId) throws MissingConsultingTypeException{
    try {
      return consultingTypeService.getExtendedConsultingTypeResponseDTO(consultingTypeId);
    }
    catch(RestClientException ex) {
      throw new MissingConsultingTypeException(
          String.format("No settings for consulting type %s found.", consultingTypeId));
    }
  }

  public ExtendedConsultingTypeResponseDTO getConsultingTypeSettings(String consultingTypeId)
      throws MissingConsultingTypeException {
    return getConsultingTypeSettings(Integer.parseInt(consultingTypeId));
  }

  public boolean isConsultantBoundedToAgency(int consultingTypeId)
      throws MissingConsultingTypeException {
    try {
      return consultingTypeService.getExtendedConsultingTypeResponseDTO(consultingTypeId).getConsultantBoundedToConsultingType();
    }
    catch(RestClientException ex) {
      throw new MissingConsultingTypeException(
          String.format("No settings for consulting type %s found.", consultingTypeId));
    }
  }

}
