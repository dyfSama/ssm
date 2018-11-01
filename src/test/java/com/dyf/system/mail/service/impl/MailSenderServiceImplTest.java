package com.dyf.system.mail.service.impl;

import com.dyf.base.SpringTestBase;
import com.dyf.system.mail.service.MailSenderService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;

import static org.junit.Assert.*;

public class MailSenderServiceImplTest extends SpringTestBase {

    @Autowired
    private MailSenderService mailSenderService;

    @Test
    public void sendSimpleMail() {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo("742161811@qq.com");
        String code = mailSenderService.sendSimpleMail(mailMessage);
        System.out.println("================="+code);
    }
}