package com.dyf.common.config;

import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @className: Global
 * @description: 全局配置类 懒汉式单例类.在第一次调用的时候实例化自己
 * @auther: duyafei
 * @date: 2018/10/15 17:55
 */
public class Global {

    private Global() {

    }

    /**
     * 当前对象实例
     */
    private static Global global = null;


    /**
     * 静态工厂方法 获取当前对象实例 多线程安全单例模式(使用双重同步锁)
     */
    public static synchronized Global getInstance() {

        if (global == null) {
            synchronized (Global.class) {
                if (global == null)
                    global = new Global();
            }
        }
        return global;
    }


    /**
     * 保存全局属性值
     */
    private static Map<String, String> map = new HashMap<>();


    public static String getAdminPath() {
        return "/a";
    }

}
