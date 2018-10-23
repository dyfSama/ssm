package com.dyf.system.login;


import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.modules.menu.pojo.Menu;
import com.dyf.modules.menu.service.MenuService;
import com.dyf.modules.user.pojo.User;
import com.dyf.modules.user.service.UserService;
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

@Slf4j
@Controller
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;


    @Autowired
    private MenuService menuService;


    /**
     * 登录页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        log.info("================================登录页面");
//        return "system/login";
        return "system/login_layui";
    }

    /**
     * shiro登录验证
     *
     * @param request
     * @param user
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping("/shiroLogin")
    public MsgInfo shiroLogin(HttpServletRequest request, User user) {
        log.info("================================shiro登录验证");
        Subject currentUser = SecurityUtils.getSubject();
        if(!currentUser.isAuthenticated()){
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getPassword());
            String rememberMe= request.getParameter("rememberMe");
            log.info("==================记住我"+rememberMe);
            //todo
            token.setRememberMe(false);
            try {
                currentUser.login(token);
                //成功将用户信息设置到session
                 request.getSession().setAttribute("currentUser",userService.getByName(user.getUserName()));
            } catch (AuthenticationException e) {
                log.error(e.getMessage(), e);
                return MsgInfo.error(e.getMessage());
            }
        }

        return  MsgInfo.success();
    }

    /**
     * 普通登录验证
     *
     * @param request
     * @param model
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/loginAuth")
    public MsgInfo loginAuth(HttpServletRequest request, Model model, User user) {
        log.info("================================普通登录验证");
        String password_input = user.getPassword();
        String loginName = user.getUserName();
        User currentUser = userService.getByName(loginName);
        if (currentUser != null) {
            if (password_input.equals(currentUser.getPassword())) {
                return MsgInfo.success();
            }
        } else {
            return MsgInfo.error();
        }
        return MsgInfo.error();
    }

    /**
     * index
     *
     * @param request
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest request, Model model, User user) {
        log.info("================================主页");
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        model.addAttribute("currentUser", userService.getByName(currentUser.getUserName()));
        Menu entity = new Menu();
        entity.setParentId(0);
        model.addAttribute("topMenuList", menuService.findList(entity));
        return "system/index";
//        return "system/index_layui";
    }



    /**
     * console
     *
     * @param request
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("/console")
    public String console(HttpServletRequest request) {
        log.info("================================主页1 ");
        return "home/console";
    }

    /**
     * index_v1
     *
     * @param request
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("/index_v1")
    public String index_v1(HttpServletRequest request) {
        log.info("================================主页1 ");
        return "home/index_v1";
    }

    /**
     * index_v1
     *
     * @param request
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("/index_v2")
    public String index_v2(HttpServletRequest request) {
        log.info("================================主页2 ");
        return "home/index_v2";
    }


    /**
     * 注销
     *
     * @param request
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, Model model, User user) {
        log.info("================================注销");
        request.getSession().setAttribute("currentUser",null);
        return "redirect:/login";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(HttpServletRequest request, Model model, User user) {
        log.info("================================注销");
        return "error/unauthorized";
    }


}
