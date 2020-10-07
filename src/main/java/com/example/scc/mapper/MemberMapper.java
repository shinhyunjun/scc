package com.example.scc.mapper;

import com.example.scc.domain.Member;
import com.example.scc.domain.MemberAuth;

public interface MemberMapper {

    //권한 생성
    public void createAuth(MemberAuth memberAuth);

    //권한 삭제
    public void deleteAuth(int userNo) throws Exception;

    //등록 처리
    public void create(Member member) throws Exception;
}
