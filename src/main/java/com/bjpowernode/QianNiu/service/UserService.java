package com.bjpowernode.QianNiu.service;




import com.bjpowernode.QianNiu.domain.User;

import javax.security.auth.login.LoginException;

public interface UserService {
	
	/*登录相关功能*/
	//验证登录
	User queryUsernameAndPassword(User user) throws LoginException;

    User getUser(String username);

    User getUserMessage(String username);
}
