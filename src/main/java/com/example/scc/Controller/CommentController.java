package com.example.scc.Controller;

import com.example.scc.common.security.domain.CustomUser;
import com.example.scc.domain.Comment;
import com.example.scc.domain.Member;
import com.example.scc.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentService service;

    //댓글 리스트
    @RequestMapping("/list")
    @ResponseBody
    private List<Comment> mCommentServiceList(int bno, Model model) throws Exception {

        return service.commentList(bno);
    }


    @RequestMapping("/insert")
    @ResponseBody
    private int insert(@RequestParam int bno, @RequestParam String content, Authentication authentication) throws Exception {
        Comment comment = new Comment();
        comment.setBno(bno);
        comment.setContent(content);
        //사용자의 권한을 보내준다
        CustomUser customUser = (CustomUser) authentication.getPrincipal();
        Member member = customUser.getMember();
        comment.setWriter(member.getUser_id());
        //comment.setUserNo(member.getUser_no());
        //comment.setWriter("user");

        return service.commentInsert(comment);
    }

    @RequestMapping("/update")
    @ResponseBody
    private int update(@RequestParam int cno, @RequestParam String content) throws Exception {
        Comment comment = new Comment();
        comment.setCno(cno);
        comment.setContent(content);

        return service.commentUpdate(comment);
    }

    @RequestMapping("/delete/{cno}")
    @ResponseBody
    private int delete(@PathVariable int cno) throws Exception {
        return service.commentDelete(cno);
    }
}
