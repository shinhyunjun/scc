package com.example.scc.Controller;


import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.common.security.domain.Pagination;
import com.example.scc.domain.CodeLabelValue;
import com.example.scc.domain.Criteria;
import com.example.scc.domain.PageMaker;
import com.example.scc.domain.scc_pr;
import com.example.scc.service.sccprService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Log
@Controller
public class scc_pr_Controller {

    @Autowired
    private sccprService service;

    @RequestMapping(value = "/sccSearch", method = RequestMethod.GET)
    public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {


        model.addAttribute("sccPr", new scc_pr());

        // 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
        model.addAttribute("list", service.list(pageRequest));
        // 지역구 리스트
        model.addAttribute("list2", service.list2());

        // 페이징 네비게이션 정보를 뷰에 전달한다.
        Pagination pagination = new Pagination();
        pagination.setPageRequest(pageRequest);

        //페이지 네비게이션 정보에 검색처리된 게시글 건수를 저장한다.
        pagination.setTotalCount(service.count(pageRequest));

        model.addAttribute("pagination", pagination);
        model.addAttribute("pageRequest", pageRequest);

        // 검색유형의 코드명과 코드값을 정의한다.
        List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();

        searchTypeCodeValueList.add(new CodeLabelValue("t", "요양원명"));
        searchTypeCodeValueList.add(new CodeLabelValue("c", "지역구"));
        searchTypeCodeValueList.add(new CodeLabelValue("tc", "요양원명 또는 지역구"));
        model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);

    }



/* 하나로만 검색할때 예) 제목
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(String scc_name, Model model) throws Exception {

        scc_pr prpr = new scc_pr();
        prpr.setScc_name(scc_name);

        model.addAttribute("sccPr", prpr);

        model.addAttribute("list", service.search(scc_name));

        return "sccSearch";
    }

*/

    @RequestMapping(value = "/sccSearch_read", method = RequestMethod.GET)
    public String read(int scc_num, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {

        scc_pr scc_pr = service.read(scc_num);

        model.addAttribute(scc_pr);

        return "sccSearch_read";
    }

}
