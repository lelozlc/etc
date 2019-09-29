package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.etc.model.User;
import com.etc.util.Page;

public interface UserDao {

	public User getUser(User user);

	public List<User> getUserList(User user);

	public int addUser(User user);

	public int updateUser(User user);

	public int deleteUser(@Param("ids")String ids);

	public int getUserListCount(User user);

	public List<User> getUserListByPage(@Param("user")User user,@Param("page") Page page);

	

	

}
