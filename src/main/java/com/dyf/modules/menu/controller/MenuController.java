package com.dyf.modules.menu.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.common.page.TableDataInfo;
import com.dyf.common.utils.IdGen;
import com.dyf.modules.menu.pojo.Menu;
import com.dyf.modules.menu.service.MenuService;
import com.dyf.modules.user.pojo.User;
import com.dyf.modules.user.service.UserService;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("menu")
public class MenuController extends BaseController {

    @Autowired
    private MenuService menuService;


    @RequestMapping("toList")
    public String toList(Menu menu) {
        return "modules/menu/menuList";
    }

    @RequestMapping("form")
    public String form(Menu menu) {
        return "modules/menu/menuForm";
    }
    @RequestMapping("menuTree")
    public String menuTree(Menu menu) {
        return "modules/menu/menuTree";
    }


    @ResponseBody
    @RequestMapping("getList")
    @Log(module = "菜单管理", businessType = BusinessType.QUERY)
    public List<Menu> getList(Menu entity) {
        return menuService.findList(entity);
    }

    @ResponseBody
    @RequestMapping("save")
    public MsgInfo save(Menu entity) {
        int rows = menuService.save(entity);
        return getMsgInfo(rows, MsgInfo.OPT_SAVE);
    }

    @ResponseBody
    @RequestMapping("delete")
    public MsgInfo delete(Menu entity) {
        int rows = menuService.delete(entity.getId());
        return getMsgInfo(rows, MsgInfo.OPT_DEL);
    }

    @ResponseBody
    @RequestMapping("getMenuTree")
    public List<Map<String,Object>> getMenuTree(Menu entity) {
        List<Menu> list = menuService.getMenuTree(entity);
        List<Map<String,Object>> ll = new ArrayList<>();
        for (Menu menu : list) {
            Map<String,Object> m = new HashMap<>();
            m.put("id",menu.getId());
            m.put("pId",menu.getParentId());
            m.put("name",menu.getMenuName());
            if(0==(menu.getParentId())){
                m.put("open",true);
            }
            ll.add(m);
        }
        return ll;
    }

}
