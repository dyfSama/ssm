package com.dyf.system.login;

import com.dyf.common.contant.Contants;
import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.modules.menu.service.MenuService;
import com.dyf.modules.user.entity.User;
import com.dyf.modules.user.service.UserService;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
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

/**
 * @description: 登录操作
 * @auther: duyafei
 * @date: 2018/10/24 23:15
 */
@Slf4j
@Controller
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private MenuService menuService;

    /**
     * 登录页面
     */
    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        return "system/login";
//        return "system/login_layui";
    }

    /**
     * shiro登录验证
     */
    @ResponseBody
    @RequestMapping("/shiroLogin")
    @Log(moduleName = "登录验证", businessType = BusinessType.LOGNIN)
    public MsgInfo shiroLogin(HttpServletRequest request, User user) {
        Subject currentUser = SecurityUtils.getSubject();
        if (!currentUser.isAuthenticated()) {
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getPassword());
            String rememberMe = request.getParameter("rememberMe");
            token.setRememberMe(true);
            try {
                currentUser.login(token);
                //验证成功将用户信息设置到session(两种)
                User currentUserDetail = userService.getByUserName(user.getUserName());
                SecurityUtils.getSubject().getSession().setAttribute(Contants.CURRENT_USER, currentUserDetail);
//                request.getSession().setAttribute("currentUser", userService.getByName(user.getUserName()));
            } catch (AuthenticationException e) {
                log.error(e.getMessage(), e);
                return MsgInfo.error(e.getMessage());
            }
        }
        return MsgInfo.success();
    }

    /**
     * 注销
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
//        request.getSession().setAttribute("currentUser", null);
        request.getSession().invalidate();
//        request.getSession().removeAttribute("uiUsers");
        return "redirect:/login";
    }

    /**
     * 没有权限
     */
    @RequestMapping("/unauthorized")
    public String unauthorized(HttpServletRequest request, Model model, User user) {
        return "error/unauthorized";
    }


    /**
     * index,首页
     */
    @RequestMapping("/index")
    public String index(Model model) {
        return "system/index";
//        return "system/index_layui";
    }


    /**
     * console
     */
    @RequestMapping("/console")
    public String console(HttpServletRequest request) {
        log.info("================================主页1 ");
        return "home/console";
    }

    /**
     * index_v1
     */
    @RequestMapping("/index_v1")
    public String index_v1(HttpServletRequest request) {
        log.info("================================主页1 ");
        return "home/index_v1";
    }

    /**
     * index_v1
     */
    @RequestMapping("/index_v2")
    public String index_v2(HttpServletRequest request) {
        log.info("================================主页2 ");
        return "home/index_v2";
    }

}
