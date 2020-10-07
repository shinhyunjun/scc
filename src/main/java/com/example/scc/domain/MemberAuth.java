package com.example.scc.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberAuth {
    private int user_no;
    private String auth;
}
