package com.example.scc.service;


import com.example.scc.domain.Comment;
import com.example.scc.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper mapper;

    @Override
    public List<Comment> commentList(int bno) throws Exception {
        return mapper.commentList(bno);
    }

    @Override
    public int commentInsert(Comment comment) throws Exception {
        return mapper.commentInsert(comment);
    }

    @Override
    public int commentUpdate(Comment comment) throws Exception {
        return mapper.commentUpdate(comment);
    }

    @Override
    public int commentDelete(int cno) throws Exception {
        return mapper.commentDelete(cno);

    }

    @Override
    public int countReply(int bno) throws Exception {
        return mapper.countReply(bno);
    }
}
