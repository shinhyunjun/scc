package com.example.scc.Controller;

import com.example.scc.domain.Member;
import com.example.scc.service.MemberService;
import com.example.scc.service.NoticeService;
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
import javax.servlet.http.HttpSession;
import java.util.Map;


@Controller
public class EmailController {

    @Autowired
    private MemberService service;

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = "/findAccount")
    public String emailPage() {

        return "findAccount";
    }

    @RequestMapping(value="/searchPw.do", method= RequestMethod.GET)
    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv, Member member, HttpSession session) throws Exception {

        String USERNAME = (String) paramMap.get("username");
        String EMAIL = (String) paramMap.get("email");
        String PASSWORD = "1111111111";

        member.setUser_password(PASSWORD);
        session.setAttribute("member",member);
        service.newPassword(member);

        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

            messageHelper.setSubject(USERNAME+"님 비밀번호 찾기 메일입니다.");
            messageHelper.setText("비밀번호는 "+PASSWORD+" 입니다.");
            messageHelper.setTo(EMAIL);
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(EMAIL));
            mailSender.send(msg);

        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }

        mv.setViewName("emailSuccess");
        return mv;
    }


}
