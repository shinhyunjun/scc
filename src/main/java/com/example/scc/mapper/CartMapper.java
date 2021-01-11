package com.example.scc.mapper;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.cart;

import java.util.List;

public interface CartMapper {

    public void addCart(cart cart) throws Exception;

    public List<cart> list(PageRequest pageRequest, int userNo) throws Exception;

    public void deleteCart(cart cart) throws Exception;
}
