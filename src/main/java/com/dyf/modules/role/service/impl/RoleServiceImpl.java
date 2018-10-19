package com.dyf.modules.role.service.impl;

import com.dyf.common.utils.SystemUtils;
import com.dyf.modules.role.dao.RoleDao;
import com.dyf.modules.role.pojo.Role;
import com.dyf.modules.role.service.RoleService;
import com.dyf.modules.user.dao.UserDao;
import com.dyf.modules.user.pojo.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleDao roleDao;


    @Override
    public Role get(String id) {
        return roleDao.get(id);
    }

    @Override
    public List<Role> findList(Role entity) {
        return roleDao.findList(entity);
    }

    @Override
    public int delete(String id) {
        return roleDao.delete(id);
    }

    @Override
    public int save(Role entity) {
        if (StringUtils.isNotBlank(entity.getId())) {
            //有ID 更新
            entity.preUpdate();
            return roleDao.update(entity);
        } else {
            //新增
            entity.preInsert();
            return roleDao.insert(entity);
        }
    }
}
