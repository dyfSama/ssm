package com.dyf.system.mail.service.impl;

import com.dyf.base.SpringTestBase;
import com.dyf.system.mail.service.MailSenderService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;

import javax.security.auth.Subject;

import java.io.File;

import static org.junit.Assert.*;

public class MailSenderServiceImplTest extends SpringTestBase {

    @Autowired
    private MailSenderService mailSenderService;


    @Test
    public void sendSimpleMail() {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setText("水电费的身份");
        mailMessage.setTo("742161811@qq.com");
        mailMessage.setSubject("测试邮件");
        mailSenderService.sendSimpleMail(mailMessage);
    }

    @Test
    public void sendAttachmentMail() {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setText("附件的邮件的身份");
        String[] tos = new String[2];
        tos[0] = "742161811@qq.com";
        tos[1] = "du_yafei@163.com";
        mailMessage.setTo(tos);
        mailMessage.setSubject("测试邮件");
        File file = new File("d:/2AP9.jpg");
        mailSenderService.sendAttachmentMail(mailMessage, file);
    }
}