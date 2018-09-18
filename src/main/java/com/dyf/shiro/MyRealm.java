package com.dyf.shiro;

import com.dyf.user.pojo.User;
import com.dyf.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

@Slf4j
public class MyRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }

    /**
     * 登录认证
     *
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        log.info("shiro登录认证....");
        String username = token.getUsername();
        String password = String.valueOf(token.getPassword());
        log.info("username: " + username + "<====>" + "password: " + password);

        if (null != username) {
            User user = userService.getByName(username);
            log.info(user != null ? user.toString() : "未找到给用户");
            if (null == user) {
                throw new UnknownAccountException("账号或密码不正确!");
            } else {
                if (!password.equals(user.getPassword())) {
                    throw new IncorrectCredentialsException("账号或密码不正确!");
                } else {
                    /*
                    第一个参数user
                    第二个字段是user.getPassword()，注意这里是指从数据库中获取的password。
                    第三个字段是realm，即当前realm的名称。
                    */
                    log.info("身份认证成功!");
                    return new SimpleAuthenticationInfo(username, user.getPassword(), this.getName());
                }
            }
        }

        return null;
    }
}
