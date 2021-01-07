package com.example.scc.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class Comment {
    private int cno;
    private int bno;
    private String content;
    private String writer;
    private Date regdate;

}
