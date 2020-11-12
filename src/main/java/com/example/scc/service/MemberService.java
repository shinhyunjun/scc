package com.example.scc.service;

import com.example.scc.domain.Member;
import com.example.scc.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface MemberService {

    // 등록 처리
    public void register(Member member) throws Exception;

    // 원본 이미지 표시
    public String getPicture(Integer user_no) throws Exception;

    public void modifyUser(Member member) throws Exception;

    public void sendMail(String pwd, String address);

    public Member idCheck(String user_id) throws Exception;

    public Member getMemberByNameAndEmail(String user_name, String user_email) throws Exception;
}
