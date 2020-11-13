package com.example.scc.Controller;

import com.example.scc.domain.Member;
import com.example.scc.service.MemberService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutionException;


@Controller
@RequestMapping("/user")
public class MemberController {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private MemberService service;

    @Value("${upload.path}")
    private String uploadPath;

    // 스프링 시큐리티의 비밀번호 암호화 처리기
    @Autowired
    private PasswordEncoder passwordEncoder;



    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerForm(Member member, Model model) throws Exception {
        model.addAttribute("member", member);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Validated Member member, BindingResult result, Model model, RedirectAttributes rttr) throws Exception {
        if (result.hasErrors()) {
            return "user/register";
        }

        // 비밀번호 암호화
        String inputPassword = member.getUser_password();
        member.setUser_password(passwordEncoder.encode(inputPassword));

        //  service.register(member);

        rttr.addFlashAttribute("userName", member.getUser_name());


        //사진 url
        MultipartFile pictureFile = member.getPicture();

        String createdPictureFilename = uploadFile(pictureFile.getOriginalFilename(), pictureFile.getBytes());

        member.setPicture_url(createdPictureFilename);


        service.register(member);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/";
    }


    @ResponseBody
    @RequestMapping(value = "/idCheck")
    public int postIdCheck(HttpServletRequest req) throws Exception {

        String user_id = req.getParameter("user_id");
        Member idCheck = service.idCheck(user_id);

        int result = 0;

        if (idCheck != null) {
            result = 1;
        }
        return result;
    }


    private String uploadFile(String originalName, byte[] fileData) throws Exception {
        UUID uid = UUID.randomUUID();

        String createdFileName = uid.toString() + "_" + originalName;

        File target = new File(uploadPath, createdFileName);

        FileCopyUtils.copy(fileData, target);

        return createdFileName;
    }


    //이미지 형식 확인
    private MediaType getMediaType(String formatName) {
        if (formatName != null) {
            if (formatName.equals("JPG")) {
                return MediaType.IMAGE_JPEG;
            }

            if (formatName.equals("GIF")) {
                return MediaType.IMAGE_GIF;
            }

            if (formatName.equals("PNG")) {
                return MediaType.IMAGE_PNG;
            }
        }

        return null;
    }

    //원본 이미지 표시
    @ResponseBody
    @RequestMapping("/picture")
    public ResponseEntity<byte[]> pictureFile(Integer user_no) throws Exception {

        InputStream in = null;
        ResponseEntity<byte[]> entity = null;

        String fileName = service.getPicture(user_no);

        try {
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

            MediaType mType = getMediaType(formatName);

            HttpHeaders headers = new HttpHeaders();

            in = new FileInputStream(uploadPath + File.separator + fileName);

            if (mType != null) {
                headers.setContentType(mType);
            }

            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close();
        }
        return entity;
    }



    @RequestMapping(value = "/findId", method = RequestMethod.GET)
    public void findAccount(Model model,Member member) throws Exception {

          model.addAttribute("member",member);

    }


    @RequestMapping(value = "/findId", method = RequestMethod.POST)
    public String findAccount2(String user_name, String user_email, Model model) throws Exception {

       Member member =  service.getMemberByNameAndEmail(user_name,user_email);

       if(member == null){
            model.addAttribute("historyBack",true);
           model.addAttribute("msg","해당 회원이 존재하지 않습니다.");
           return "common/redirect";
       }

        model.addAttribute("historyBack",true);
        model.addAttribute("msg",String.format("해당 회원의 아이디는 %s입니다.",member.getUser_id()));


        return "user/findIdOk";

    }


    @RequestMapping(value = "/findPwd", method = RequestMethod.GET)
    public void emailPage(Model model, Member member) throws Exception {

        model.addAttribute("member",member);
    }

    @RequestMapping(value="/findPwd", method= RequestMethod.POST)
    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv) throws Exception {

        String user_id = (String) paramMap.get("user_id");
        String user_email = (String) paramMap.get("user_email");
        String user_password = "1111111111";

        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

            messageHelper.setSubject(user_id+"님 비밀번호 찾기 메일입니다.");
            messageHelper.setText("비밀번호는 "+user_password+" 입니다.");
            messageHelper.setTo(user_email);
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(user_email));
            mailSender.send(msg);

        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }

        mv.setViewName("user/emailSuccess");
        return mv;
    }




/*
    @RequestMapping(value = "/findPwd")
    public String emailPage() {

        return "user/findPwd";
    }

    @RequestMapping(value="/searchPw.do", method= RequestMethod.GET)
    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv) throws Exception {

        String user_id = (String) paramMap.get("user_id");
        String user_email = (String) paramMap.get("user_email");
        String user_password = "1111111111";

        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

            messageHelper.setSubject(user_id+"님 비밀번호 찾기 메일입니다.");
            messageHelper.setText("비밀번호는 "+user_password+" 입니다.");
            messageHelper.setTo(user_email);
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(user_email));
            mailSender.send(msg);

        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }

        mv.setViewName("user/emailSuccess");
        return mv;
    }

 */
}