package com.example.scc.service;

import com.example.scc.domain.Member;
import com.example.scc.domain.MemberAuth;
import com.example.scc.mapper.MemberMapper;
import org.assertj.core.util.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper;

    @Transactional
    @Override
    public void register(Member member) throws Exception{

        mapper.create(member);

        MemberAuth memberAuth = new MemberAuth();

        memberAuth.setUser_no(member.getUser_no());
        memberAuth.setAuth("ROLE_MEMBER");  //auth 컬럼에 ROLE_MEMBER

        mapper.createAuth(memberAuth);
    }

    /*
    @Override
    public Member idCheck(String user_id) throws Exception{

        return mapper.idCheck(user_id);
    }

     */

    @Override
    public String getPicture(Integer user_no) throws Exception {
        return mapper.getPicture(user_no);
    }

    @Override
    public void modifyUser(Member member) throws Exception{

        mapper.modifyUser(member);
    }

    @Autowired
    private JavaMailSender mailSender;
    private static final String FROM_ADDRESS = "";

    @Override
    public void sendMail(String pwd, String address){

        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo(address);
        message.setFrom(FROM_ADDRESS);
        message.setSubject("비밀번호 찾기 안내 메일입니다.");
        message.setText("비밀번호는 " + pwd + "입니다.");

        mailSender.send(message);
    }

    @Override
    public Member findPwd(Member member) throws Exception{

        return mapper.findPwd(member);
    }
}
