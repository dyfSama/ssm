package com.dyf.modules.menu.service.impl;

import com.dyf.base.SpringTestBase;
import com.dyf.modules.menu.entity.Menu;
import com.dyf.modules.menu.service.MenuService;
import com.dyf.modules.user.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

@Slf4j
public class MenuServiceImplTest extends SpringTestBase {

    @Autowired
    private MenuService menuService;

    @Test
    public void getMenuListByUser() {
        User u = new User();
//        u.setId("0");
        u.setId("9c2d7b88c9954ed2889671aa8938f44c");
        List<Menu> list = menuService.getMenuListByUser(u);
        log.info("list:=============" + list);
    }


}