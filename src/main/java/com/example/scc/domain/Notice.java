package com.example.scc.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


import java.util.Date;

@Getter
@Setter
@ToString
public class Notice {

    private int boardNo;


    private String title;


    private String content;
    private String writer;

    private Date regDate;

    private String[] files;

    private Integer viewCnt;
}
