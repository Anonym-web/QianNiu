package com.bjpowernode.product.service;

import com.bjpowernode.product.domain.Product;
import com.bjpowernode.product.domain.ShoppingCart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Author:Anonym
 * 2019/11/2
 */
public interface ProductSerivce {

    Map<String,Object> getProductList(Map<String,Object> map);

    boolean addshoppingCart(String id, HttpServletRequest request, HttpServletResponse response) throws Exception;

    List<Map<String,Object>> getProductshopping();

    List<Product> getProductCookie(Product product);
}
