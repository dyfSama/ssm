package com.dyf.modules.user.service.impl;

import com.dyf.common.service.impl.CrudService;
import com.dyf.common.utils.SystemUtils;
import com.dyf.modules.role.service.RoleService;
import com.dyf.modules.user.entity.User;
import com.dyf.modules.user.mapper.UserMapper;
import com.dyf.modules.user.mapper.UserRoleMapper;
import com.dyf.modules.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl extends CrudService<UserMapper, User> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private UserRoleMapper userRoleMapper;

    @Autowired
    private RoleService roleService;


    @Override
    public User getByUserName(String userName) {
        return userMapper.getByUserName(userName);
    }

    /**
     * 保存用户信息,维护关联信息,加密
     * @param user
     * @return
     */
    @Override
    public boolean saveOrUpdate(User user) {
        //密码加密
        SystemUtils.entryptPassword(user);
        //保存用户信息
        boolean flag1 = super.saveOrUpdate(user);
        //维护用户角色关联信息
        boolean flag2 = this.maintainUserRole(user);
        return flag1 && flag2;
    }

    /**
     * 维护角色和用户的关联信息
     * 先删除该用户已有的角色,然后添加新的角色
     *
     * @param user
     */
    @Override
    public boolean maintainUserRole(User user) {
        boolean flag1 = false;
        boolean flag2 = false;
        if (user.getRoleIds() != null && user.getRoleIds().length > 0) {
            flag1 = userRoleMapper.batchDeleteUserRoleByUserId(user) > 0;
            flag2 = userRoleMapper.insertUserRole(user) > 0;
        }else{
            return true;
        }
        return  flag2;
    }

}
