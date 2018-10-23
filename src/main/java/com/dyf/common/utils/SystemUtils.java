package com.dyf.common.utils;

import com.dyf.modules.user.pojo.User;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * @className:   SystemUtils
 * @description: TODO
 * @auther: duyafei
 * @date:   2018/10/16 16:51
 */
@Slf4j
public class SystemUtils {

    public static void entryptPassword(User user){

        if(StringUtils.isNotBlank(user.getId())){
            /**
             * 新增用户(注册和添加两种),
             *      注册(密码不空),
             *      添加 默认密码 admin
             */
            String todoPassword =
                    (StringUtils.isNotBlank(user.getPassword()) ? user.getPassword() : "admin");
            log.info("======================用户:"+ user.getUserName() +" 密码加密");
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
        }else {
            /**
             * 更新密码
             */
            String todoPassword = user.getPassword();
            log.info("======================用户:"+ user.getUserName() +" 密码加密");
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

    /**
     * @description: 获取ip地址
     * @auther: duyafei
     * @date:   2018/10/19 17:35
     */
    public static String getHostAddress(){
        String remoteAddr = "";
        try {
            remoteAddr = InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

        return remoteAddr;
    }


}
