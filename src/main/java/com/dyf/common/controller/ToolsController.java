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
@RequestMapping("/common/tools")
public class ToolsController {

    @RequestMapping("template")
    public String template() {
        return "tools/template";
    }
    @RequestMapping("formValidate")
    public String formValidate() {
        return "tools/formValidate";
    }
    @RequestMapping("bootstrap-star-rating")
    public String bootstrap_star_rating() {
        return "tools/bootstrap-star-rating";
    }

    @RequestMapping("bootstrap-step")
    public String bootstrap_step() {
        return "tools/bootstrap-step";
    }

    @RequestMapping("iconChoose")
    public String iconChoose() {
        return "tools/fontawesome";
    }
}
