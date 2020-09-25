package com.example.scc.common.security;

import lombok.extern.java.Log;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {


    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
        log.info("onAuthenticationSuccess");

        org.springframework.security.core.userdetails.User customUser = (User) auth.getPrincipal();

        log.info("username = " + customUser.getUsername());

        super.onAuthenticationSuccess(request, response, auth);
    }

}
