package com.dyf.system.aspect;

import com.dyf.common.contant.Contants;
import com.dyf.common.utils.SystemUtils;
import com.dyf.modules.logger.entity.Logger;
import com.dyf.modules.logger.service.LoggerService;
import com.dyf.modules.user.entity.User;
import com.dyf.system.aspect.annotation.Log;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

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

    @Autowired
    private LoggerService loggerService;


    /**
     * @description: 在所有标注@Log的地方切入
     * @auther: duyafei
     * @date: 2018/10/19 15:26
     */
    @Pointcut("@annotation(com.dyf.system.aspect.annotation.Log)")
    private void logAspect() {
    }


    @AfterThrowing("logAspect()")
    public void doAfterThrowing() {
        log.info("例外通知................");
    }


    @Around("logAspect()")
    public Object doAround(ProceedingJoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();

        Object object = null;
        Logger entity = new Logger();
        entity.setIsException(0);
        try {
            object = joinPoint.proceed();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            entity.setIsException(1);
            entity.setExceptionInfo(e.getMessage());
        }

        long endTime = System.currentTimeMillis();
        //设置参数
        entity.setExecTime((int) (endTime - startTime));
        sysLogOperation(joinPoint, entity);
        return object;
    }


    /**
     * @description: aop日志操作
     * @auther: duyafei
     * @date: 2018/10/19 17:28
     * @param: [joinPoint, entity]
     * @return: void
     */
    private void sysLogOperation(JoinPoint joinPoint, Logger log) {

        //方法签名
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        //方法
        Method method = methodSignature.getMethod();
        //自定义参数module
        String moduleName = method.getAnnotation(Log.class).moduleName();
        //自定义参数businessType
        int businessType = method.getAnnotation(Log.class).businessType().ordinal();
        //执行的方法名
        String execMethod = method.toString();
        //从session中获取操作者
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        User user = (User) request.getSession().getAttribute(Contants.CURRENT_USER);
        //请求url
        String remoteUrl = request.getRequestURL().toString();
        //请求方法的类型(get/post)
        String requestMethod = request.getMethod();
        //ip地址
        String remoteAddr = SystemUtils.getHostAddress();
        //执行时间
        int t = log.getExecTime();
        //异常信息
        String exceptionInfo = log.getExceptionInfo();
        //是否异常
        int isException = log.getIsException();
        //设置参数
        Logger entity = new Logger();
        entity.setCreateBy(null != user ? user.getUserName() : "");
        entity.setRemoteAddr(remoteAddr);
        entity.setModuleName(moduleName);
        entity.setBusinessType(businessType);
        entity.setExecTime(t);
        entity.setRemoteUrl(remoteUrl);
        entity.setRequestMethod(requestMethod);
        entity.setExecMethod(execMethod);
        entity.setExceptionInfo(exceptionInfo);
        entity.setIsException(isException);
        //保存日志
        loggerService.saveOrUpdate(entity);
    }

}
