package cn.jamesxia.java.freemarker_study;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;

@SpringBootApplication
public class GetStarted {

    public static void main(String[] args) throws IOException {
//        Configuration cfg = new Configuration(Configuration.VERSION_2_3_22);
//        cfg.setDirectoryForTemplateLoading(new File("templates"));
//
//        cfg.setDefaultEncoding("UTF-8");
//
//        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);
        SpringApplication.run(GetStarted.class, args);
    }


}
