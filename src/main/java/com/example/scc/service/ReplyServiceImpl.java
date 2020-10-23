package com.example.scc.service;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Notice;
import com.example.scc.domain.Reply;
import com.example.scc.mapper.NoticeMapper;
import com.example.scc.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService{

    @Autowired
    private ReplyMapper mapper;

    @Override
    public void register(Reply reply) throws Exception{

        mapper.create(reply);

    }

    @Override
    public List<Reply> list(int scc_num) throws Exception {

        return mapper.list(scc_num);
    }

}
