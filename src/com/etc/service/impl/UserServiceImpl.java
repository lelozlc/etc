package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.UserDao;
import com.etc.model.User;
import com.etc.service.UserService;
import com.etc.util.Page;
@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;

	@Override
	public User getUser(User user) {
		
		return userDao.getUser(user);
	}

	@Override
	public List<User> getUserList(User user) {
		
		return userDao.getUserList(user);
	}

	@Override
	@Transactional
	public boolean addUser(User user) {
		
		if(userDao.addUser(user)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateUser(User user) {
		if(userDao.updateUser(user)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteUser(String ids) {
		if(userDao.deleteUser(ids)>0){
			return true;
		}
		return false;
	}

	@Override
	public List<User> getUserListByPage(User user, Page page) {
		int total=userDao.getUserListCount(user);
		page.setTotal(total);
		return userDao.getUserListByPage(user,page);
	}

}
