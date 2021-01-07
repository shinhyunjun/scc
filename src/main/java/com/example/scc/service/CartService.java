package com.example.scc.service;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.cart;
import com.example.scc.domain.scc_pr;

import java.util.List;

public interface CartService {

    public void addCart(cart cart) throws Exception;

    // 페이징요청 정보를 매개변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
    public List<cart> list(PageRequest pageRequest, int userNo) throws Exception;

    public void deleteCart(cart cart) throws Exception;


}
