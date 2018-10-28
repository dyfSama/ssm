package com.dyf.modules.logger.service.impl;

import com.dyf.base.SpringTestBase;
import com.dyf.modules.logger.service.LoggerService;
import com.dyf.modules.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-context.xml"})
@WebAppConfiguration
@Slf4j
public class LoggerServiceImplTest extends SpringTestBase {

    @Autowired
    private LoggerService loggerService;

    @Autowired
    private UserService userService;
    @Test
    public void test(){
//       boolean flag = loggerService.deleteById("332115e642a9434ea26492d04e3d8601");
//       assertEquals(true,flag);
        loggerService.findList(null);
    }

    @Test
    public void test2(){
        userService.findList(null);
//        loggerService.findList(null);
    }
}