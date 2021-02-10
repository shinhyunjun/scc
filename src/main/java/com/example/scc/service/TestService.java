package com.example.scc.service;

import com.example.scc.domain.Member;

import java.beans.ExceptionListener;

public interface TestService {
    public void register(Member member) throws Exception;

    public Member read(int user_no) throws Exception;

    public void modify(Member member) throws Exception;

    public String getPicture(int user_no) throws Exception;
}
