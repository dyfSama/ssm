package com.dyf.system.shiro;

import com.dyf.common.contant.Contants;
import com.dyf.modules.user.entity.User;
import com.dyf.modules.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

@Slf4j
public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    /**
     * 授权
     *
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Object principal = principals.getPrimaryPrincipal();
        Set<String> roles = new HashSet<>();
        roles.add("user");
        if ("admin".equals(principal)) {
            roles.add("admin");
        }
        SimpleAuthorizationInfo saInfo = new SimpleAuthorizationInfo(roles);
        return saInfo;
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
        UsernamePasswordToken upToken = (UsernamePasswordToken) authenticationToken;
        String username = upToken.getUsername();

        if (username == null) {
            throw new AccountException("用户名不能为空!");
        }
        User user = userService.getByUserName(username);

        if (null == user) {
            throw new UnknownAccountException("用户[ " + username + " ]不存在!");
        }

        if (Contants.STATUS_LOCKED.equals(user.getStatus())) {
            throw new LockedAccountException("用户[ " + username + " ]已被停用!");
        }

        /**
         * principal   认证实体信息
         * credentials  密码
         * realmName   当前real对象的name
         * credentialsSalt  盐值
         */
        Object principal = username;
        Object credentials = user.getPassword();
        String realmName = getName();
        ByteSource credentialsSalt = ByteSource.Util.bytes(username);
        SimpleAuthenticationInfo saInfo = new SimpleAuthenticationInfo(principal, credentials, credentialsSalt, realmName);

        return saInfo;
    }
}
