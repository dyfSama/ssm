package com.dyf.system.shiro;

import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
@Slf4j
public class ShiroTest {

    @Test
    public void Test1Shiro() {

        log.info("My First Apache Shiro Application");
        //1.加载配置文件
        Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro.ini");
        //2.解析ini文件放回SecurityManager的实例
        SecurityManager securityManager = factory.getInstance();
        //3.SecurityManager准备就绪
        SecurityUtils.setSecurityManager(securityManager);

        //当前正在执行的用户
        Subject currentUser = SecurityUtils.getSubject();
        //希望当前用户与应用程序的会话期间向用户提供内容，则可以获取其会话
        //提供了常规HttpSession所用的大部分内容，
        //但有一些额外的好东西和一个很大的区别：它不需要HTTP环境！
        Session session = currentUser.getSession();
        session.setAttribute("key1", "duyafei");


        if (!currentUser.isAuthenticated()) {
            //收集 用户密码和
            UsernamePasswordToken token = new UsernamePasswordToken("guest", "guest");
            //记住我
            token.setRememberMe(true);
            //登录
            try {
                currentUser.login(token);
                log.info("认证成功!");
                //获取当前用户的seesion信息, 当前用户权限
                log.info("user[ " + currentUser.getSession().getAttribute("key1") + currentUser.getPrincipal() + " ] 登录成功");
            } catch (UnknownAccountException uae) {
                log.error("找不到用户名!");
            } catch (IncorrectCredentialsException ice) {
                log.error("密码不匹配!");
            } catch (LockedAccountException lae) {
                log.error("账号被锁定!");
            } catch (AuthenticationException ae) {
                log.error("认证失败!");
            }
        }


        //测试当前用户是否具有特定的角色
        if (currentUser.hasRole("admin")) {
            log.info("拥有此角色权限!");
        } else {
            log.info("nonono!");
        }

        if (currentUser.isPermitted("lightsaber:sdfsdf")) {
            log.info("你可以做lightsaber:sdfsdf");
        } else {
            log.info("你没有权限这么做");
        }

        log.info("用户注销!");
        currentUser.logout();
        System.exit(0);

    }

    @Test
    public void TestMD5() {
        String algorithmName = "MD5";
        Object credentials = "admin";
        Object salt = "liubei";
        int hashIterations = 1024;
        Object result = new SimpleHash(algorithmName, credentials, salt, hashIterations);
//        log.info(result);
        System.out.println(result);

    }
}
