package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.etc.dao.DeptDao;
import com.etc.model.Dept;
import com.etc.service.DeptService;
import com.etc.util.Page;
@Service("deptService")
public class DeptServiceImpl implements DeptService{

	@Autowired
	@Qualifier("deptDao")
	private DeptDao deptDao;
	
	
	@Override
	public List<Dept> getUserListByPage(Dept dept, Page page) {
		int total=deptDao.getDeptListCount(dept);
		page.setTotal(total);
		return deptDao.getDeptListByPage(dept,page);
	}


	@Override
	public boolean addDept(Dept dept) {
		if(deptDao.addDept(dept)>0){
			return true;
		}
		return false;
	}


	@Override
	public boolean deleteDept(String ids) {
		if(deptDao.deletDept(ids)>0){
			return true;
		}
		return false;
	}


	@Override
	public boolean updateDept(Dept dept) {
		if(deptDao.updateDept(dept)>0){
			return true;
		}
		return false;
	}

}
