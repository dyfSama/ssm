package com.dyf.modules.menu.service.impl;

import com.dyf.common.service.impl.CrudService;
import com.dyf.modules.menu.mapper.MenuMapper;
import com.dyf.modules.menu.entity.Menu;
import com.dyf.modules.menu.service.MenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MenuServiceImpl extends CrudService<MenuMapper, Menu> implements MenuService {


    @Resource
    private MenuMapper menuMapper;


    /**
     * 角色的菜单信息回显
     *
     * @param entity
     * @return
     */
    @Override
    public List<Menu> getMenuTree(Menu entity) {
        //菜单
        List<Menu> menuList = menuMapper.getMenuTree(entity);
        //拥有权限的菜单
        List<Menu> checkedList = menuMapper.getMenuListByRoleId(entity.getRoleId());
        //选中
        for (Menu menu : menuList) {
            for (Menu menu1 : checkedList) {
                if (menu.getId().equals(menu1.getId())) {
                    menu.setChecked(true);
                }
            }
        }
        return menuList;
    }
}
