package com.dyf.modules.menu.service;


import com.dyf.common.service.BaseSerivce;
import com.dyf.modules.menu.entity.Menu;
import com.dyf.modules.user.entity.User;

import java.util.List;

public interface MenuService extends BaseSerivce<Menu> {

    List<Menu> getMenuTree(Menu entity);

    /**
     * 获取当前用户的所有菜单
     * @param currentUser
     * @return
     */
    List<Menu> getMenuListByUser(User currentUser);

}
