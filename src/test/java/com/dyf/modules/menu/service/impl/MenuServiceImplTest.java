package com.dyf.modules.menu.service.impl;

import com.dyf.modules.menu.pojo.Menu;
import com.dyf.modules.menu.service.MenuService;
import com.dyf.modules.user.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import sun.reflect.generics.tree.Tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-context.xml"})
@WebAppConfiguration
@Slf4j
public class MenuServiceImplTest {

    @Autowired
    private MenuService menuService;

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void get() {
    }

    @Test
    public void findList() {
        Gson gson = new GsonBuilder().disableHtmlEscaping().create();
        Menu menu2 = new Menu();
        List<Menu> list = menuService.findList(menu2);

        //最终结果
        List<Menu> menuList = new ArrayList<>();

        //顶级菜单;
        for (Menu menu : list) {
            if (menu.getParentId() == null) {
                menuList.add(menu);
            }
        }
       List<Menu> cm =  getChild("0", list);
//        menuList.get(0).setChildren(cm);
        Map<String,Object> jsonMap = new HashMap<>();
        jsonMap.put("menu", menuList);
        System.out.println(gson.toJson(jsonMap));

    }

    private List<Menu> getChild(String id, List<Menu> list) {
        //子菜单
        List<Menu> childList = new ArrayList<>();

        for (Menu menu : list) {
            if (id.equals(menu.getParentId())) {
                childList.add(menu);
            }
        }
        //子菜单的子菜单
        for (Menu menu : childList) {
//            menu.setChildren(getChild(menu.getId(), list));
        }

        if (childList.size() == 0) {
            return null;
        }
        return childList;
    }



    @Test
    public void delete() {
    }

    @Test
    public void save() {

//        Menu menu1= new Menu();
//        menu1.setMenuName("druid");
//        menu1.setId("122");
//        menu1.setParentId("12");
//        menuService.save(menu1);

//        Menu menu2 = new Menu();
//        menu2.setMenuName("子菜单21");
//        menu2.setParentId("bc66b178dc2045539ec0d88911f4644a");
//        menuService.save(menu2);
    }
}