package com.example.scc.Controller;


import com.example.scc.domain.scc_pr;
import com.example.scc.service.sccprService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class scc_pr_Controller {

    @Autowired
    private sccprService service;

    @RequestMapping(value = "/sccSearch", method = RequestMethod.GET)
    public void list(Model model) throws Exception {

        model.addAttribute("list", service.list());
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(String scc_name, Model model) throws Exception {

        scc_pr pr = new scc_pr();
        pr.setScc_name(scc_name);

        model.addAttribute("sibal", pr);

        model.addAttribute("list", service.search(scc_name));

        return "sccSearch";
    }
}
