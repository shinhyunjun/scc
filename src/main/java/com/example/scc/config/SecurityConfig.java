package com.example.scc.config;

import com.example.scc.common.security.CustomAccessDeniedHandler;
import com.example.scc.common.security.CustomLoginSuccessHandler;
import com.example.scc.common.security.CustomUserDetailsService;
import com.example.scc.common.security.LoginSuccessHandler;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@Log
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true) //시큐리티 애너테이션  활성화
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;


    @Override
    protected void configure(HttpSecurity http) throws Exception {


        //  http.authorizeRequests().antMatchers("/notice/list").permitAll();
        // http.authorizeRequests().antMatchers("/notice/register").hasRole("ADMIN");

        /* original
        http.formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login")
                //CustomLoginSuccessHandler를 로그인 성공 처리자로 지정한다.
                .successHandler(createAuthenticationSuccessHandler());

         */
        // 로그인시 원래 페이지로 돌아가기
        http.formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .successHandler(new LoginSuccessHandler("/"));


        http.logout()
                .logoutUrl("/logout")
                .invalidateHttpSession(true)
                //로그아웃을 하면 자동 로그인에 사용하는 쿠키도 삭제해 주도록 한다.
                .deleteCookies("remember-me", "JSESSION_ID");


        http.exceptionHandling()
                //CustomAccessDeniedHandler를 접근 거부 처리자로 지정한다.
                .accessDeniedHandler(createAccessDeniedHandler());

        //데이터 소스를 지정하고 테이블을 이용해서 기존 로그인 정보 기록
        http.rememberMe()
                .key("hdcd")
                .tokenRepository(createJDBCRepository())
                .tokenValiditySeconds(60 * 60 * 24); //쿠키의 유효 시간 지정
    }

/*
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception{

       // jdbc 스프링 시큐리티가 원하는 결과를 반환하는 쿼리를 작성한다.
        String query1 = "SELECT user_id , user_password, enabled FROM member WHERE user_id = ?";
        String query2 ="SELECT b.user_id, a.auth FROM member_auth2 a, member b WHERE a.user_no = b.user_no AND b.user_id = ?";

        auth.jdbcAuthentication()
                .dataSource(dataSource)

                .usersByUsernameQuery(query1) //jdbc
                .authoritiesByUsernameQuery(query2);  //작성한 쿼리를 지정한다.

    }*/

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(createUserDetailsService())
                .passwordEncoder(createPasswordEncoder());
    }


    @Bean
    public PasswordEncoder createPasswordEncoder() {

        return new BCryptPasswordEncoder();
    }


    // CustomLoginSuccessHandler를 빈으로 등록한다.
    @Bean
    public AuthenticationSuccessHandler createAuthenticationSuccessHandler() {
        return new CustomLoginSuccessHandler();
    }

    @Bean
    public UserDetailsService createUserDetailsService() {
        return new CustomUserDetailsService();
    }

    @Bean
    public AccessDeniedHandler createAccessDeniedHandler() {
        return new CustomAccessDeniedHandler();
    }


    private PersistentTokenRepository createJDBCRepository() {
        JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
        repo.setDataSource(dataSource);

        return repo;
    }

/*
    @Bean
    public PasswordEncoder noOpPasswordEncoder(){
        return NoOpPasswordEncoder.getInstance();
    }    */
}
