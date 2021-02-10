package com.example.scc.Controller;

import com.example.scc.domain.Member;
import com.example.scc.service.TestService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

@Controller
@RequestMapping("/test")
public class TestController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private TestService service;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerForm(Member member, Model model) throws Exception{
        model.addAttribute("member", member);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Member member, Model model, RedirectAttributes rttr) throws Exception{
        String inputPassword = member.getUser_password();
        member.setUser_password(passwordEncoder.encode(inputPassword));

        MultipartFile pictureFile = member.getPicture();
        String createdPictureFilename = uploadFile(pictureFile.getOriginalFilename(),
                pictureFile.getBytes());
        member.setPicture_url(createdPictureFilename);


        service.register(member);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/";

    }

    @RequestMapping(value = "/register2", method = RequestMethod.GET)
    public void registerForm2(Member member, Model model) throws Exception{
        model.addAttribute("member", member);
    }

    @RequestMapping(value = "/register2", method = RequestMethod.POST)
    public String register2(Member member, Model model, RedirectAttributes rttr) throws Exception{
        String inputPassword = member.getUser_password();
        member.setUser_password(passwordEncoder.encode(inputPassword));

        MultipartFile pictureFile = member.getPicture();
        String createdPictureFilename = uploadFile(pictureFile.getOriginalFilename(),
                pictureFile.getBytes());
        member.setPicture_url(createdPictureFilename);


        service.register(member);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/";

    }
    @RequestMapping(value = "/register3", method = RequestMethod.GET)
    public void registerForm3(Member member, Model model) throws Exception{
        model.addAttribute("member", member);
    }

    @RequestMapping(value = "/register3", method = RequestMethod.POST)
    public String register3(Member member, Model model, RedirectAttributes rttr) throws Exception{
        String inputPassword = member.getUser_password();
        member.setUser_password(passwordEncoder.encode(inputPassword));

        MultipartFile pictureFile = member.getPicture();
        String createdPictureFilename = uploadFile(pictureFile.getOriginalFilename(),
                pictureFile.getBytes());
        member.setPicture_url(createdPictureFilename);


        service.register(member);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/";

    }

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(int user_no, Model model) throws Exception {
        model.addAttribute(service.read(user_no));
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyForm(int user_no, Model model) throws Exception {
        Member member = service.read(user_no);
        model.addAttribute(member);
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Member member, RedirectAttributes rttr) throws Exception {
        MultipartFile pictureFile = member.getPicture();

        if(pictureFile != null && pictureFile.getSize() > 0) {
            String createdFilename = uploadFile(pictureFile.getOriginalFilename(),
                    pictureFile.getBytes());

            member.setPicture_url(createdFilename);
        }

        service.modify(member);

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/";
    }

    private String uploadFile(String originalName, byte[] fileData) throws Exception{
        UUID uid = UUID.randomUUID();

        String createdFileName = uid.toString() + "_" + originalName;

        File target = new File(uploadPath, createdFileName);
        FileCopyUtils.copy(fileData, target);

        return createdFileName;
    }

    private MediaType getMediaType(String formatName) {
        if(formatName != null) {
            if (formatName.equals("JPG")) {
                return MediaType.IMAGE_JPEG;
            }
            if (formatName.equals("GIF")) {
                return MediaType.IMAGE_GIF;
            }
            if(formatName.equals("PNG")) {
                return MediaType.IMAGE_PNG;
            }
        }
        return null;
    }

    @ResponseBody
    @RequestMapping("/picture")
    public ResponseEntity<byte[]> pictureFile(int user_no) throws Exception{
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;

        String fileName = service.getPicture(user_no);

        try {
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

            MediaType mType = getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();

            in = new FileInputStream(uploadPath + File.separator + fileName);

            if( mType != null) {
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
}
