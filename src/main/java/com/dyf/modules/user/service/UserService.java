package com.dyf.modules.user.service;

import com.dyf.modules.user.pojo.User;

import java.util.List;

public interface UserService  {

    User get(String id);

    List<User> findList(User entity);

    int delete(String id);

    int save(User entity);

    User getByName(String userName);

    int batchDelete(String id);
}
