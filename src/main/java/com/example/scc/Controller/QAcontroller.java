package com.example.scc.Controller;

import com.example.scc.service.sccprService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QAcontroller {

    @RequestMapping("/qa")
    public String qa(Model model) {

        model.addAttribute("qa", "qa");
        return "q&a";
    }
}
