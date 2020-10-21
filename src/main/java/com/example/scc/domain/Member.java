package com.example.scc.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import java.util.Date;
import java.util.List;


@Getter
@Setter
@ToString

public class Member {

    private int user_no;

    @NotBlank
    private String user_id;

    @NotBlank
    private String user_password;

    @NotBlank
    private String user_name;
    private String user_phone;
    private String user_email;
    private String user_sex;
    private String user_birth;
    private Date user_date;
    private String user_age;
    private int gr_no;
    private char enabled;

    private List<MemberAuth> authList;
}
