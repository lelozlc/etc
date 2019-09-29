package com.etc.service;

import java.util.List;

import com.etc.model.Dept;
import com.etc.util.Page;

public interface DeptService {

	List<Dept> getUserListByPage(Dept dept, Page page);

	boolean addDept(Dept dept);

	boolean deleteDept(String ids);

	boolean updateDept(Dept dept);

}
