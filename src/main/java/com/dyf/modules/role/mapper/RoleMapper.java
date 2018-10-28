package com.dyf.modules.role.mapper;

import com.dyf.common.persistence.annotaion.MyBatisDao;
import com.dyf.common.persistence.mapper.BaseMapper;
import com.dyf.modules.logger.entity.Logger;
import com.dyf.modules.role.entity.Role;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {


    List<Role> findList(Role entity);

    int delete(String id);

    int insert(Role entity);

    int update(Role entity);

    int batchDelete(List<String> idList);


    List<Role> getRoleListByUserId(String id);
}