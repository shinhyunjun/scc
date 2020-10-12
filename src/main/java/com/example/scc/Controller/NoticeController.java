package com.example.scc.Controller;

import com.example.scc.domain.Criteria;
import com.example.scc.domain.Notice;
import com.example.scc.domain.PageMaker;
import com.example.scc.service.NoticeService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Log
@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService service;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void list(Model model, Criteria cri) throws Exception{

        model.addAttribute("notice", new Notice());

        model.addAttribute("list",service.list(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.listCount());

        model.addAttribute("pageMaker", pageMaker);
    }


    @PreAuthorize("hasRole('ROLE_ADMIN')") // 관리자 권한을 가진 사용자만 접근이 가능
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Notice notice, Model model) throws Exception {
        service.register(notice);

        model.addAttribute("msg", "등록이 완료되었습니다.");

        return "notice/success";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')") // 관리자 권한을 가진 사용자만 접근이 가능
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerForm(Notice notice, Model model) throws Exception {

        log.info("list : access to all");
    }


    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(String title, Model model) throws Exception {

        Notice notice = new Notice();
        notice.setTitle(title);

        model.addAttribute("notice", notice);

        model.addAttribute("list", service.search(title));

        return "notice/list";
    }

    @RequestMapping(value = "/read", method=RequestMethod.GET)
    public void read(@RequestParam("boardNo") int boardNo, Model model) throws Exception{

        model.addAttribute(service.read(boardNo));
    }
}
