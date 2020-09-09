package de.caritas.cob.agencyservice.api.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Agency model
 *
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ApiModel(value = "Agency")
public class AgencyResponseDTO {
  @ApiModelProperty(example = "684", position = 0)
  private Long id;

  @ApiModelProperty(example = "Suchtberatung Freiburg", position = 1)
  private String name;

  @ApiModelProperty(example = "79106", position = 2)
  private String postcode;

  @ApiModelProperty(example = "Bonn", position = 3)
  private String city;

  @ApiModelProperty(example = "Our agency provides help for the following topics: Lorem ipsum..",
      position = 4)
  private String description;

  @ApiModelProperty(example = "false", position = 5)
  private boolean teamAgency;

  @ApiModelProperty(example = "false", position = 6)
  private boolean offline;

  @ApiModelProperty(example = "0", position = 7)
  private int consultingType;
}