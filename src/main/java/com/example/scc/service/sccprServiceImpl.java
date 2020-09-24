package com.example.scc.service;

import com.example.scc.domain.scc_pr;
import com.example.scc.mapper.scc_pr_mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class sccprServiceImpl implements sccprService{


    @Autowired
    private scc_pr_mapper mapper;

    @Override
    public List<scc_pr> list() throws Exception{
        return mapper.list();
    }

    @Override
    public List<scc_pr> search(String scc_name) throws Exception{
        return mapper.search(scc_name);
    }

}
