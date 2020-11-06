package com.example.scc.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;
import java.util.Date;
import java.util.List;


@Getter
@Setter
@ToString

public class Member {

    private int user_no;

    @NotNull
    @Pattern(regexp = "\\S{3,9}", message = "ID는 3~9자로 입력해주세요.")
    private String user_id;

    @NotNull
    @Size(min=6, message = "비밀번호는 6자 이상으로 입력해주세요.")
    private String user_password;

    @NotEmpty(message = "이름을 입력해주세요")
    @Size(max = 10)
    private String user_name;

    @NotEmpty(message = "전화번호를 입력해주세요")
    @Size(max = 15)
    private String user_phone;

    @Email(message="이메일 형식이 아닙니다.")
    private String user_email;

    //셀렉트박스로 처리?
    @NotEmpty(message = "성별을 입력해주세요")
    private String user_sex;

    //셀렉트박스로 처리?
    @NotEmpty(message = "생년월일을 입력해주세요")
    private String user_birth;

    //셀렉트박스로 처리?
    @NotEmpty(message = "나이를 입력해주세요")
    private String user_age;

    private Date user_date;
    private int gr_no;
    private char enabled;

    private List<MemberAuth> authList;
}
