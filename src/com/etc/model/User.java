package com.etc.model;

import java.util.Date;

public class User {
	Integer id;
	String loginname;
	String password;
	Integer status;
	Date createdate;
	String username;
	
	public User () {
		
	}
	public User(String username, String pass, int status, String loginname) {
		this.username=username;
		this.password=pass;
		this.status=status;
		this.loginname=loginname;
	}
	
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

}
