package com.example.scc.mapper;

import com.example.scc.common.security.domain.PageRequest;

import com.example.scc.domain.Reply;

import java.util.List;

public interface ReplyMapper {

    public void create(Reply reply) throws Exception;

    public List<Reply> list(int scc_numz) throws Exception;

    public void replyUpdate(Reply reply) throws Exception;

    public void replyDelete(int rno) throws Exception;
}
