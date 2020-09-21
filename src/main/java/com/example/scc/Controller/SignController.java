package com.example.scc.Controller;

import com.example.scc.domain.Sign;
import com.example.scc.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sign")
public class SignController {

    @Autowired
    private SignService service;

    @RequestMapping(value = "/sign", method= RequestMethod.GET)
    public void registerForm(Sign sign, Model model) throws Exception{

    }

    @RequestMapping(value = "/sign", method= RequestMethod.POST)
    public String register(Sign sign, Model model) throws Exception{

        service.register(sign);

        model.addAttribute("msg","가입이 완료되었습니다");

        return "sign/sign";
    }
}
