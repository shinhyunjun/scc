package com.example.scc.Controller;


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

    @RequestMapping(value = "/scc_pr", method = RequestMethod.GET)
    public void list(Model model) throws Exception {

        model.addAttribute("list", service.list());
    }
}
