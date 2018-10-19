package com.dyf.modules.user.dao;

import com.dyf.modules.user.pojo.User;

import java.util.List;

public interface UserDao  {


    User getByName(String userName);

    int batchDelete(List<String> idList);

    User get(String id);

    List<User> findList(User entity);

    int delete(String id);

    int insert(User entity);

    int update(User entity);
}
