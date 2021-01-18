package com.example.scc.Controller;

import com.example.scc.common.security.domain.CustomUser;
import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.common.security.domain.Pagination;
import com.example.scc.domain.*;
import com.example.scc.service.CartService;
import com.example.scc.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService service;

    @ResponseBody
    @RequestMapping(value = "/insert")
    public void addCart(int sccNum,cart cart, Authentication authentication) throws Exception{

        CustomUser customUser = (CustomUser) authentication.getPrincipal();
        Member member = customUser.getMember();

        cart.setUserNo(member.getUser_no());

        service.addCart(cart);
    }

    @PreAuthorize("hasRole('ROLE_MEMBER')")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void list(@ModelAttribute("pgrq") PageRequest pageRequest,Model model, Authentication authentication) throws Exception {


        CustomUser customUser = (CustomUser) authentication.getPrincipal();
        Member member = customUser.getMember();

        int userNo = member.getUser_no();

        List<cart> cartList = service.list(pageRequest, userNo);

        model.addAttribute("cartList",cartList);

    }

    // 카트 삭제
    @ResponseBody
    @RequestMapping(value = "/deleteCart")
    public int deleteCart(@RequestParam(value = "chBox[]") List<String> chArr, Authentication authentication, cart cart) throws Exception {

        CustomUser customUser = (CustomUser) authentication.getPrincipal();
        Member member = customUser.getMember();

        int userNo = member.getUser_no();

        int result = 0;
        int cartNum = 0;


        if(member != null) {
            cart.setUserNo(userNo);   // 사용자 정보 담기

            for(String i : chArr) {
                cartNum = Integer.parseInt(i);
                cart.setCartNum(cartNum);   // 카드 번호 담기
                service.deleteCart(cart);
            }

            result = 1;
        }
        return result;
    }

    /*
    // 카트 삭제
    @ResponseBody
    @RequestMapping(value = "/deleteCart", method =RequestMethod.GET)
    public void deleteCart2(Authentication authentication,
                          @RequestParam(value = "chbox[]") List<String> chArr, cart cart) throws Exception {


    }
*/

    /*
    @ResponseBody
    @RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
    public void deleteCart2(Authentication authentication,
                            @RequestParam(value = "chbox[]") List<String> chArr, cart cart) throws Exception {


    }
*/


//    @PreAuthorize("hasRole('ROLE_MEMBER')")
//    @ResponseBody
 //   @RequestMapping(value = "/delete/{cartNum}", method = RequestMethod.GET)
  //  public int deleteCart(@PathVariable int cartNum, cart cart, Authentication authentication) throws Exception{

 //       CustomUser customUser = (CustomUser) authentication.getPrincipal();
  //      Member member = customUser.getMember();

  //      int userNo = member.getUser_no();


   //     if(member != null) {
    //        cart.setUserNo(userNo);

    //    }
    //    return service.deleteCart(cartNum);
 //   }

}

    @ResponseBody
    @RequestMapping(value = "/delete")
    public int delete(int sccNum, cart cart, Authentication authentication) throws Exception{
        cart.setSccNum(sccNum);

        CustomUser customUser = (CustomUser) authentication.getPrincipal();
        Member member = customUser.getMember();

        cart.setUserNo(member.getUser_no());

        return service.delete(cart);
    }

    @ResponseBody
    @RequestMapping(value = "/count")
    public int count(int sccNum, cart cart, Authentication authentication) throws Exception{
        cart.setSccNum(sccNum);
        try{
            CustomUser customUser = (CustomUser) authentication.getPrincipal();
            Member member = customUser.getMember();

            cart.setUserNo(member.getUser_no());
        } catch (NullPointerException e) {
            System.out.println("Please Login Access");
        }


        return service.countNum(cart);
    }



    /*
    // 카트 삭제
    @ResponseBody
    @RequestMapping(value = "/deleteCart", method =RequestMethod.GET)
    public void deleteCart2(Authentication authentication,
                          @RequestParam(value = "chbox[]") List<String> chArr, cart cart) throws Exception {


    }
*/

    /*
    @ResponseBody
    @RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
    public void deleteCart2(Authentication authentication,
                            @RequestParam(value = "chbox[]") List<String> chArr, cart cart) throws Exception {


    }
*/







