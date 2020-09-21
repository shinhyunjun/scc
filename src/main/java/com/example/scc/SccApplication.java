package com.example.scc;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.example.scc.mapper")

public class SccApplication {

    public static void main(String[] args) {
        SpringApplication.run(SccApplication.class, args);
    }

}
