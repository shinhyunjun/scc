package com.example.scc.Controller;


import lombok.extern.java.Log;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Log
@Controller
public class LoginController {

    @RequestMapping("/login")
    public String loginForm(String error, String logout, Model model){

        log.info("error" + error);
        log.info("logout" + logout);

        if(error != null) {
            model.addAttribute("error", "Login Error!!");
        }

        if(logout != null) {
            model.addAttribute("logout", "Logout!!!!");
        }

        return "loginForm";
    }


    @RequestMapping("/logout")
    public String logoutForm(){

        return "logoutForm";
    }

   /* @RequestMapping(value = "/findAccount")
    public void findAccount() throws Exception{


    }
    */

}
