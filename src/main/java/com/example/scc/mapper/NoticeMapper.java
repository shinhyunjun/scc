package com.example.scc.mapper;

import com.example.scc.domain.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeMapper {

    public void create(Notice notice) throws Exception;

    public List<Notice> list() throws Exception;

    public List<Notice> search(@Param("title")String title) throws Exception;
    //@Param("title") => 컬럼인 제목으로 검색하겠다는 설정

}
