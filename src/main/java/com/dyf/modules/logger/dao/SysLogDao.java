package com.dyf.modules.logger.dao;

import com.dyf.modules.logger.pojo.SysLog;

import java.util.List;

public interface SysLogDao {

//    SysLog get(Integer id);

    List<SysLog> findList(SysLog entity);

//    int delete(Integer id);

    int insert(SysLog entity);

//    int update(SysLog entity);

}