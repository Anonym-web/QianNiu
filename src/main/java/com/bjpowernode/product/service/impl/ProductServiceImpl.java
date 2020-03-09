package com.bjpowernode.product.service.impl;

import com.bjpowernode.QianNiu.domain.User;
import com.bjpowernode.exception.ProductException;
import com.bjpowernode.product.dao.ProductDao;
import com.bjpowernode.product.domain.Product;
import com.bjpowernode.product.domain.ShoppingCart;
import com.bjpowernode.product.service.ProductSerivce;
import com.bjpowernode.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:Anonym
 * 2019/11/2
 */
@Service
public class ProductServiceImpl implements ProductSerivce {

    @Autowired
    private ProductDao productDao;

    @Override
    public Map<String,Object> getProductList(Map<String,Object> m) {

        Map<String,Object> map = new HashMap<>();
        List<Product> productList = productDao.selectProductList(m);
        int total = productDao.selectTotal(m);
        map.put("total", total);
        map.put("productList", productList);
        return map;
    }

    @Override
    public boolean addshoppingCart(String id, HttpServletRequest request, HttpServletResponse response) throws Exception{
        boolean flag = true;
        //添加购物车分为两种情况
        //情况1，非登录状态
        User user = (User)request.getSession(false).getAttribute("user");

        //取得浏览器缓存cookie
        Cookie[] cookies = request.getCookies();
        if(user == null){

            //如果cookie里面为空的话，创建一个cookie
            if(cookies == null){
                //没有cookie，创建一个cookie,商品数量为一
                Cookie cookieTemp = new Cookie(id, String.valueOf(1));
                cookieTemp.setMaxAge(30*24*60*60);
                response.addCookie(cookieTemp);
            }else{

                for(Cookie cookie:cookies){
                    String goodsId = cookie.getName();
                    String goodsNum = cookie.getValue();

                    if(id.equals(goodsId)){
                        //证明cookie里面有此商品,商品数量加一
                        cookie.setValue(String.valueOf(Integer.valueOf(goodsNum)+1));
                        cookie.setMaxAge(30*24*60*60);
                        response.addCookie(cookie);
                        break;
                    }else{
                        //证明cookie里面没有此商品,创建一个cookie
                        Cookie cookieTemp = new Cookie(id, String.valueOf(1));
                        cookieTemp.setMaxAge(30*24*60*60);
                        response.addCookie(cookieTemp);
                    }

                }
            }

        }else{

            int temp = 0;
            //将cookie中的数据放到数据库中
            for (Cookie cookie : cookies) {
                String productId = cookie.getName();
                String goodNum = cookie.getValue();

                if("JSESSIONID".equals(productId)){
                    continue;
                }
                //应该先去数据库查询有没有此商品,根据从前端取来的cookie的名字查询
                ShoppingCart shoppingCart = productDao.getShoppingCartByProductId(productId);
                //返回一个商品购物车对象
                //因为用户又一次点击了购物车，先去数据库查询此商品的ID，
                // 看看有没有此数据，如果没有就新建一条商品购物车，数据初始值为一
                if(shoppingCart == null){
                    shoppingCart = new ShoppingCart();
                    shoppingCart.setId(UUIDUtil.getUUID());
                    shoppingCart.setProductId(productId);
                    //前端传过来的商品cookie的数量有多少就添加多少个
                    shoppingCart.setProductNum(Integer.valueOf(goodNum));
                    shoppingCart.setUserId(user.getId());
                    int count = productDao.insertProduct(shoppingCart);
                    if(count != 1){
                        throw new ProductException("商品添加异常");
                    }else{
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }else{

                    //先获取商品的数量
                    int productNum = shoppingCart.getProductNum();

                    //前端传来商品有多少个就加多少个
                    int newProductNum = productNum+Integer.valueOf(goodNum);
                    if(id.equals(productId)){
                        //又一次的点击购物车之后，发现是此商品再加一
                        newProductNum+=1;
                    }
                    shoppingCart.setProductNum(newProductNum);
                    String temp1 = shoppingCart.getId();
                    //执行update语句
                    int count = productDao.updateProduct(shoppingCart);
                    if(count != 1){

                        throw new ProductException("商品更新异常");
                    }else{
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
        }
        return flag;
    }

    @Override
    public List<Map<String, Object>> getProductshopping() {
        List<Map<String,Object>> map = productDao.getShoppingCart();
        return map;
    }

    @Override
    public List<Product> getProductCookie(Product product) {
        List<Product> plist = productDao.getProductById(product);
        return plist;
    }

}
