package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.model.Dept;
import com.etc.util.Page;

public interface DeptDao {

	public int getDeptListCount(Dept dept);

	public List<Dept> getDeptListByPage(@Param("dept")Dept dept,@Param("page") Page page);


	public int addDept(Dept dept);

	public int deletDept(@Param("ids")String ids);

	public int updateDept(Dept dept);

}
