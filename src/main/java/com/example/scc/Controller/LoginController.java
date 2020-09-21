package com.example.scc.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @RequestMapping("/login")    //url을 컨트롤러의 메서드와 매핑할때 사용
    public String login(Model model){

        //model 객체를 이용하여 view로 데이터 전달
        model.addAttribute("login","mlogin");
        return "login";  //view 파일 리턴
    }
}
