package com.dyf.system.job.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @className: MyScheduler
 * @description: TODO
 * @auther: duyafei
 * @date: 2018/10/24 09:28
 */
//@Component
@Lazy(false)
@Slf4j
public class MyScheduler {
   /* @Scheduled(cron = "0/5 * * * * ? ")
    public void myTask() {
        int i = 0;
        System.out.println("=================第" + i++ + "次执行"
                + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:sss").format(new Date()));
    }*/
}
