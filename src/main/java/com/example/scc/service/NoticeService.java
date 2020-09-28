package com.example.scc.service;

import com.example.scc.domain.Notice;

import java.util.List;

public interface NoticeService {

    public void register(Notice notice) throws Exception;

    public List<Notice> list() throws Exception;

    public List<Notice> search(String title) throws Exception;

    public Notice read(Integer boardNo) throws Exception;
}
