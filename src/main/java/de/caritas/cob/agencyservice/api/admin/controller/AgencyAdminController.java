package de.caritas.cob.agencyservice.api.admin.controller;

import de.caritas.cob.agencyservice.api.admin.service.AgencyAdminSearchResultBuilder;
import de.caritas.cob.agencyservice.api.model.AgencyAdminResponseDTO;
import de.caritas.cob.agencyservice.generated.api.controller.AdminApi;
import io.swagger.annotations.Api;
import java.util.List;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "agency-admin-controller")
@RequiredArgsConstructor
public class AgencyAdminController implements AdminApi {

  private final @NonNull AgencyAdminSearchResultBuilder agencyAdminSearchResultBuilder;

  @Override
  public ResponseEntity<List<AgencyAdminResponseDTO>> searchAgencies(@NotNull @Valid Integer page,
      @NotNull @Valid Integer perPage, @Valid String q) {

    List<AgencyAdminResponseDTO> agencyAdminResponseDTOS = this.agencyAdminSearchResultBuilder
        .buildAgencyAdminSearchResult(q, page, perPage);

    return new ResponseEntity<>(agencyAdminResponseDTOS, HttpStatus.OK);
  }
}
