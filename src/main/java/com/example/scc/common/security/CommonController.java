package com.example.mb.common.security;

import lombok.extern.java.Log;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Log
@Controller
public class CommonController {

    @RequestMapping("/accessError")
    public void accessDenied(Authentication auth, Model model){

        log.info("access Denied :" + auth);

        model.addAttribute("msg", "Access Denied");
    }
}