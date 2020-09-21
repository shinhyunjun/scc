package com.example.scc.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;


@Getter
@Setter
@ToString

public class Sign {

    private int user_no;
    private String user_id;
    private String user_password;
    private String user_name;
    private String user_phone;
    private String user_email;
    private String user_sex;
    private int user_birth;
    private Date user_date;
    private int user_age;
    private int gr_no;
}
