package com.example.scc.service;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Criteria;
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


    // 페이징 요청 정보를 매개변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
    @Override
    public List<Notice> list(PageRequest pageRequest) throws Exception {
        return mapper.list(pageRequest);
    }

    /*
    public int listCount() throws Exception{
        return mapper.listCount();
    }
*/

    /*
    @Override
    public List<Notice> search(String title) throws Exception{
        return mapper.search(title);
    }
*/

    @Override
    public Notice read(Integer boardNo) throws Exception{
        return mapper.read(boardNo);
    }

    @Override
    public void modify(Notice notice) throws Exception {
        mapper.update(notice);
    }

    @Override
    public void remove(Integer boardNo) throws Exception {
        mapper.delete(boardNo);
    }

    // 검색처리된 게시글 건수를 반환한다.
    @Override
    public int count(PageRequest pageRequest) throws Exception {
        return mapper.count(pageRequest);
    }

}
