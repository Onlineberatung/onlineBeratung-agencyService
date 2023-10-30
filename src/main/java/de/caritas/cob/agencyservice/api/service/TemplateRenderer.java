package de.caritas.cob.agencyservice.api.service;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TemplateRenderer {

  private final @NonNull freemarker.template.Configuration freemarkerConfiguration;

  public String renderTemplate(String templateContent, Map<String, Object> dataModel)
      throws IOException, TemplateException {

    StringTemplateLoader templateLoader =
        (StringTemplateLoader) freemarkerConfiguration.getTemplateLoader();
    templateLoader.putTemplate("in-memory-template", templateContent);
    Template template = freemarkerConfiguration.getTemplate("in-memory-template");
    StringWriter stringWriter = new StringWriter();
    template.process(dataModel, stringWriter);
    return stringWriter.toString();
    // Process the template into a string
  }
}
