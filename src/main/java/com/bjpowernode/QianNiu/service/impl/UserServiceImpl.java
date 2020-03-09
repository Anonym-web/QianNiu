package com.bjpowernode.QianNiu.service.impl;
import com.bjpowernode.QianNiu.dao.UserDao;
import com.bjpowernode.QianNiu.domain.User;
import com.bjpowernode.QianNiu.service.UserService;
import com.bjpowernode.util.DateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.security.auth.login.LoginException;

@Service
public class UserServiceImpl implements UserService {

	
	//创建Dao层
	@Autowired
	private UserDao userDao;
	
	/**
	 * 登录
	 */
	@Override
	public User queryUsernameAndPassword(User user) throws LoginException {
		// TODO Auto-generated method stub

		User u = userDao.selectUsernameAndPassword(user);
		if(u == null){

			throw new LoginException("账号或者密码错误");

		//判断账号锁定状态
		}else if("0".equals(u.getLockstate())){

			throw new LoginException("对不起，您的账号已经锁定");
		//判断账号是否失效
		}else if(DateTimeUtil.getSysTime().compareTo(user.getCreateTime()) < 0){

			throw new LoginException("对不起您的账号已经失效");
		}
		return u;
	}

	@Override
	public User getUser(String username) {
		User user = userDao.getUser(username);
		return user;
	}

	@Override
	public User getUserMessage(String username) {

		User user = userDao.getUserMessage(username);
		return user;
	}
}
