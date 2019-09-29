package com.etc.model;

public class Dept {
	int id;
	String name;
	String remark;
	public Dept(){
		
	}
	public Dept (int id) {
		this.id=id;
	}
	public Dept(String name){
		this.name=name;
	}
	public Dept(String name, String remark) {
		this.name=name;
		this.remark=remark;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
