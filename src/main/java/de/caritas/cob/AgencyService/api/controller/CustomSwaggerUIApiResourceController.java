package de.caritas.cob.AgencyService.api.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import springfox.documentation.annotations.ApiIgnore;
import springfox.documentation.swagger.web.ApiResourceController;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

@Controller
@ApiIgnore
@RequestMapping(value = "${springfox.docuPath}" + "/swagger-resources")
public class CustomSwaggerUIApiResourceController extends ApiResourceController {

  public CustomSwaggerUIApiResourceController(SwaggerResourcesProvider swaggerResources) {
    super(swaggerResources);
  }

}
