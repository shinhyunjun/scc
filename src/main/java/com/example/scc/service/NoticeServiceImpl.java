package com.example.scc.service;

import com.example.scc.domain.Notice;
import com.example.scc.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper mapper;

    @Override
    public void register(Notice notice) throws Exception{
        mapper.create(notice);
    }


    @Override
    public List<Notice> list() throws Exception{
        return mapper.list();
    }

    @Override
    public List<Notice> search(String title) throws Exception{
        return mapper.search(title);
    }

    @Override
    public Notice read(Integer boardNo) throws Exception{
        return mapper.read(boardNo);
    }
}
