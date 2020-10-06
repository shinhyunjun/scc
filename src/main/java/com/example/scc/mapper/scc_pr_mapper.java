package com.example.scc.mapper;

import com.example.scc.domain.Criteria;
import com.example.scc.domain.scc_pr;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface scc_pr_mapper {

    public List<scc_pr> list(Criteria cri) throws Exception;
    public int listCount() throws Exception;

   // public List<scc_pr> search(@Param("scc_name")String scc_name) throws Exception;

    public List<scc_pr> search(@Param("scc_name")String scc_name) throws Exception;

    public scc_pr read(int scc_num) throws Exception;

}
