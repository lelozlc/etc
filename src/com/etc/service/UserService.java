package com.etc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.etc.model.User;
import com.etc.util.Page;

@Service
public interface UserService {

	public User getUser(User user);

	public List<User> getUserList(User user);

	public boolean addUser(User user);

	public boolean updateUser(User user);

	public boolean deleteUser(String ids);

	public List<User> getUserListByPage(User user, Page page);
	

}
