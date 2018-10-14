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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@Slf4j
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserService userService;

    //sfsfdsf
    @RequestMapping("/login")
    public String login(HttpServletRequest request, User user) {
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPassword());
        Subject currentUser = SecurityUtils.getSubject();
        try {
            currentUser.login(token);

        } catch (AuthenticationException ae) {
            log.error(ae.getMessage(), ae);
            request.getSession().setAttribute("errorMessage", "用户名或密码错误");
            return "error";
        }

        return "index";
    }

    @ResponseBody
    @RequestMapping("/checkUser")
    public String checkUser(HttpServletRequest request, Model model, User user) {
        String password_input = user.getPassword();
        String loginName = user.getLoginName();
        User currentUser = userService.getByName(loginName);
        if (currentUser != null) {
            if (password_input.equals(currentUser.getPassword())) {
                return "1";
            }
        }else{
            return "0";
        }
        return "0";
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request, Model model, User user) {
      /*  User currentUser = userService.getByName(user.getLoginName());
        model.addAttribute("currentUser",currentUser);*/
        return "index";
    }


    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, Model model, User user) {

        return "redirect:/a";
    }


}
