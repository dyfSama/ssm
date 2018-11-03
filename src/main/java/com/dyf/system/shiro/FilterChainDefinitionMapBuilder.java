package com.dyf.system.shiro;

import org.springframework.stereotype.Component;

import java.util.LinkedHashMap;

/**
 * @className: FilterChainDefinitionMapBuilder
 * @description: 从数据表中初始化资源和权限
 * @auther: duyafei
 * @date: 2018/10/25 01:01
 */
@Component
public class FilterChainDefinitionMapBuilder {

    public LinkedHashMap<String, String> builderFilterChainDefinitionMap() {
        //必须是linkedHashMap
        LinkedHashMap<String, String> linkedHashMap = new LinkedHashMap<>();

        //顺序不是随意的
        linkedHashMap.put("/static/**", "anon");
        linkedHashMap.put("/shiroLogin", "anon");//登录验证
        linkedHashMap.put("/modules/userInfo/**", "anon");//注册时的
        linkedHashMap.put("/system/mailSender/**", "anon");//注册时发送邮件验证码
        linkedHashMap.put("/logout", "logout");//登录
        linkedHashMap.put("/**", "user");
        return linkedHashMap;
    }
}
