package com.dyf.modules.role.service;

import com.dyf.common.service.BaseSerivce;
import com.dyf.modules.role.entity.Role;

import java.util.List;

public interface RoleService extends BaseSerivce<Role> {

    /**
     * 维护机构和角色的关系
     * @param entity
     * @return
     */
    boolean maintainRoleMenu(Role entity);

}
