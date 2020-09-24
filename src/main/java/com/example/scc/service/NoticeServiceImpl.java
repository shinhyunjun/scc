package com.example.scc.service;

import com.example.scc.domain.Notice;
import com.example.scc.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper mapper;

    @Override
    public void register(Notice notice) throws Exception{
        mapper.create(notice);
    }
}
