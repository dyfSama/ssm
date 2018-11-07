package com.dyf.modules.menu.service.impl;

import com.dyf.common.contant.Contants;
import com.dyf.common.service.impl.CrudService;
import com.dyf.common.utils.SystemUtils;
import com.dyf.modules.menu.mapper.MenuMapper;
import com.dyf.modules.menu.entity.Menu;
import com.dyf.modules.menu.service.MenuService;
import com.dyf.modules.role.mapper.RoleMenuMapper;
import com.dyf.modules.user.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class MenuServiceImpl extends CrudService<MenuMapper, Menu> implements MenuService {

    @Resource
    private MenuMapper menuMapper;

    @Resource
    private RoleMenuMapper roleMenuMapper;

    @Override
    public boolean deleteById(String id, boolean isPhysical) {

        //删除角色和菜单关系
        roleMenuMapper.batchDeleteRoleMenuByMenuId(new Menu(id));

        return super.deleteById(id, isPhysical);
    }

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

    @Override
    public List<Menu> getMenuListByUser(User currentUser) {
        List<Menu> menuList = new ArrayList<>();
        if (SystemUtils.isSuperAdmin(currentUser)) {
            //超级管理员所有菜单
            menuList = menuMapper.getMenuAll();
        } else {
            //其他按照用户ID查询
            menuList = menuMapper.getMenuByUserId(currentUser.getId());
        }
        //还要把菜单的子菜单查出来;
        return getChildMenu(menuList, Contants.TOP_MENU_PARENT_ID);
    }


    /**
     * 获得一级节点
     *
     * @param menuList
     * @param parentId
     * @return
     */
    private List<Menu> getChildMenu(List<Menu> menuList, String parentId) {
        //最终的菜单
        List<Menu> lastList = new ArrayList<Menu>();
        for (Menu menu : menuList) {
            //查找父节点ID与传进来的parentId一样的,即该节点的菜单
            if (parentId.equals(menu.getParentId())) {

                getChildren(menuList, menu);
                //一级菜菜单
                lastList.add(menu);
            }
        }
        return lastList;
    }

    /**
     * 为一级节点一级儿子节点设置自己的children
     *
     * @param menuList
     * @param menu
     */
    private void getChildren(List<Menu> menuList, Menu menu) {
        List<Menu> childList = getChildList(menuList, menu);
        menu.setChildren(childList);
        for (Menu m : childList) {
            getChildren(menuList, m);
        }
    }

    /**
     * 获取自己儿子的节点,可以通过数据库,这里直接for
     *
     * @param menuList
     * @param menu
     * @return
     */
    private List<Menu> getChildList(List<Menu> menuList, Menu menu) {
        List<Menu> list = new ArrayList<Menu>();
        for (Menu m : menuList) {
            if (menu.getId().equals(m.getParentId())) {
                list.add(m);
            }
        }
        return list;
    }
}
