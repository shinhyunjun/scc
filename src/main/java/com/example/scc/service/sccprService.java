package com.example.scc.service;

import com.example.scc.domain.scc_pr;

import java.util.List;


public interface sccprService {

    public List<scc_pr> list() throws Exception;

    //public List<scc_pr> search(String scc_name) throws Exception;

    public List<scc_pr> search(String scc_address) throws Exception;
}
