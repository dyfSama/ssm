package com.dyf.common.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @className: ToolsController
 * @description: TODO
 * @auther: duyafei
 * @date: 2018/10/18 12:35
 */
@Slf4j
@Controller
@RequestMapping("tools")
public class ToolsController {

    @RequestMapping("template")
    public String template() {
        return "tools/template";
    }
    @RequestMapping("formValidate")
    public String formValidate() {
        return "tools/formValidate";
    }
}
