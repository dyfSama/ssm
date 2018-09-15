package com.dyf.user.service;

import com.dyf.user.pojo.User;

import java.util.List;

public interface UserService {

    User get(Integer id);

    List<User> findList(User user);

    int delete(Integer id);

    int save(User user);
}
