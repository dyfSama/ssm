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
        linkedHashMap.put("/shiroLogin", "anon");
        linkedHashMap.put("/user/toRegister", "anon");
        linkedHashMap.put("/user/register", "anon");
        linkedHashMap.put("/user/toForget", "anon");
        linkedHashMap.put("/logout", "logout");
        linkedHashMap.put("/druid", "user,roles[admin]");
        linkedHashMap.put("/index_v1", "roles[user]");
        linkedHashMap.put("/**", "user");
//        linkedHashMap.put("/**", "authc");

        return linkedHashMap;
    }
}
