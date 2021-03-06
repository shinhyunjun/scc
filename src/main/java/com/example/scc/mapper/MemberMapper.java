package com.example.scc.mapper;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Member;
import com.example.scc.domain.MemberAuth;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface MemberMapper {

    //권한 생성
    public void createAuth(MemberAuth memberAuth);

    public List<Member> list(PageRequest pageRequest) throws Exception;

    public int count(PageRequest pageRequest) throws Exception;

    public Member read(int user_no) throws Exception;

    public void update(Member member) throws Exception;

    public void delete(int user_no) throws Exception;

    public int countAll() throws Exception;

    public String readPw(int user_no) throws Exception;

    //권한 삭제
    public void deleteAuth(int userNo) throws Exception;

    public void deleteComment(int userNo) throws Exception;

    public void deleteCart(int userNo) throws Exception;

    //등록 처리
    public void create(Member member) throws Exception;

    // 해당 사용자 아이디를 가진 회원정보를 조회한다.
    public Member readByUserId(String userId);

    public String getPicture(int itemId) throws Exception;

    public Member idCheck(String user_id) throws Exception;

    public Member getMemberByNameAndEmail(@Param("user_name") String user_name, @Param("user_email") String user_email) throws Exception;

    public Member getMemberByIdAndEmail(@Param("user_id") String user_id, @Param("user_email") String user_email) throws Exception;

    public void modifyPwd(Member member) throws Exception;

}


