package com.example.scc.service;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Member;
import com.example.scc.domain.MemberAuth;
import com.example.scc.mapper.MemberMapper;
import org.assertj.core.util.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.rmi.CORBA.Util;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper;

    @Transactional
    @Override
    public void register(Member member) throws Exception {

        mapper.create(member);

        MemberAuth memberAuth = new MemberAuth();

        memberAuth.setUser_no(member.getUser_no());
        memberAuth.setAuth("ROLE_MEMBER");  //auth 컬럼에 ROLE_MEMBER

        mapper.createAuth(memberAuth);
    }

    @Override
    public List<Member> list(PageRequest pageRequest) throws Exception {
        return mapper.list(pageRequest);
    }

    @Override
    public int count(PageRequest pageRequest) throws Exception {
        return mapper.count(pageRequest);
    }

    @Override
    public Member read(int user_no) throws Exception {
        return mapper.read(user_no);
    }

    @Override
    public String readPw(int user_no) throws Exception {
        return mapper.readPw(user_no);
    }


    @Override
    public void modify(Member member) throws Exception {
        mapper.update(member);

    }

    @Transactional
    @Override
    public void remove(int user_no) throws Exception {
        mapper.deleteAuth(user_no);

        mapper.deleteComment(user_no);

        mapper.deleteCart(user_no);

        mapper.delete(user_no);
    }

    @Override
    public int countAll() throws Exception {
        return mapper.countAll();
    }


    @Override
    public Member idCheck(String user_id) throws Exception {

        return mapper.idCheck(user_id);
    }


    @Override
    public String getPicture(int user_no) throws Exception {
        return mapper.getPicture(user_no);
    }


    public Member getMemberByNameAndEmail(String user_name, String user_email) throws Exception {
        return mapper.getMemberByNameAndEmail(user_name, user_email);
    }


    public Member getMemberByIdAndEmail(String user_id, String user_email) throws Exception {
        return mapper.getMemberByIdAndEmail(user_id, user_email);
    }


    @Override
    public void modifyPwd(Member member) throws Exception {

        mapper.modifyPwd(member);
    }


}
