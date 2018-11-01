package com.dyf.system.mail.controller;

import com.dyf.common.contant.Contants;
import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.system.mail.service.MailSenderService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * todo
 * </p>
 *
 * @auther: duyafei
 * @date: 2018/10/31 22:28
 */
@Slf4j
@Controller
@RequestMapping("/system/mailSender")
public class MailSenderController extends BaseController {

    @Autowired
    private MailSenderService mailSenderService;

    @ResponseBody
    @RequestMapping("/sendMailCode")
    public MsgInfo sendMailCode(SimpleMailMessage message, HttpServletRequest request) {
        String mailCode = mailSenderService.sendSimpleMail(message);
        if (null != mailCode) {
            request.getSession().setAttribute(Contants.MAIL_CODE_SESSION_KEY, mailCode);
            log.info("mailcode===============" + request.getSession().getAttribute(Contants.MAIL_CODE_SESSION_KEY));
            return MsgInfo.success();
        }
        return MsgInfo.error();
    }
}
