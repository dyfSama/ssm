package com.dyf.modules.role.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.common.page.TableDataInfo;
import com.dyf.modules.menu.entity.Menu;
import com.dyf.modules.role.entity.Role;
import com.dyf.modules.role.service.RoleService;
import com.dyf.modules.user.entity.User;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/modules/role")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;


    @RequestMapping("/toList")
    public String toList(Menu menu) {
        return "modules/role/roleList";
    }

    @RequestMapping("/toForm")
    public String form(Role entity, Model model) {
        if (StringUtils.isNotBlank(entity.getId())) {
            model.addAttribute("entityId", entity.getId());
            return "modules/role/editRole";
        } else {
            return "modules/role/addRole";
        }
    }

    @ResponseBody
    @RequestMapping("/list")
    public TableDataInfo getList(HttpServletRequest request, Role entity) {
        startPage(request);
        return getTableInfo(roleService.findList(entity));
    }

    @ResponseBody
    @RequestMapping("/save")
    @Log(moduleName = "角色管理", businessType = BusinessType.INSERT)
    public MsgInfo save(Role entity) {
        return getMsgInfo(roleService.saveOrUpdate(entity), MsgInfo.OPT_SAVE);
    }

    @ResponseBody
    @RequestMapping("/delete")
    @Log(moduleName = "角色管理", businessType = BusinessType.DELETE)
    public MsgInfo delete(Role entity) {
        return getMsgInfo(roleService.deleteById(entity.getId()), MsgInfo.OPT_DEL);
    }

    /**
     * 批量删除
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/batchDelete")
    @Log(moduleName = "角色管理", businessType = BusinessType.DELETE_BATCH)
    public MsgInfo batchDelete(Role entity) {
        return getMsgInfo(roleService.deleteByIds(entity.getId()), MsgInfo.OPT_DEL);
    }

    /**
     * 获取单条记录
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/getById")
    public Role getById(Role entity) {
        return roleService.getById(entity.getId());
    }

}
