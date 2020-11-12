package com.example.scc.service;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Notice;
import com.example.scc.domain.Reply;

import java.util.List;

public interface ReplyService {

    public void register(Reply reply) throws Exception;

    public List<Reply> list(int scc_num) throws Exception;

    public void replyUpdate(Reply reply) throws Exception;

    public void replyDelete(int rno) throws Exception;

}
