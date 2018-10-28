package com.dyf.modules.logger.entity;

import com.dyf.common.persistence.DataEntity;
import lombok.Data;

/**
 * @description: 日志类
 * @auther: duyafei
 * @date: 2018/10/19 15:02
 */
@Data
public class Logger extends DataEntity<Logger> {

    private static final long serialVersionUID = -1226223071294955433L;

    /**
     * 模块名称
     */
    private String moduleName;

    /**
     * 业务类型
     */
    private Integer businessType;

    /**
     * 执行方法
     */
    private String execMethod;

    /**
     * 请求地址
     */
    private String remoteUrl;

    /**
     * 请求类型
     */
    private String requestMethod;

    /**
     * ip地址
     */
    private String remoteAddr;

    /**
     * 执行耗时
     */
    private Integer execTime;

    /**
     * 是否异常
     */
    private Integer isException;

    /**
     * 异常信息
     */
    private String exceptionInfo;

}