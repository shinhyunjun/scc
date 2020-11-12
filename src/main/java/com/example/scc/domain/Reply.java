package com.example.scc.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class Reply {

    private int scc_num;

    private int rno;
    private String content;
    private String writer;
    private Date regDate;
    private int rating;

}
