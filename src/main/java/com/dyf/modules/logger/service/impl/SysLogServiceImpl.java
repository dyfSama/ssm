package com.dyf.modules.logger.service.impl;

import com.dyf.modules.logger.dao.SysLogDao;
import com.dyf.modules.logger.pojo.SysLog;
import com.dyf.modules.logger.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SysLogServiceImpl implements SysLogService {

    @Resource
    private SysLogDao sysLogDao;


    @Override
    public List<SysLog> findList(SysLog entity) {
        return sysLogDao.findList(entity);
    }


    @Override
    public int save(SysLog entity) {
        entity.preInsert();
        return sysLogDao.insert(entity);
    }
}
