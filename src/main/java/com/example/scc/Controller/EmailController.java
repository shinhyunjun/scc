package com.example.scc.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Map;

/*
@Controller
public class EmailController {

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = "/user/findPwd")
    public String emailPage() {

        return "user/findPwd";
    }

    @RequestMapping(value="/searchPw.do", method= RequestMethod.GET)
    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv) throws Exception {

        String user_id = (String) paramMap.get("user_id");
        String user_email = (String) paramMap.get("user_email");
        String user_password = "1111111111";

        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

            messageHelper.setSubject(user_id+"님 비밀번호 찾기 메일입니다.");
            messageHelper.setText("비밀번호는 "+user_password+" 입니다.");
            messageHelper.setTo(user_email);
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(user_email));
            mailSender.send(msg);

        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }

        mv.setViewName("user/emailSuccess");
        return mv;
    }




}
*/
