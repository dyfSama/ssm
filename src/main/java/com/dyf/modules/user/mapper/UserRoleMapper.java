package com.dyf.modules.user.mapper;

import com.dyf.common.persistence.annotaion.MyBatisDao;
import com.dyf.modules.role.entity.Role;
import com.dyf.modules.user.entity.User;


public interface UserRoleMapper {

    int batchDeleteUserRoleByRoleId(Role role);

    int batchDeleteUserRoleByUserId(User user);

    /**
     *
     * @param user
     * @return
     */
    int insertUserRole(User user);
}
