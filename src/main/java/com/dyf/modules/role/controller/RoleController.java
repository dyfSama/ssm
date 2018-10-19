package com.dyf.modules.role.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.common.page.TableDataInfo;
import com.dyf.modules.menu.pojo.Menu;
import com.dyf.modules.menu.service.MenuService;
import com.dyf.modules.role.pojo.Role;
import com.dyf.modules.role.service.RoleService;
import com.dyf.modules.user.pojo.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;


    @RequestMapping("/toList")
    public String toList(Menu menu) {
        return "modules/role/roleList"; //1 已存在
    }

    @RequestMapping("/form_builder")
    public String form_builder(Menu menu) {
//        return "modules/menu/menuList"; //1 已存在
//        return "modules/menu/tree_view"; //1 已存在
        return "tools/form_builder"; //1 已存在
    }


    @RequestMapping("/form")
    public String form() {
        return "modules/role/roleForm";
    }

    @ResponseBody
    @RequestMapping("/getList")
    public TableDataInfo getList(HttpServletRequest request, Role entity) {
        startPage(request);
        List<Role> userList = roleService.findList(entity);
        return getTableInfo(userList);
    }

    @ResponseBody
    @RequestMapping("/save")
    public MsgInfo save(Role entity) {
        int rows = roleService.save(entity);
        return getMsgInfo(rows, MsgInfo.OPT_SAVE);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public MsgInfo delete(Role entity) {
        String id = entity.getId();
        int rows = roleService.delete(id);
        return getMsgInfo(rows, MsgInfo.OPT_DEL);
    }


}
