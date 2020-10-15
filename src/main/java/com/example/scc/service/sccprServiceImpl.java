package com.example.scc.service;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Criteria;
import com.example.scc.domain.scc_pr;
import com.example.scc.mapper.scc_pr_mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class sccprServiceImpl implements sccprService{


    @Autowired
    private scc_pr_mapper mapper;

    // 페이징 요청 정보를 매개변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
    @Override
    public List<scc_pr> list(PageRequest pageRequest) throws Exception{
        return mapper.list(pageRequest);
    }

    // 검색처리된 게시글 전체 건수를 반환한다.
    @Override
    public int count(PageRequest pageRequest) throws Exception {
        return mapper.count(pageRequest);
    }


    @Override
    public List<scc_pr> search(String scc_name) throws Exception{
        return mapper.search(scc_name);
    }

    @Override
    public scc_pr read(int scc_num) throws Exception{
        return mapper.read(scc_num);
    }

    @Override
    public List<scc_pr> list2() throws Exception {
        return mapper.list2();
    }

}
