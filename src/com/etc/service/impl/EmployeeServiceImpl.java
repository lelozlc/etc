package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etc.dao.EmployeeDao;
import com.etc.model.Dept;
import com.etc.model.Employee;
import com.etc.model.Job;
import com.etc.service.EmployeeService;
import com.etc.util.Page;
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	@Qualifier("employeeDao")
	private EmployeeDao employeeDao;

	@Override
	public boolean addEmployee(Employee employee) {
		if(employeeDao.addEmployee(employee)>0){
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public List<Employee> getEmployeeListByPage(Employee employee, Page page) {
		int total=employeeDao.getEmployeeListCount(employee);
		page.setTotal(total);
		return employeeDao.getEmployeeListByPage(employee,page);
	}

	@Override
	public List<Job> getJobList() {
		
		return employeeDao.getJobList();
	}

	@Override
	public List<Dept> getDeptList() {
		return employeeDao.getDeptList();
	}

	@Override
	public boolean deleteemployee(String ids) {
		if(employeeDao.deleteEmployee(ids)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateEmployee(Employee employee) {
		if(employeeDao.updateEmployee(employee)>0){
			return true;
		}
		return false;
	}

	@Override
	public Employee searchEmployeeById(Employee employee) {
		
		return employeeDao.getEmployeeById(employee);
	}



}
