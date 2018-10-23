package com.dyf.system.aspect.annotation;

import com.dyf.system.aspect.enums.BusinessType;

import java.lang.annotation.*;

/**
 * @description: 自定义主机
 * @auther: duyafei
 * @date:   2018/10/19 13:58
 */
@Retention(RetentionPolicy.RUNTIME)//注解会在class中存在，运行时可通过反射获取
@Target(ElementType.METHOD)//目标是方法和参数
@Documented//文档生成时，该注解将被包含在javadoc中，可去掉
public @interface Log {
    /**
     * 模块名字
     */
    String module() default "";

    /**
     * 业务类型
     */
    BusinessType businessType() default BusinessType.OTHER;

}