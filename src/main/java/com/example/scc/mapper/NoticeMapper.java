package com.example.scc.mapper;

import com.example.scc.domain.Notice;

import java.util.List;

public interface NoticeMapper {

    public void create(Notice notice) throws Exception;

    public List<Notice> list() throws Exception;
}
