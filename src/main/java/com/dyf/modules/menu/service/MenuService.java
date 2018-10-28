package com.dyf.modules.menu.service;


import com.dyf.common.service.BaseSerivce;
import com.dyf.modules.menu.entity.Menu;

import java.util.List;

public interface MenuService extends BaseSerivce<Menu> {

    List<Menu> getMenuTree(Menu entity);
}
