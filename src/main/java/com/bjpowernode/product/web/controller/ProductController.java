package com.bjpowernode.product.web.controller;

import com.bjpowernode.product.domain.Product;
import com.bjpowernode.product.domain.ShoppingCart;
import com.bjpowernode.product.service.ProductSerivce;
import com.bjpowernode.util.PrintJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:Anonym
 * 2019/11/2
 */
@Controller
@RequestMapping("/product")
public class ProductController extends HttpServlet {

    @Autowired
    private ProductSerivce productSerivce;

    @RequestMapping("/getProduct.do")
    public void getProductList(String name,String pageNo,String pageSize,HttpServletResponse response){

        //设置过滤条数
        int skipCount = (Integer.valueOf(pageNo)-1)*5;

        Map<String,Object> m = new HashMap<>();
        m.put("name", name);
        m.put("skipCount",skipCount);
        m.put("pageSize", Integer.valueOf(pageSize));

        Map<String,Object> map = productSerivce.getProductList(m);

        PrintJson.printJsonObj(response, map);
    }

    @RequestMapping("/addshoppingCart.do")
    public void addshoppingCart(String id,HttpServletRequest request, HttpServletResponse response){

        //将id传入到service
        boolean flag = false;
        try {
            flag = productSerivce.addshoppingCart(id,request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        PrintJson.printJsonFlag(response, flag);
    }

    @RequestMapping("/getProductshopping.do")
    public void getProductshopping(HttpServletResponse response){

        List<Map<String,Object>> slist = productSerivce.getProductshopping();
        PrintJson.printJsonObj(response, slist);
    }

    @RequestMapping("/getProductCookie.do")
    public void getProductCookie(HttpServletResponse response,HttpServletRequest request){

        /*考虑到复用性*/
        Product product = new Product();

        //拿出页面的cookie
        Cookie[] cookies = request.getCookies();
        List<Product> plist = null;
        String value = null;
        if(cookies == null){

            Map<String,Object> map = new HashMap<>();
            map.put("plist", plist);
            map.put("value", value);
            //将List集合放到json里面传到浏览器上
            PrintJson.printJsonObj(response, map);
            return;
        }
        for (Cookie cookie : cookies) {
            /*这里的name指的是商品的id*/
            String name = cookie.getName();
            value = cookie.getValue();
            if("JSESSIONID".equals(name)){
                continue;
            }
            product.setId(name);
            plist= productSerivce.getProductCookie(product);


        }
        Map<String,Object> map = new HashMap<>();
        map.put("plist", plist);
        map.put("value", value);
        //将List集合放到json里面传到浏览器上
        PrintJson.printJsonObj(response, map);
    }
}
