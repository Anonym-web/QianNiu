package com.bjpowernode.product.dao;

import com.bjpowernode.product.domain.Product;
import com.bjpowernode.product.domain.ShoppingCart;

import java.util.List;
import java.util.Map;

/**
 * Author:Anonym
 * 2019/11/2
 */
public interface ProductDao {

    List<Product> selectProductList(Map<String,Object> m);

    int selectTotal(Map<String,Object> m);

    int insertProduct(ShoppingCart shoppingCart);

    ShoppingCart getShoppingCartByProductId(String id);

    int updateProduct(ShoppingCart shoppingCart);

    List<Map<String,Object>> getShoppingCart();

    List<Product> getProductById(Product product);
}
