package com.example.scc.Controller;


import lombok.extern.java.Log;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Log
@Controller
public class LoginController {


    @RequestMapping("/login")
    @PreAuthorize("isAnonymous()")
    public String login(HttpServletRequest request, String error, String logout, Model model){
        String referer = request.getHeader("Referer");
        request.getSession().setAttribute("prevPage", referer);

        log.info("error" + error);
        log.info("logout" + logout);


        if (error != null) {
            model.addAttribute("error", 1);
        }

        if (logout != null) {
            model.addAttribute("logout", "Logout!!!!");
        }



        return "loginForm";
    }


}
