package com.bjpowernode.QianNiu.dao;


import com.bjpowernode.QianNiu.domain.User;

public interface UserDao {
	
	//验证登录
	User selectUsernameAndPassword(User user);

	User getUser(String name);

    User getUserMessage(String username);
}
