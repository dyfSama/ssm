package com.dyf.modules.logger.pojo;

import com.dyf.common.persistence.DataEntity;
import lombok.Data;

import java.util.Date;

/**
 * @description: 日志类
 * @auther: duyafei
 * @date: 2018/10/19 15:02
 */
@Data
public class SysLog extends DataEntity<SysLog> {

    private static final long serialVersionUID = -1226223071294955433L;


    private String module;

    private Integer businessType;

    private String execMethod;

    private String remoteUrl;

    private String requestMethod;

    private String remoteAddr;

    private Integer time;

    private Integer isException;

    private String exceptionInfo;

}