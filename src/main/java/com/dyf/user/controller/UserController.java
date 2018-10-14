package com.dyf.user.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.common.page.TableDataInfo;
import com.dyf.user.pojo.User;
import com.dyf.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @RequestMapping("/findList2")
    public String list2() {
        return "user/user/userList2";
    }
    @RequestMapping("/findList")
    public String list() {
        return "user/user/userList";
    }

    @RequestMapping("/form")
    public String form() {
        return "user/user/userForm";
    }

    @RequestMapping("/info")
    public String info() {
        return "set/user/info";
    }

    @RequestMapping("/password")
    public String password() {
        return "set/user/password";
    }

    @RequestMapping("/register")
    public String register() {
        return "user/reg";
    }

    @RequestMapping("/forget")
    public String forget() {
        return "user/forget";
    }

    @ResponseBody
    @RequestMapping("/getList")
    public TableDataInfo getList(HttpServletRequest request, User user) {
        startPage(request);
        List<User> userList = userService.findList(user);
        return getTableInfo(userList);
    }

    @ResponseBody
    @RequestMapping("/save")
    public MsgInfo save(User user) {
        int rows = userService.save(user);
        return getMsgInfo(rows, MsgInfo.OPT_SAVE);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public MsgInfo delete(User user) {
        String id = user.getId();
        int rows = userService.delete(id);
        return getMsgInfo(rows, MsgInfo.OPT_DEL);
    }

    @ResponseBody
    @RequestMapping("/batchDelete")
    public MsgInfo batchDelete(User user) {
        int rows = userService.batchDelete(user.getId());
        return getMsgInfo(rows, MsgInfo.OPT_DEL);
    }


    @ResponseBody
    @RequestMapping("/checkLoginName")
    public String checkLoginName(User user) {
        User u = userService.getByName(user.getLoginName());
        return u != null ? "1" : "0"; //1 已存在
    }

    @ResponseBody
    @RequestMapping("/test")
    public MsgInfo test(User user) {

        return getMsgInfo(1, MsgInfo.OPT_DEL); //1 已存在
    }
}
