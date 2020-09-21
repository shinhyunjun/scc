package com.example.scc.service;

import com.example.scc.domain.Sign;
import com.example.scc.mapper.SignMapper;
import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SignServiceImpl implements SignService {

    @Autowired
    private SignMapper mapper;

    @Override
    public void register(Sign sign) throws Exception{
        mapper.create(sign);
    }
}
