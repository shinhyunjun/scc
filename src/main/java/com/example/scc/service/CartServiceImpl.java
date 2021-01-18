package com.example.scc.service;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.cart;
import com.example.scc.mapper.CartMapper;
import com.example.scc.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService{

    @Autowired
    private CartMapper mapper;

    @Override
    public void addCart(cart cart) throws Exception{
        mapper.addCart(cart);
    }

    @Override
    public List<cart> list(PageRequest pageRequest, int userNo) throws Exception{
       return mapper.list(pageRequest, userNo);
    }

    @Override
    public void deleteCart(cart cart) throws Exception{
        mapper.deleteCart(cart);
    }

    @Override
    public int delete(cart cart) throws Exception{
        return mapper.delete(cart);
    }

    @Override
    public int countNum(cart cart) throws Exception{
        return mapper.countNum(cart);
    }
}
