package com.dyf.user.dao;

import com.dyf.user.pojo.User;

import java.util.List;

public interface UserDao {

    User get(String id);

    User getByName(String loginName);

    List<User> findList(User user);

    int delete(String id);

    int insert(User user);

    int update(User user);

    int batchDelete(List<String> idList);
}
