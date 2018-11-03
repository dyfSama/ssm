package com.dyf.modules.user.service.impl;

import com.dyf.common.contant.Contants;
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
import java.util.Arrays;
import java.util.List;

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

    @Override
    public boolean deleteById(String id) {
        //删除用户和角色的关联信息
        userRoleMapper.batchDeleteUserRoleByUserId(new User(id));
        return super.deleteById(id);
    }

    @Override
    public boolean deleteByIds(String ids) {
        //删除用户和角色关联信息
        String[] idArray = ids.split(Contants.SPLIT_1);
        List<String> idList = Arrays.asList(idArray);
        for (String id : idList) {
            userRoleMapper.batchDeleteUserRoleByUserId(new User(id));
        }
        return super.deleteByIds(ids);
    }


    /**
     * 保存用户信息,维护关联信息,加密
     *
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
        this.maintainUserRole(user);
        return flag1;
    }

    /**
     * 维护角色和用户的关联信息
     * 先删除该用户已有的角色,然后添加新的角色
     *
     * @param user
     */
    @Override
    public boolean maintainUserRole(User user) {
        boolean flag2 = false;
        //啥都不管先清空关联
        userRoleMapper.batchDeleteUserRoleByUserId(user);
        if (user.getRoleIds() != null && user.getRoleIds().length > 0) {
            flag2 = userRoleMapper.insertUserRole(user) > 0;
        } else {
            return true;
        }
        return flag2;
    }

    @Override
    public User getAvatarById(String id) {
        return userMapper.getAvatarById(id);
    }

}
