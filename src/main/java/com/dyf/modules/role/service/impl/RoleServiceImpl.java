package com.dyf.modules.role.service.impl;

import com.dyf.common.contant.Contants;
import com.dyf.common.service.impl.CrudService;
import com.dyf.modules.menu.mapper.MenuMapper;
import com.dyf.modules.role.mapper.RoleMapper;
import com.dyf.modules.role.mapper.RoleMenuMapper;
import com.dyf.modules.role.entity.Role;
import com.dyf.modules.role.service.RoleService;
import com.dyf.modules.user.mapper.UserRoleMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

@Service
public class RoleServiceImpl extends CrudService<RoleMapper, Role> implements RoleService {

    @Resource
    private RoleMenuMapper roleMenuMapper;
    @Resource
    private UserRoleMapper userRoleMapper;

    @Override
    public boolean saveOrUpdate(Role entity) {
        boolean flag1 = super.saveOrUpdate(entity);
        this.maintainRoleMenu(entity);
        return flag1;
    }


    @Override
    public boolean deleteById(String id) {

        //删除角色和用户的关系
        userRoleMapper.batchDeleteUserRoleByRoleId(new Role(id));
        //删除角色和菜单的关系
        roleMenuMapper.batchDeleteRoleMenuByRoleId(new Role(id));

        return super.deleteById(id);
    }

    @Override
    public boolean deleteByIds(String ids) {

        String[] idArray = ids.split(Contants.SPLIT_1);
        List<String> idList = Arrays.asList(idArray);
        for (String id : idList) {
            //删除角色和用户的关系
            userRoleMapper.batchDeleteUserRoleByRoleId(new Role(id));
            //删除角色和菜单的关系
            roleMenuMapper.batchDeleteRoleMenuByRoleId(new Role(id));

        }
        return super.deleteByIds(ids);
    }


    /**
     * 维护机构和角色的关系
     *
     * @param entity
     * @return
     */
    @Override
    public boolean maintainRoleMenu(Role entity) {
        boolean flag2 = false;
        //先请空关系
        roleMenuMapper.batchDeleteRoleMenuByRoleId(entity);
        if (entity.getMenuIds() != null && entity.getMenuIds().length > 0) {
            flag2 = roleMenuMapper.insertRoleMenu(entity) > 0;
        } else {
            return true;
        }
        return flag2;
    }
}
