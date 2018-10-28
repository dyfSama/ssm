package com.dyf.modules.user.mapper;

import com.dyf.common.persistence.annotaion.MyBatisDao;
import com.dyf.common.persistence.mapper.BaseMapper;
import com.dyf.modules.user.entity.User;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {


    User getByUserName(String userName);

}
