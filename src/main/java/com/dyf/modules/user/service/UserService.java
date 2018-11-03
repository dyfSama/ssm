package com.dyf.modules.user.service;

import com.dyf.common.service.BaseSerivce;
import com.dyf.modules.user.entity.User;

import java.util.List;

public interface UserService  extends BaseSerivce<User> {

    User getByUserName(String userName);

    boolean maintainUserRole(User user);

    User getAvatarById(String id);
}
