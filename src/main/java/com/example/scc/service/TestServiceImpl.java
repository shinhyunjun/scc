package com.example.scc.service;

import com.example.scc.domain.Member;
import com.example.scc.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService{
    @Autowired
    private TestMapper mapper;

    @Override
    public void register(Member member) throws Exception{
        mapper.create(member);
    }

    @Override
    public Member read(int user_no) throws Exception{
        return mapper.read(user_no);
    }

    @Override
    public void modify(Member member) throws Exception {
        mapper.update(member);
    }

    @Override
    public String getPicture(int user_no) throws Exception{
        return mapper.getPicture(user_no);
    }
}
