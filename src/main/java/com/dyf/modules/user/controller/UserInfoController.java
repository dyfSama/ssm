package com.dyf.modules.user.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.modules.user.entity.User;
import com.dyf.modules.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @className:   UserInfoController
 * @description: TODO
 * @auther: duyafei
 * @date:   2018/10/25 10:13
 */
@Slf4j
@Controller
@RequestMapping("userInfo")
public class UserInfoController extends BaseController {

    @Autowired
    private UserService userService;

    @RequestMapping("/info")
    public String info() {
        return "modules/info";
    }

    @RequestMapping("/password")
    public String password() {
        return "modules/password";
    }

    @RequestMapping("/toRegister")
    public String register() {
        log.info("============================注册用户");
        return "modules/reg";
    }


    @RequestMapping("/formAvatar")
    public String formAvatar() {
        log.info("============================注册用户");
        return "modules/formAvatar";
    }

    @RequestMapping("/forget")
    public String forget() {
        return "modules/forget";
    }

    @ResponseBody
    @RequestMapping("/updatePassword")
    public MsgInfo updatePassword(User user) {
        return getMsgInfo(1, MsgInfo.OPT_DEL); //1 已存在
    }


}
