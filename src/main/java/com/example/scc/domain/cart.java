package com.example.scc.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class cart {

    private int cartNum;
    private int userNo;
    private int sccNum;

    private String scc_name;
    private String scc_address;
    private String scc_grade;

}
