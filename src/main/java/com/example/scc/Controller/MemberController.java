package com.example.scc.Controller;

import com.example.scc.domain.Member;
import com.example.scc.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class MemberController {

    @Autowired
    private MemberService service;

    // 스프링 시큐리티의 비밀번호 암호화 처리기기
    @Autowired
    private PasswordEncoder passwordEncoder;


    @RequestMapping(value = "/register", method= RequestMethod.GET)
    public void registerForm(Member member, Model model) throws Exception{

    }

    @RequestMapping(value = "/register", method= RequestMethod.POST)
    public String register(@Validated Member member, BindingResult result,  Model model, RedirectAttributes rttr) throws Exception{

        // 비밀번호 암호화
        String inputPassword = member.getUser_password();
        member.setUser_password(passwordEncoder.encode(inputPassword));

        service.register(member);

        rttr.addFlashAttribute("userName", member.getUser_name());
        return "redirect:/user/success";
    }

    //등록 성공 화면
    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public void registerSuccess(Model model) throws Exception {

    }
}
