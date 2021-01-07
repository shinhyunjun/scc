package com.example.scc.mapper;

import com.example.scc.domain.Comment;

import java.util.List;

public interface CommentMapper {

    public int commentCount() throws Exception;

    // 댓글 목록
    public List<Comment> commentList(int bno) throws Exception;

    // 댓글 작성
    public int commentInsert(Comment comment) throws Exception;

    // 댓글 수정
    public int commentUpdate(Comment comment) throws Exception;

    // 댓글 삭제
    public int commentDelete(int cno) throws Exception;

    public int countReply(int bno) throws Exception;
}