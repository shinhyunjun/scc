package com.example.scc.Controller;


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

@Log
@Controller
public class scc_pr_Controller {

    @Autowired
    private sccprService service;

    @RequestMapping(value = "/sccSearch", method = RequestMethod.GET)
    public void list(Model model, Criteria cri) throws Exception {

        log.info("list : access to all");
        model.addAttribute("sccPr", new scc_pr());

        model.addAttribute("list", service.list(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.listCount());

        model.addAttribute("pageMaker", pageMaker);
    }



    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(String scc_name, Model model) throws Exception {

        scc_pr prpr = new scc_pr();
        prpr.setScc_name(scc_name);

        model.addAttribute("sccPr", prpr);

        model.addAttribute("list", service.search(scc_name));

        return "sccSearch";
    }

    @RequestMapping(value = "/sccSearch_read", method = RequestMethod.GET)
    public String read(int scc_num, Model model) throws Exception {
        scc_pr scc_pr = service.read(scc_num);

        model.addAttribute(scc_pr);

        return "sccSearch_read";
    }

}
