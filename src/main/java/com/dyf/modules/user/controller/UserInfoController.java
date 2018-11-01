package com.dyf.modules.user.controller;

import com.dyf.common.contant.Contants;
import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.modules.user.entity.User;
import com.dyf.modules.user.service.UserService;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
import com.google.code.kaptcha.Producer;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @className: UserInfoController
 * @description: TODO
 * @auther: duyafei
 * @date: 2018/10/25 10:13
 */
@Slf4j
@Controller
@RequestMapping("/modules/userInfo")
public class UserInfoController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private Producer captchaProducer;

    @RequestMapping("/info")
    public String info() {
        return "modules/user/userInfo/info";
    }

    @RequestMapping("/toPassword")
    public String password() {
        return "modules/user/userInfo/password";
    }


    @ResponseBody
    @RequestMapping("/updatePassword")
//    @Log(moduleName = "用户管理",businessType = BusinessType.INSERT)
    public MsgInfo updatePassword(User user) {
        return getMsgInfo(1, MsgInfo.OPT_DEL);
    }

    @RequestMapping("/toRegister")
    public String toRegister() {
        return "modules/user/userInfo/register";
//        return "modules/user/userInfo/reg";
    }

    /**
     * 注册用户
     *
     * @param request
     * @param entity
     * @return
     */
    @ResponseBody
    @RequestMapping("/register")
//    @Log(moduleName = "用户管理",businessType = BusinessType.INSERT)
    public MsgInfo register(HttpServletRequest request, User entity) {
        //sesiion中的验证码
        String verifyCode = WebUtils.getCleanParam(request, "verifyCode");
        String verifyCodeInSesion = (String) request.getSession().getAttribute(Contants.MAIL_CODE_SESSION_KEY) + "";
        if (!(verifyCode != null && verifyCode.equalsIgnoreCase(verifyCodeInSesion))) {
            return MsgInfo.error("验证码不正确!");
        }
        return getMsgInfo(userService.saveOrUpdate(entity), MsgInfo.OPT_SAVE);
    }


    @RequestMapping("/formAvatar")
    public String formAvatar() {
        log.info("============================注册用户");
        return "modules/user/userInfo/formAvatar";
    }

    @RequestMapping("/forget")
    public String forget() {
        return "modules/user/userInfo/forget";
    }


    /**
     * 获取图形验证码
     *
     * @param request
     * @param response
     */
    @RequestMapping("/getVerifyCode")
    public void getVerifyCode(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().setAttribute(Contants.IMG_CODE_SESSIO_KEY, "");
        //设置浏览器不要缓存
        response.setDateHeader("Expires", 0);
        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");
        // return a jpeg
        response.setContentType("image/jpeg");
        // create the text for the image
        String capText = captchaProducer.createText();
        // store the text in the session
        request.getSession().setAttribute(Contants.IMG_CODE_SESSIO_KEY, capText);
        // create the image with the text
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = null;
        try {
            out = response.getOutputStream();
            ImageIO.write(bi, "jpg", out);
            out.flush();
        } catch (IOException e) {
            log.info(e.getMessage(), e);
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                log.info(e.getMessage(), e);
            }
        }
        log.info("Captchca:" + request.getSession().getAttribute(Contants.IMG_CODE_SESSIO_KEY));
    }

    /**
     * 检查用户名唯一
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkUserName")
    public boolean checkUserName(User user) {
        return userService.getByUserName(user.getUserName()) == null;
    }


    /**
     * 检查邮件唯一
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkEmail")
    public boolean checkEmail(User user) {
        return true;
    }


}
