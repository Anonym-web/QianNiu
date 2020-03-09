package com.bjpowernode.QianNiu.controller;


import java.io.IOException;

import java.util.HashMap;
import java.util.Map;

import javax.security.auth.login.LoginException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjpowernode.QianNiu.domain.User;
import com.bjpowernode.QianNiu.service.UserService;
import com.bjpowernode.util.DateTimeUtil;
import com.bjpowernode.util.MD5Util;
import com.bjpowernode.util.PrintJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping(value = "user")
public class UserController extends HttpServlet{

	// 创建service层
	@Autowired
	private UserService userService;

	/**
	 * 登录操作
	 *
	 * @return
	 * @throws IOException 升级操作，添加了手机号的登录
	 */
	@RequestMapping("login.do")
	public void login(User user, String flag, HttpServletRequest request, HttpServletResponse response){

		String password = user.getPassword();
		String md5 = MD5Util.getMD5(password);
		user.setPassword(md5);
		user.setCreateTime(DateTimeUtil.getSysTime());
		//上面已经接受了前端的参数
		if("".equals(user.getUsername()) || "".equals(user.getPassword())){
			//看看有没有cookie
			Cookie[] cookies = request.getCookies();

			if(cookies == null){
				//没有cookie
				/*return "redirect:/login.html";*/
				PrintJson.printJsonFlag(response, false);
			}else{

				//拿到cookie
				for (Cookie cookie : cookies) {
					String name = cookie.getName();
					String value = cookie.getValue();

					//如果能和username和password匹配上就赋值
					if("username".equals(name)){

						user.setUsername(value);
					}else if("password".equals(name)){
						user.setPassword(value);
					}
				}

					//如果cookie里面有用户的信息
					if(!"".equals(user.getUsername()) && !"".equals(user.getPassword())){

						//证明是合法用户,放行
						/*return "indexs";*/
						PrintJson.printJsonFlag(response, true);
					}else{
						//拒绝访问
						/*return "redirect:/login.html";*/
						PrintJson.printJsonFlag(response, false);
					}
			}
		}else{

			//证明用户名和密码填写了
			try {
				User u = userService.queryUsernameAndPassword(user);

				if(u != null && flag != null){
					//打上勾了，用户选择了十天免登录
					Cookie card1 = new Cookie("username", user.getUsername());
					Cookie card2 = new Cookie("password", user.getPassword());
					card1.setMaxAge(60*60*24*10);
					card2.setMaxAge(60*60*24*10);

					response.addCookie(card1);
					response.addCookie(card2);
				}
				request.getSession().setAttribute("user", u);
				PrintJson.printJsonFlag(response, true);
			} catch (LoginException e) {
				e.printStackTrace();
				String message = e.getMessage();
				Map<String,Object> map = new HashMap<>();
				map.put("success", false);
				map.put("msg", message);
				PrintJson.printJsonObj(response, map);
				/*return "redirect:/login.html";*/
			}
			/*return "indexs";*/
		}

	}

	@RequestMapping("showUserPortrait.user")
	public void getUserPortrait(String username,HttpServletResponse response){
		response.setContentType("application/json");
		User user = userService.getUser(username);
		PrintJson.printJsonObj(response, user);
	}

	@RequestMapping("showUserMessage.user")
	public void getUserMessage(User user,HttpServletResponse response){

		//将前端传来的username传递到dao层
		User u = userService.getUserMessage(user.getUsername());
		PrintJson.printJsonObj(response, u);
	}
}