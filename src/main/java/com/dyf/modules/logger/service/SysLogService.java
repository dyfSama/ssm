package com.dyf.modules.logger.service;


import com.dyf.modules.logger.pojo.SysLog;
import com.dyf.modules.menu.pojo.Menu;

import java.util.List;

public interface SysLogService {


    List<SysLog> findList(SysLog entity);


    int save(SysLog entity);

}
