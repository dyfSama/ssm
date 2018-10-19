package com.dyf.system.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

/**
 * @className: LoggerAspect
 * @description: 系统日志
 * @auther: duyafei
 * @date: 2018/10/19 12:16
 */
@Aspect
@Slf4j
@Component
public class LoggerAspect {
    //controller层切入点)
    //定义在dyf包下面的所有包或子包下面以Controller结尾的文件下面的所有方法
//    @Pointcut("execution(* com.dyf..*.*Controller.*(..))")
    @Pointcut("@annotation(com.dyf.system.aspect.annotation.SysLog)")
    private void controllerAspect() {
        log.info("开始记录controller日志................");
    }


    @Before("controllerAspect() && args(name)")
    public void doBefore(String name) {
        log.info("前置通知.................");
    }

    @AfterReturning("controllerAspect()")
    public void doAfterReturning() {
        log.info("后置通知..................");
    }


    @After("controllerAspect()")
    public void doAfter() {
        log.info("最终通知..................");
    }

    @AfterThrowing("controllerAspect()")
    public void doAfterThrowing() {
        log.info("例外通知................");
    }

    @Around("controllerAspect()")
    public Object doAround(ProceedingJoinPoint joinPoint) throws Throwable {
        log.info("环绕通知start...................");
        // 拦截的实体类，就是当前正在执行的controller
        Object target = joinPoint.getTarget();
        // 拦截的方法名称。当前正在执行的方法
        String methodName = joinPoint.getSignature().getName();
        // 拦截的方法参数
        Object[] args = joinPoint.getArgs();
        // 拦截的放参数类型
        Signature sig = joinPoint.getSignature();
        log.info(target.toString());
        log.info(methodName);
        log.info(args.toString());
        log.info(sig.toLongString());
        Object object = joinPoint.proceed();
        log.info("环绕通知end...................");

        return object;
    }

}
