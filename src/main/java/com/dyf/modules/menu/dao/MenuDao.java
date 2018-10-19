package com.dyf.modules.menu.dao;

import com.dyf.modules.menu.pojo.Menu;

import java.util.List;

public interface MenuDao {

    Menu get(Integer id);

    List<Menu> findList(Menu entity);

    int delete(Integer id);

    int insert(Menu entity);

    int update(Menu entity);

    List<Menu> getMenuTree(Menu entity);
}