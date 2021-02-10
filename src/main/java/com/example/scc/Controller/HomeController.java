package com.example.scc.Controller;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.scc_pr;
import com.example.scc.service.sccprService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    @Autowired
    private sccprService service;


    @RequestMapping("/")
    public String home(Model model, @ModelAttribute("pgrq") PageRequest pageRequest) {

        model.addAttribute("home", "main");
        return "home";
    }


}
