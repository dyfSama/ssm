package com.dyf.system.mail.service.impl;

import com.dyf.system.mail.service.MailSenderService;
import com.google.code.kaptcha.Producer;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 * 邮件服务
 * </p>
 *
 * @auther: duyafei
 * @date: 2018/10/31 22:07
 */
@Service
@Slf4j
@Data
public class MailSenderServiceImpl implements MailSenderService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private Producer producer;

    @Value("${mail.username}")
    public String mailFrom;

    @Override
    public String sendSimpleMail(SimpleMailMessage message) {
        log.info(message.getTo() + "====================" + message.getFrom());
        String code = producer.createText();
        message.setFrom("du_yafei@163.com");//哪个账号发送一般就是自己配的
        message.setSubject("ssm_注册验证短信");
        message.setText("验证码:" + code);
        try {
            javaMailSender.send(message);

        } catch (MailException e) {
            log.error(e.getMessage(), e);
            return null;
        }
        return code;
    }

}
