package com.dyf.modules.role.dao;

import com.dyf.modules.role.pojo.Role;

import java.util.List;

public interface RoleDao {

    Role get(String id);

    List<Role> findList(Role entity);

    int delete(String id);

    int insert(Role entity);

    int update(Role entity);
}