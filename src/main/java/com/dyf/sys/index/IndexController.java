package com.dyf.sys.index;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("/a")
@Controller
@Slf4j
public class IndexController {

    @RequestMapping("")
    public String redirect(HttpServletRequest request) {
        log.info("================================你妈嗨");
        return "user/login";
    }

    @RequestMapping("/welcome")
    public String welcome(HttpServletRequest request) {
        log.info("================================你妈嗨");
        return "home/console";
    }


    @RequestMapping("/index_v1")
    public String index_v1(HttpServletRequest request) {
        log.info("================================你妈嗨");
        return "home/index_v1";
    }


    @RequestMapping("/index_v2")
    public String index_v2(HttpServletRequest request) {
        log.info("================================你妈嗨");
        return "home/index_v2";
    }
}
