package com.dyf.system.mail.service;

import org.springframework.mail.SimpleMailMessage;

/**
 * <p>
 * 邮件接口
 * </p>
 *
 * @auther: duyafei
 * @date: 2018/10/31 22:13
 */
public interface MailSenderService {

    public String sendSimpleMail(SimpleMailMessage message);
}
