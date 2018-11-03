package com.dyf.modules.user.controller;

import com.dyf.common.contant.Contants;
import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.common.page.TableDataInfo;
import com.dyf.common.utils.SystemUtils;
import com.dyf.modules.user.entity.User;
import com.dyf.modules.user.service.UserService;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    public String list(Model model) {
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
    @RequiresPermissions("module:user:list")
    public TableDataInfo getList(HttpServletRequest request, User user) {
        startPage(request);
        List<User> userList = userService.findList(user);
        return getTableInfo(userList);
    }

    /**
     * 保存更新
     *
     * @param entity
     * @return
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("module:user:edit")
    @Log(moduleName = "用户管理", businessType = BusinessType.INSERT_UPDATE)
    public MsgInfo save(User entity) {
        if (SystemUtils.isSuperAdmin(entity) && !SystemUtils.isSuperAdmin(SystemUtils.getCurrentUser())) {
            return MsgInfo.error("普通用户不允许修改超级管理员用户");
        }
        return getMsgInfo(userService.saveOrUpdate(entity), MsgInfo.OPT_SAVE);
    }

    /**
     * 删除
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("module:user:delete")
    @Log(moduleName = "用户管理", businessType = BusinessType.DELETE)
    @ApiOperation(value = "根据ID删除用户", httpMethod = "GET", response = MsgInfo.class, notes = "根据ID删除用户")
    public MsgInfo delete(User user) {
        if (SystemUtils.isSuperAdmin(user)) {
            return MsgInfo.error("不允许删除超级管理员用户");
        }
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
    @RequiresPermissions("module:user:delete")
    @Log(moduleName = "用户管理", businessType = BusinessType.DELETE_BATCH)
    public MsgInfo batchDelete(User user) {
        if (user.getId().contains(Contants.ADMIN_ID)) {
            return MsgInfo.error("不允许删除超级管理员用户");
        }
        return getMsgInfo(userService.deleteByIds(user.getId()), MsgInfo.OPT_DEL);
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

}
