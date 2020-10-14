package com.example.scc.Controller;

import com.example.scc.common.security.domain.CustomUser;
import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.common.security.domain.Pagination;
import com.example.scc.domain.*;
import com.example.scc.service.NoticeService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Log
@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService service;

    //페이징 요청 정보를 매개변수로 받고 다시 뷰에 전달한다.
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception{

        // 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
        model.addAttribute("list",service.list(pageRequest));

        // 페이징 네비게이션 정보를 뷰에 전달한다.
        Pagination pagination = new Pagination();
        pagination.setPageRequest(pageRequest);

        //페이지 네비게이션 정보에 검색처리된 게시글 건수를 저장한다.
        pagination.setTotalCount(service.count(pageRequest));

        model.addAttribute("pagination", pagination);
        model.addAttribute("pageRequest", pageRequest);

        // 검색유형의 코드명과 코드값을 정의한다.
        List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();

        searchTypeCodeValueList.add(new CodeLabelValue("t", "Title"));
        searchTypeCodeValueList.add(new CodeLabelValue("c", "Content"));
        searchTypeCodeValueList.add(new CodeLabelValue("tc", "Title OR Content"));

        model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
    }


    @PreAuthorize("hasRole('ROLE_ADMIN')") // 관리자 권한을 가진 사용자만 접근이 가능
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Notice notice, RedirectAttributes rttr) throws Exception {

        service.register(notice);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/notice/list";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')") // 관리자 권한을 가진 사용자만 접근이 가능
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerForm(Model model, Authentication authentication) throws Exception {

        CustomUser customUser = (CustomUser) authentication.getPrincipal();
        Member member = customUser.getMember();
        Notice notice = new Notice();

        notice.setWriter(member.getUser_id());   // 등록 시 id를 미리 입력해 준다.

        model.addAttribute(notice);
    }

/*
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(String title, Model model) throws Exception {

        Notice notice = new Notice();
        notice.setTitle(title);

        model.addAttribute("notice", notice);

        model.addAttribute("list", service.search(title));

        return "notice/list";
    }
*/

    @RequestMapping(value = "/read", method=RequestMethod.GET)
    public void read(@RequestParam("boardNo") int boardNo, Model model) throws Exception{

        model.addAttribute(service.read(boardNo));
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')") // 관리자 권한을 가진 사용자만 접근이 가능
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(int boardNo, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {

        service.remove(boardNo);


        //RedirectAttributes 객체에 일회성 데이터를 지정한여 전달한다.
        rttr.addAttribute("page", pageRequest.getPage());
        rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());

        // 검색유형과 검색어를 뷰에 전달한다.
        rttr.addAttribute("searchType", pageRequest.getSearchType());
        rttr.addAttribute("keyword", pageRequest.getKeyword());

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/notice/list";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')") // 관리자 권한을 가진 사용자만 접근이 가능
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyForm(int boardNo, Model model) throws Exception {
        model.addAttribute(service.read(boardNo));
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')") // 관리자 권한을 가진 사용자만 접근이 가능
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Notice notice,  PageRequest pageRequest, RedirectAttributes rttr) throws Exception {

        service.modify(notice);

        // RedirectAttributes 객체에 일회성 데이터를 지정하면 전달한다.
        rttr.addAttribute("page", pageRequest.getPage());
        rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());

        // 검색유형과 검색어를 뷰에 전달한다.
        rttr.addAttribute("searchType", pageRequest.getSearchType());
        rttr.addAttribute("keyword", pageRequest.getKeyword());

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/notice/list";
    }
}
