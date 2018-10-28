package com.dyf.modules.user.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.common.page.TableDataInfo;
import com.dyf.common.utils.IdGen;
import com.dyf.modules.user.entity.User;
import com.dyf.modules.user.service.UserService;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
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
@RequestMapping("/modules/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * toList
     *
     * @return
     */
    @RequestMapping("/toList")
    public String list() {
        return "modules/user/userList";
    }

    /**
     * form
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/toForm")
    public String form(User user, Model model) {
        if (StringUtils.isNotBlank(user.getId())) {
            model.addAttribute("entityId", user.getId());
            return "modules/user/editUser";
        } else {
            return "modules/user/addUser";
        }
    }

    /**
     * 数据list
     *
     * @param request
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public TableDataInfo getList(HttpServletRequest request, User user) {
        startPage(request);
        List<User> userList = userService.findList(user);
        return getTableInfo(userList);
    }

    /**
     * 保存更新
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/save")
    @Log(moduleName = "用户管理", businessType = BusinessType.INSERT)
    public MsgInfo save(User user) {
        return getMsgInfo(userService.saveOrUpdate(user), MsgInfo.OPT_SAVE);
    }

    /**
     * 删除
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequiresRoles({"admin"})
    @RequestMapping("/delete")
    @Log(moduleName = "用户管理", businessType = BusinessType.DELETE)
    public MsgInfo delete(User user) {
        return getMsgInfo(userService.deleteById(user.getId()), MsgInfo.OPT_DEL);
    }

    /**
     * 批量删除
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/batchDelete")
    @Log(moduleName = "用户管理", businessType = BusinessType.DELETE_BATCH)
    public MsgInfo batchDelete(User user) {
        return getMsgInfo(userService.deleteByIds(user.getId()), MsgInfo.OPT_DEL);
    }

    /**
     * 检查用户名唯一
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkUserName")
    public boolean checkUserName(User user) {
        return userService.getByUserName(user.getUserName()) == null;
    }

    /**
     * 获取单条记录
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("getById")
    public User getById(User user) {
        return userService.getById(user.getId());
    }

   /* @ResponseBody
    @RequestMapping("uploadAvatar")
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

        return MsgInfo.success(filePath);
    }*/


}
