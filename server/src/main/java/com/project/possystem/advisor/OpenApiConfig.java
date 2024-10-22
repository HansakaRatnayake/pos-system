package com.project.possystem.advisor;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.context.annotation.Configuration;

@Configuration
@OpenAPIDefinition(
        info = @Info(
                title = "Pos System",
                description = "Dev - Gunarathna"
        )
)
public class OpenApiConfig {
}
