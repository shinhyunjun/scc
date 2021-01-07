package com.example.scc.service;

import com.example.scc.domain.Comment;

import java.util.List;

public interface CommentService {
    public List<Comment> commentList(int bno) throws Exception;

    public int commentInsert(Comment comment) throws Exception;

    public int commentUpdate(Comment comment) throws Exception;

    public int commentDelete(int cno) throws Exception;

    public int countReply(int bno) throws Exception;
}
