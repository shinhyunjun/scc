package com.example.scc.common;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

    @RequestMapping("/accessError")
    public void accessDenied(Authentication authentication, Model model) {
        model.addAttribute("msg", "접근이 거부되었습니다.");
    }
}
