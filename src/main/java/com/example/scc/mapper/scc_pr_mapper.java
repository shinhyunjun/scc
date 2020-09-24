package com.example.scc.mapper;

import com.example.scc.domain.scc_pr;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface scc_pr_mapper {

    public List<scc_pr> list() throws Exception;

   // public List<scc_pr> search(@Param("scc_name")String scc_name) throws Exception;

    public List<scc_pr> search(@Param("scc_name")String scc_name) throws Exception;

}
