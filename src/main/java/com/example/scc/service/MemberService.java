package com.example.scc.service;

import com.example.scc.domain.Member;

public interface MemberService {

    // 등록 처리
    public void register(Member member) throws Exception;


    // 원본 이미지 표시
    public String getPicture(Integer user_no) throws Exception;
}
