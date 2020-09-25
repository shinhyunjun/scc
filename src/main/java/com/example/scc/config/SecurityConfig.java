package com.example.scc.config;

import com.example.scc.common.security.CustomLoginSuccessHandler;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.sql.DataSource;

@Log
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;


    @Override
    protected void configure(HttpSecurity http) throws Exception{

        log.info("security config...");

        http.authorizeRequests().antMatchers("/notice/list").permitAll();
        http.authorizeRequests().antMatchers("/notice/register").hasRole("ADMIN");

        http.formLogin().loginPage("/login").successHandler(createAuthenticationSuccessHandler());

        http.logout().logoutUrl("/logout").invalidateHttpSession(true);

     //   http.exceptionHandling().accessDeniedPage("/accessError");
    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception{

        // 스프링 시큐리티가 원하는 결과를 반환하는 쿼리를 작성한다.
        String query1 = "SELECT user_id , user_password, enabled FROM member WHERE user_id = ?";
        String query2 ="SELECT b.user_id, a.auth FROM member_auth2 a, member b WHERE a.user_no = b.user_no AND b.user_id = ?";




        auth.jdbcAuthentication()
                .dataSource(dataSource)

                .usersByUsernameQuery(query1)
                .authoritiesByUsernameQuery(query2);  //작성한 쿼리를 지정한다.

    }




    //CustomLoginSuccessHandler를 빈으로 등록한다.
    @Bean
    public AuthenticationSuccessHandler createAuthenticationSuccessHandler(){
        return new CustomLoginSuccessHandler();
    }


    @Bean
    public PasswordEncoder noOpPasswordEncoder(){
        return NoOpPasswordEncoder.getInstance();
    }
}
