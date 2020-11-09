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
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
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


    @RequestMapping(value = "/idcheck", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> idcheck(@RequestBody String user_id) throws Exception {

        System.out.println("중복확인 요청된 아이디 : " + user_id);

        Map<String, Object> data = new HashMap<>();

        int result = service.idcheck(user_id);

        if(result == 0){
            System.out.println("아이디 사용가능");
            data.put("confirm","ok");
        }
        else{
            System.out.println("사용 불가");
            data.put("confirm","no");
        }

        return data;
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

    @RequestMapping("/findAccount")
    public String findAccount(Member member, Model model) throws Exception {

        System.out.println(member);
        model.addAttribute("member", service.findPwd(member));
        service.modifyUser(member);

        Member user = null;
        user = service.findPwd(member);
        System.out.println(member);
        System.out.println(user);

        if (user == null) {
            model.addAttribute("msg", "아이디나 이메일이 일치하는 사용자가 없습니다.");
            return "user/findAccount";
        }
        else {
            String pwd = user.getUser_password();
            String email = user.getUser_email();
            service.sendMail(pwd, email);
            return "user/findAccount";
        }
    }
}
