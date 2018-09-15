package com.dyf.user.dao;

import com.dyf.user.pojo.User;

import java.util.List;

public interface UserDao {

    User get(Integer id);

    List<User> findList(User user);

    int delete(Integer id);

    int insert(User user);

    int update(User user);
}
