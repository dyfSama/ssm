package com.dyf.common.utils;

import com.dyf.common.contant.Contants;
import com.dyf.modules.user.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * @className: SystemUtils
 * @description: TODO
 * @auther: duyafei
 * @date: 2018/10/16 16:51
 */
@Slf4j
public class SystemUtils {

    public static void entryptPassword(User user) {

        if (!StringUtils.isNotBlank(user.getId())) {
            /**
             * 新增用户(注册和添加两种),
             *      注册(密码不空),
             *      添加 默认密码 admin
             */
            String todoPassword =
                    (StringUtils.isNotBlank(user.getPassword()) ? user.getPassword() : "admin");
            log.info("======================用户:" + user.getUserName() + " 密码加密");
            //加密算法
            String algorithmName = "MD5";
            //密码
            Object credentials = todoPassword;
            //盐值:用户名
            Object salt = user.getUserName();
            //加密次数
            int hashIterations = 1024;
            Object result = new SimpleHash(algorithmName, credentials, salt, hashIterations);
            user.setPassword(result.toString());
        } else {
            /**
             * 更新密码
             */
            if (StringUtils.isNotBlank(user.getPassword())) {
                String todoPassword = user.getPassword();
                log.info("======================用户:" + user.getUserName() + " 密码加密");
                //加密算法
                String algorithmName = "MD5";
                //密码
                Object credentials = todoPassword;
                //盐值:用户名
                Object salt = user.getUserName();
                //加密次数
                int hashIterations = 1024;
                Object result = new SimpleHash(algorithmName, credentials, salt, hashIterations);
                user.setPassword(result.toString());
            }
        }

    }

    /**
     * @description: 获取ip地址
     * @auther: duyafei
     * @date: 2018/10/19 17:35
     */
    public static String getHostAddress() {
        String remoteAddr = "";
        try {
            remoteAddr = InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

        return remoteAddr;
    }


    /**
     * @description: 获取当前登录用户
     * @auther: duyafei
     * @date: 2018/10/25 1:31
     */
    public static User getCurrentUser() {
        return (User) SecurityUtils.getSubject().getSession().getAttribute(Contants.CURRENT_USER);
    }


    /**
     * 是否是超级管理员(id为 "0")
     *
     * @param user
     * @return
     */
    public static boolean isSuperAdmin(User user) {

        return Contants.ADMIN_ID.equals(user.getId());
    }


}
