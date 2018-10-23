package com.dyf.modules.user.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.common.page.TableDataInfo;
import com.dyf.common.utils.IdGen;
import com.dyf.modules.user.pojo.User;
import com.dyf.modules.user.service.UserService;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @RequestMapping("/findList2")
    public String list2() {
        return "modules/user/userList2";
    }

    @RequestMapping("/findList")
    public String list() {
        return "modules/user/userList";
    }

    @RequestMapping("/empty")
    public String empty() {
        return "tools/template";
    }

    @RequestMapping("/form")
    public String form(User user, Model model) {
        if(StringUtils.isNotBlank(user.getId())){
            model.addAttribute("entity",userService.get(user.getId()));
        }
        return "modules/user/userForm2";
    }

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
    @RequestMapping("/getList")
    @Log(module = "用户管理",businessType = BusinessType.QUERY)
    public TableDataInfo getList(HttpServletRequest request, User user) {
        startPage(request);
        List<User> userList = userService.findList(user);
        return getTableInfo(userList);
    }

    @ResponseBody
    @RequestMapping("/save")
    @Log(module = "用户管理",businessType = BusinessType.INSERT)
    public MsgInfo save(User user) {
        int rows = userService.save(user);
        return getMsgInfo(rows, MsgInfo.OPT_SAVE);
    }

    @ResponseBody
    @RequestMapping("/delete")
    @Log(module = "用户管理",businessType = BusinessType.DELETE)
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
    public boolean checkLoginName(User user) {
        User u = userService.getByName(user.getUserName());
        return u != null ? false : true; // 已存在 true
    }

    @ResponseBody
    @RequestMapping("/uploadAvatar")
    public MsgInfo uploadAvatar(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
        String path = request.getSession().getServletContext().getRealPath("/upload/head/");
        log.info(" ================== " + path);
        String originalFilename = file.getOriginalFilename();
        //eg: 111.jpg ==>  .jpg
        String suffix = originalFilename.substring(originalFilename.lastIndexOf(",") + 1);
        String uuid = IdGen.uuid();
        String filePath = "/upload/images/head/" + uuid + suffix;
        File file1 = new File(filePath);

        try {
            file.transferTo(file1);
        } catch (IOException e) {
            log.error(e.getMessage(), e);
            return MsgInfo.error();
        }

        return MsgInfo.success(filePath); //1 已存在
    }

    @ResponseBody
    @RequestMapping("/updatePassword")
    public MsgInfo updatePassword(User user) {
        return getMsgInfo(1, MsgInfo.OPT_DEL); //1 已存在
    }

    @ResponseBody
    @RequestMapping("get")
    public User get(User user) {
        return userService.get(user.getId()); //1 已存在
    }


}
