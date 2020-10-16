package com.example.scc.mapper;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Criteria;
import com.example.scc.domain.scc_pr;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface scc_pr_mapper {

    //페이징 요청 정보를 매개변수로 받아 페이징 처리를 한 게시글 목록을 반환
    public List<scc_pr> list(PageRequest pageRequest) throws Exception;

    public List<scc_pr> list2() throws Exception;

    //검색 처리된 게시글 전체 건수를 반환한다.
    public int count(PageRequest pageRequest) throws Exception;

   // public List<scc_pr> search(@Param("scc_district")String scc_district) throws Exception;

    public scc_pr read(int scc_num) throws Exception;


}
