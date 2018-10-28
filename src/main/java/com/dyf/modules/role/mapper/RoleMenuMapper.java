package com.dyf.modules.role.mapper;

import com.dyf.common.persistence.annotaion.MyBatisDao;
import com.dyf.modules.role.entity.Role;

/**
 * @className: RoleMenuMapper
 * @description: TODO
 * @auther: duyafei
 * @date: 2018/10/27 21:33
 */

public interface RoleMenuMapper {

    int batchDeleteRoleMenuByRoleId(Role role);

    int batchDeleteRoleMenuByMenuId(Role role);

    int insertRoleMenu(Role role);


}
