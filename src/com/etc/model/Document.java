package com.etc.model;

import java.util.Date;

public class Document {
	int id;
	String title;
	String filename;
	String remark;
	Date create_date;
	int user_id;
	User user;
	public Document(){
		
	}
	public Document(String title1){
		this.title=title1;
	}
	public Document(String title2, String remark2, String filename2, int userid) {
		this.title=title2;
		this.remark=remark2;
		this.filename=filename2;
		this.user_id=userid;
	}
	public Document(int id2, String title2, String remark2, String filename2) {
		this.title=title2;
		this.remark=remark2;
		this.filename=filename2;
		this.id=id2;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

}
