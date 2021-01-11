package com.example.scc.Controller;

import com.example.scc.common.security.domain.CustomUser;
import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.common.security.domain.Pagination;
import com.example.scc.domain.CodeLabelValue;
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
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
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
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.ExecutionException;

//commit 확인
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

    //마이페이지
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {

        model.addAttribute("list", service.list(pageRequest));

        Pagination pagination = new Pagination();
        pagination.setPageRequest(pageRequest);

        pagination.setTotalCount(service.count(pageRequest));

        model.addAttribute("pagination", pagination);
        model.addAttribute("pageRequest", pageRequest);

        List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
        searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
        searchTypeCodeValueList.add(new CodeLabelValue("name", "이름"));
        searchTypeCodeValueList.add(new CodeLabelValue("id", "아이디"));
        searchTypeCodeValueList.add(new CodeLabelValue("age", "나이"));

        model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
    }

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    public void read(int user_no, Model model) throws Exception {
        model.addAttribute(service.read(user_no));

    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    public void modifyForm(int user_no, Model model) throws Exception {

        model.addAttribute(service.read(user_no));

    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    public String modify(Member member, RedirectAttributes rttr) throws Exception {
        String inputPassword = member.getUser_password();
        member.setUser_password(passwordEncoder.encode(inputPassword));


        MultipartFile pictureFile = member.getPicture();

        if (pictureFile != null && pictureFile.getSize() > 0) {
            String createdFilename = uploadFile(pictureFile.getOriginalFilename(), pictureFile.getBytes());

            member.setPicture_url(createdFilename);
        }

        service.modify(member);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/user/read?user_no=" + member.getUser_no();
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    public String remove(int user_no, RedirectAttributes rttr) throws Exception {
        service.remove(user_no);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/user/list";

    }

    @RequestMapping(value = "/adminSetup", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String adminSetup() throws Exception {
        return "user/adminSetup";
    }


    @RequestMapping(value = "/setup", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_MEMBER')")
    public String setup(Model model, Authentication authentication) throws Exception {

        CustomUser customUser = (CustomUser) authentication.getPrincipal();
        Member member = customUser.getMember();

        model.addAttribute("member", member);
        
        return "user/setup";
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
    public void findAccount(Model model, Member member) throws Exception {

        model.addAttribute("member", member);

    }


    @RequestMapping(value = "/findId", method = RequestMethod.POST)
    public String findAccount2(String user_name, String user_email, Model model) throws Exception {

        Member member = service.getMemberByNameAndEmail(user_name, user_email);

        if (member == null) {
            model.addAttribute("historyBack", true);
            model.addAttribute("msg", "해당 회원이 존재하지 않습니다.");
            return "common/redirect";
        }

        model.addAttribute("historyBack", true);
        model.addAttribute("msg", String.format("해당 회원의 아이디는 %s입니다.", member.getUser_id()));


        return "user/findIdOk";

    }


    @RequestMapping(value = "/findPwd", method = RequestMethod.GET)
    public void findAccount3(Model model, Member member) throws Exception {

        model.addAttribute("member", member);
    }

    @RequestMapping(value = "/findPwd", method = RequestMethod.POST)
    public String findAccount4(Model model, String user_id, String user_email) throws Exception {


        Member member = service.getMemberByIdAndEmail(user_id, user_email);

        //String user_password = "111";
        String user_password = getTempPassword();  //무작위 비밀번호 생성

        member.setUser_password(passwordEncoder.encode(user_password));

        service.modifyPwd(member);


        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

            messageHelper.setSubject(user_id + "님 비밀번호 찾기 메일입니다.");
            messageHelper.setText("비밀번호는 " + user_password + " 입니다.");
            messageHelper.setTo(user_email);
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(user_email));
            mailSender.send(msg);

        } catch (MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }

        // mv.setViewName("user/emailSuccess");
        // return mv;
        model.addAttribute("msg", "이메일이 정상적으로 발송되었습니다");
        return "user/emailSuccess";

    }

    public String getTempPassword() {
        char[] charSet = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

        String str = "";

        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }


    @RequestMapping(value = "/modifyPwd", method = RequestMethod.POST)
    public void modifyPwd(Model model, Member member) throws Exception {


    }

    @RequestMapping(value = "/modifyPwd", method = RequestMethod.GET)
    public String modifyPwd2(Model model, Member member) throws Exception {

        return "user/modifyPwd";
    }
}