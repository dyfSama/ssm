package com.dyf.modules.user.service.impl;

import com.dyf.common.utils.SystemUtils;
import com.dyf.modules.user.service.UserService;
import com.dyf.modules.user.dao.UserDao;
import com.dyf.modules.user.pojo.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public User get(String id) {
        return userDao.get(id);
    }

    @Override
    public User getByName(String userName) {
        return userDao.getByName(userName);
    }

    @Override
    public List<User> findList(User user) {
        return userDao.findList(user);
    }

    @Override
    public int delete(String id) {
        return userDao.delete(id);
    }

    @Override
    public int save(User user) {

        if (StringUtils.isNotBlank(user.getId())) {
            //有ID 更新
            user.preUpdate();
//            SystemUtils.entryptPassword(user);
            return userDao.update(user);
        } else {
            //新增
            user.preInsert();
            SystemUtils.entryptPassword(user);
            return userDao.insert(user);
        }
    }

    @Override
    public int batchDelete(String ids) {
        int rows = 0;
        if (StringUtils.isNotBlank(ids)) {
            String[] idArray = ids.split(",");
            List<String> idList = Arrays.asList(idArray);
            rows = userDao.batchDelete(idList);
        }
        return rows;
    }


}
