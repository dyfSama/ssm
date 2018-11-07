package com.dyf.modules.menu.mapper;

import com.dyf.common.persistence.annotaion.MyBatisDao;
import com.dyf.common.persistence.mapper.BaseMapper;
import com.dyf.modules.menu.entity.Menu;

import java.util.List;

public interface MenuMapper extends BaseMapper<Menu> {

    /**
     * 菜单树
     * @param entity
     * @return
     */
    List<Menu> getMenuTree(Menu entity);

    /**
     * 角色Id查询有权限的菜单信息
     * @param id
     * @return
     */
    List<Menu> getMenuListByRoleId(String id);

    List<Menu> getMenuByUserId(String id);

    List<Menu> getMenuAll();

}
