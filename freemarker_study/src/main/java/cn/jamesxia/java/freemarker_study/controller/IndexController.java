package cn.jamesxia.java.freemarker_study.controller;

import cn.jamesxia.java.freemarker_study.model.CompMethod;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

@Controller
@EnableAutoConfiguration
public class IndexController {
    //1. 获取Configuration对象
    Configuration cfg = new Configuration(Configuration.VERSION_2_3_22);

    public IndexController() {
        try {
            //2.1 设置模板目录
//            System.out.println(this.getClass().getResource("/templates").getPath());
            cfg.setDirectoryForTemplateLoading(new File(this.getClass().getResource("/templates").getPath()));

        } catch (IOException e) {
            e.printStackTrace();
        }

        //2.2 设置默认编码
        cfg.setDefaultEncoding("UTF-8");

        //2.3 设置错误处理方法
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);

    }

    @RequestMapping("/home")
    @ResponseBody
    public String home(){

        //3. 构建数据模型
        Map<String, Object> root = new HashMap<String, Object>();

        root.put("user", "Big Joe");

        Map<String, String> latestProduct = new HashMap<String, String>();
        latestProduct.put("url", "product/greenmouse.html");
        latestProduct.put("name", "greem mouse");

        root.put("latestProduct", latestProduct);

        //4. 创建模板文件，并获取模板
        Template template = null;
        try {
            template = cfg.getTemplate("home.ftl");
        } catch (IOException e) {
            e.printStackTrace();
        }

        //5. 创建输出流
        Writer out = new StringWriter();

        //6. 合并模板和数据模型到流中
        try {
            template.process(root, out);
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }



        return out.toString();
    }
    @RequestMapping("/comp")
    @ResponseBody
    public String comp(){
        Map<String, Object> root = new HashMap<String, Object>();

        root.put("comp", new CompMethod());

        Writer out = new StringWriter();
        Template template = null;
        try {
            template = cfg.getTemplate("comp.ftl");
            template.process(root, out);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }


        return out.toString();
    }
}
