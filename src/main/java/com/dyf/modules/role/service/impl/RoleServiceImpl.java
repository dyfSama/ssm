package com.dyf.modules.role.service.impl;

import com.dyf.common.service.impl.CrudService;
import com.dyf.modules.menu.mapper.MenuMapper;
import com.dyf.modules.role.mapper.RoleMapper;
import com.dyf.modules.role.mapper.RoleMenuMapper;
import com.dyf.modules.role.entity.Role;
import com.dyf.modules.role.service.RoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

@Service
public class RoleServiceImpl extends CrudService<RoleMapper, Role> implements RoleService {

    @Resource
    private RoleMenuMapper roleMenuMapper;

    @Override
    public boolean saveOrUpdate(Role entity) {
        boolean flag1 = super.saveOrUpdate(entity);
        boolean flag2 = this.maintainRoleMenu(entity);
        return flag1 && flag2;
    }

    /**
     * 维护机构和角色的关系
     * @param entity
     * @return
     */
    @Override
    public boolean maintainRoleMenu(Role entity) {
        boolean flag1 = false;
        boolean flag2 = false;
        if (entity.getMenuIds() != null && entity.getMenuIds().length > 0) {
            flag1 = roleMenuMapper.batchDeleteRoleMenuByRoleId(entity) > 0;
            flag2 = roleMenuMapper.insertRoleMenu(entity) > 0;
        }else{
            return true;
        }
        return flag2;
    }
}
