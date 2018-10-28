package com.dyf.system.job.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 基于注解的定时器
 */
@Component
public class SpringTaskAnnotation {

   /* // 定时计算。每一秒执行一次
    @Scheduled(cron = "0/1 * * * * *")
    public void show() {
        System.out.println(new Date() + " : Annotation：is show run");
    }

    *//**
     * 心跳更新。启动时执行一次，之后每隔2秒执行一次
     *//*
    @Scheduled(fixedRate = 1000 * 2)
    public void print() {
        System.out.println(new Date() + " : Annotation：is print run");
    }

    // 启动加载缓存, 以上一次执行完为准
    @Scheduled(fixedDelay = 1000)
    public void init() {
        System.out.println(new Date() + ": Annotation：is init run");
    }*/

}
