package com.dyf.modules.logger.service.impl;

import com.dyf.modules.logger.pojo.SysLog;
import com.dyf.modules.logger.service.SysLogService;
import com.dyf.system.aspect.enums.BusinessType;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-context.xml"})
@WebAppConfiguration
@Slf4j
public class SysLogServiceImplTest {


    @Autowired
    private SysLogService sysLogService;

    @Test
    public void findList() {
    }

    @Test
    public void save() {
        SysLog log = new SysLog();
        log.setBusinessType(BusinessType.QUERY.ordinal());
        log.setExecMethod("sdfs");
        log.setTime(100);
        log.setModule("系统管理");
        log.setRemoteAddr("192.168.56.1");
        log.setRemoteUrl("/user/findList");
        sysLogService.save(log);
    }
}