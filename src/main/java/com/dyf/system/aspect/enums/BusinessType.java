package com.dyf.system.aspect.enums;

/**
 * @className: BusinessType
 * @description: 业务类型
 * @auther: duyafei
 * @date: 2018/10/19 13:53
 */
public enum BusinessType {

    /**
     * 新增/更新 0
     */
    INSERT_UPDATE,

    /**
     * 删除 1
     */
    DELETE,

    /**
     * 批量删除 2
     */
    DELETE_BATCH,

    /**
     * 登录 3
     */
    LOGNIN,

    /**
     * 注销 4
     */
    LOGOUT,

    /**
     * 代码生成 5
     */
    CODE_GENERATOR,

    /**
     * 其他 6
     */
    OTHER,


}
