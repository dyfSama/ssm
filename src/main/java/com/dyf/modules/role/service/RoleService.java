package com.dyf.modules.role.service;

import com.dyf.modules.role.pojo.Role;

import java.util.List;

public interface RoleService {

    Role get(String id);

    List<Role> findList(Role entity);

    int delete(String id);

    int save(Role entity);

}
