package com.dyf.modules.menu.service.impl;

import com.dyf.common.utils.SystemUtils;
import com.dyf.modules.menu.dao.MenuDao;
import com.dyf.modules.menu.pojo.Menu;
import com.dyf.modules.menu.service.MenuService;
import com.dyf.modules.role.dao.RoleDao;
import com.dyf.modules.role.pojo.Role;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {


    @Resource
    private MenuDao menuDao;

    @Override
    public Menu get(Integer id) {
        return menuDao.get(id);
    }

    @Override
    public List<Menu> findList(Menu entity) {
        return menuDao.findList(entity);
    }

    @Override
    public int delete(Integer id) {
        return menuDao.delete(id);
    }

    @Override
    public int save(Menu entity) {

        if (null != entity.getId()) {
            //有ID 更新
            entity.preUpdate();
            return menuDao.update(entity);
        } else {
            //新增
            entity.preInsert();
            return menuDao.insert(entity);
        }
    }

    @Override
    public List<Menu> getMenuTree(Menu entity) {
        return menuDao.getMenuTree(entity);
    }
}
