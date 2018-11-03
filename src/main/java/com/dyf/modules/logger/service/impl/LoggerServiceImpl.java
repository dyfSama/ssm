package com.dyf.modules.logger.service.impl;

import com.dyf.common.service.impl.CrudService;
import com.dyf.modules.logger.entity.Logger;
import com.dyf.modules.logger.mapper.LoggerMapper;
import com.dyf.modules.logger.service.LoggerService;
import com.dyf.modules.menu.entity.Menu;
import com.dyf.modules.role.mapper.RoleMenuMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class LoggerServiceImpl extends CrudService<LoggerMapper, Logger> implements LoggerService {

    @Resource
    private LoggerMapper loggerMapper;

}
