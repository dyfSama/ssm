package com.dyf.modules.menu.service;


import com.dyf.modules.menu.pojo.Menu;

import java.util.List;

public interface MenuService {

    Menu get(Integer id);

    List<Menu> findList(Menu entity);

    int delete(Integer id);

    int save(Menu entity);

    List<Menu> getMenuTree(Menu entity);
}
