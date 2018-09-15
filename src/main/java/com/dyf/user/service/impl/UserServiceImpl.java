package com.dyf.user.service.impl;

import com.dyf.user.dao.UserDao;
import com.dyf.user.pojo.User;
import com.dyf.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public User get(Integer id) {
        return userDao.get(id);
    }

    @Override
    public List<User> findList(User user) {
        return userDao.findList(user);
    }

    @Override
    public int delete(Integer id) {
        return userDao.delete(id);
    }

    @Override
    public int save(User user) {

        if (null == user.getId()) {
            return userDao.insert(user);
        }

        return userDao.update(user);
    }


}
