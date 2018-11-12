package com.dyf.system.swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author: qinzx
 * @date: 2018/5/30 14:03
 * @modify by:
 */
//@Component
//@Configuration
//@EnableSwagger2
//@EnableWebMvc
public class Swagger2Config {
    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.any())
                .build()
                .apiInfo(apiInfo());
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("dyfSama-SSM-接口文档")
                .description("啦啦啦啦")
                .termsOfServiceUrl("http://localhost:8080")
                .contact(new Contact("dyfSama", "https://github.com/dyfSama", "du_yafei@163.com"))
                .license("")
                .licenseUrl("")
                .version("1.0.0")
                .build();

    }
}