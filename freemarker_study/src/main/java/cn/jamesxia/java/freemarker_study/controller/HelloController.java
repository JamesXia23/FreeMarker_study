package cn.jamesxia.java.freemarker_study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
public class HelloController {

    //hello world
    @RequestMapping(path = {"/helloboot","/hello","/"})//指定多个路径
//    @ResponseBody
    public String hello(Model model){
//        map.put("name", "JamesXia");
        model.addAttribute("name", "JamesXia");
        return "hello";
    }

    //if-else
    @RequestMapping("/condition")
    public String condition(Model model){
        model.addAttribute("x", 4);
        model.addAttribute("name","jamesxia");
        return "condition";
    }

    @RequestMapping(path = {"assign", "/assign/{username}"}, method = RequestMethod.GET)
    public String assign(@PathVariable(value = "username", required = false) String username,
                         @RequestParam(value = "sex", defaultValue = "1") int sex,
                         @RequestParam(value = "age") int age,
                         Model model){
        if (username == null){
            username = "default user";
        }
        model.addAttribute("username", username);
        model.addAttribute("sex", sex == 1 ? "男" : "女");
        model.addAttribute("age", age);
        return "assign";
    }

    @RequestMapping("/list")
    public String list(Model model){
        List<String> names = Arrays.asList(new String[]{"张三", "李四", "王五"});

        model.addAttribute("names", names);

        return "list";
    }

    @RequestMapping("/compress")
    public String compress(Model model){
        return "compress";
    }

    @RequestMapping("/function")
    public String function(Model model){
        model.addAttribute("x", 100);
        model.addAttribute("y",1222);
        return "function";
    }

    @RequestMapping("/local")
    public String local(Model model){
        return "local";
    }

    @RequestMapping("/macro")
    public String macro(Model model){
        model.addAttribute("names", Arrays.asList(new String[]{"zhangsan", "lisi", "wanwu"}));

        return "macro";
    }
}
