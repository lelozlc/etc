package com.etc.model;

import java.util.Date;

public class Notice {
	int id;
	String title;
	String content;
	Date create_date;
	private User user;
	int user_id;
	public Notice(){
		
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Notice(String title1, String content1,int user_id1) {
		this.title=title1;
		this.content=content1;
		this.user_id=user_id1;
	}
	public Notice(int id2, String title2, String content2) {
		this.id=id2;
		this.title=title2;
		this.content=content2;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	

}
