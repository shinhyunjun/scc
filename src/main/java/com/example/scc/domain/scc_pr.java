package com.example.scc.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class scc_pr {

    private int scc_num;
    private String scc_name;
    private String scc_address;
    private String scc_grade;
    private int wait_num;
    private String scc_phone;
    private int limit_num;
    private String scc_type;
    private String scc_district;   //지역구
    private String detail_info;
    private int remaind_num;
    private int state_num;

    private int cnt;
}
