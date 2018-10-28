package com.dyf.modules.menu.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.modules.menu.entity.Menu;
import com.dyf.modules.menu.service.MenuService;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/modules/menu")
public class MenuController extends BaseController {

    @Autowired
    private MenuService menuService;


    @RequestMapping("/toList")
    public String toList(Menu menu) {
        return "modules/menu/menuList";
    }

    @RequestMapping("/toForm")
    public String form(Model model, Menu entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            model.addAttribute("entityId", entity.getId());
            return "modules/menu/editMenu";
        } else {
            return "modules/menu/addMenu";
        }
    }

    @RequestMapping("/toMenuTree")
    public String menuTree(Menu entity,Model model) {
        model.addAttribute("entityId", entity.getId());
        return "modules/menu/menuTree";
    }

    /**
     * 菜单树
     * @param entity
     * @return
     */
    @ResponseBody
    @RequestMapping("/getMenuTree")
    public List<Menu> getMenuTree(Menu entity) {
        return menuService.getMenuTree(entity);
    }

    /**
     * 菜单列表
     * @param entity
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public List<Menu> getList(Menu entity) {
        return menuService.findList(entity);
    }

    /**
     * 保存更新
     * @param entity
     * @return
     */
    @ResponseBody
    @RequestMapping("/save")
    @Log(moduleName = "菜单管理",businessType = BusinessType.INSERT)
    public MsgInfo save(Menu entity) {
        return getMsgInfo(menuService.saveOrUpdate(entity), MsgInfo.OPT_SAVE);
    }

    @ResponseBody
    @RequestMapping("/delete")
    @Log(moduleName = "菜单管理",businessType = BusinessType.DELETE)
    public MsgInfo delete(Menu entity) {
        return getMsgInfo(menuService.deleteById(entity.getId()), MsgInfo.OPT_DEL);
    }

    @ResponseBody
    @RequestMapping("/getById")
    public Menu getById(Menu entity) {
        return menuService.getById(entity.getId());
    }


}
