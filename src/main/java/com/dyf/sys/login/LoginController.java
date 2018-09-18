package com.dyf.sys.login;


import com.dyf.user.pojo.User;
import com.dyf.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("/sys")
@Controller
@Slf4j
public class LoginController {

    @Autowired
    private UserService userService;


    @RequestMapping("/login")
    public String login(HttpServletRequest request, User user) {
        UsernamePasswordToken token = new UsernamePasswordToken(user.getName(), user.getPassword());
        Subject currentUser = SecurityUtils.getSubject();
        try {
            currentUser.login(token);

        } catch (AuthenticationException ae) {
            log.error(ae.getMessage(), ae);
            request.getSession().setAttribute("errorMessage", "用户名或密码错误");
            return "error";
        }

        return "home";
    }


    @RequestMapping("/welcome")
    public String welcome(HttpServletRequest request, User user) {


        return "welcome";
    }



}
