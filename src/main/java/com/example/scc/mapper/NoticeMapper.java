package com.example.scc.mapper;

import com.example.scc.domain.Criteria;
import com.example.scc.domain.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeMapper {

    public void create(Notice notice) throws Exception;

    public List<Notice> list(Criteria cri) throws Exception;
    public int listCount() throws Exception;

    public List<Notice> search(@Param("title")String title) throws Exception;
    //@Param("title") => 컬럼인 제목으로 검색하겠다는 설정

    public Notice read(Integer boardNo) throws Exception;

    public void update(Notice notice) throws Exception;

    public void delete(Integer boardNo) throws Exception;
}
