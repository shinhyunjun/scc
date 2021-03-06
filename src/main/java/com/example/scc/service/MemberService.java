package com.example.scc.service;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Member;
import com.example.scc.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemberService {

    // 등록 처리
    public void register(Member member) throws Exception;

    public List<Member> list(PageRequest pageRequest) throws Exception;

    public int count(PageRequest pageRequest) throws Exception;

    public Member read(int user_no) throws Exception;

    public String readPw(int user_no) throws Exception;

    public void modify(Member member) throws Exception;

    public void remove(int user_no) throws Exception;

    public int countAll() throws Exception;

    // 원본 이미지 표시
    public String getPicture(int user_no) throws Exception;

    public Member idCheck(String user_id) throws Exception;

    public Member getMemberByIdAndEmail(String user_id, String user_email) throws Exception;

    public Member getMemberByNameAndEmail(String user_name, String user_email) throws Exception;

    public void modifyPwd(Member member) throws Exception;
}
