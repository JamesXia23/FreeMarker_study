package cn.jamesxia.java.freemarker_study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class HelloController {

    @RequestMapping("/helloboot")
//    @ResponseBody
    public String hello(Model model){
//        map.put("name", "JamesXia");
        model.addAttribute("name", "JamesXia");
        return "hello";
    }
}
