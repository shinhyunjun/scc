package com.example.scc.service;

import com.example.scc.domain.Criteria;
import com.example.scc.domain.scc_pr;

import java.util.List;


public interface sccprService {

    public List<scc_pr> list(Criteria cri) throws Exception;
    public int listCount() throws Exception;

    //public List<scc_pr> search(String scc_name) throws Exception;

    public List<scc_pr> search(String scc_name) throws Exception;

    public scc_pr read(int scc_num) throws Exception;
}
