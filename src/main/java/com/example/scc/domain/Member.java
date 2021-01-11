package com.example.scc.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;
import java.util.Date;
import java.util.List;


@Getter
@Setter
@ToString
public class Member {

    private int user_no;

    @NotNull
    private String user_id;

    private String user_password;

    private String user_name;

    private String user_phone;

    private String user_email;

    private String user_sex;

    private String user_birth;

    private String user_age;

    private Date user_date;
    private int gr_no;
    private char enabled;

    //이미지 파일
    private MultipartFile picture;
    //이미지 경로
    private String picture_url;

    private List<MemberAuth> authList;
}
