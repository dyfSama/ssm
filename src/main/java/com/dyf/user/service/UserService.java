package com.dyf.user.service;

import com.dyf.user.pojo.User;

import java.util.List;

public interface UserService {

    User get(String id);

    User getByName(String loginName);

    List<User> findList(User user);

    int delete(String id);

    int save(User user);

    int batchDelete(String id);
}
