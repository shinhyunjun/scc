package com.example.scc.mapper;

import com.example.scc.domain.Member;

public interface TestMapper {
    public void create(Member member) throws Exception;

    public Member read(int user_no) throws Exception;

    public void update(Member member) throws Exception;

    public String getPicture(int user_no) throws Exception;


}
