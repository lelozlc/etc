package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.model.Dept;
import com.etc.model.Employee;
import com.etc.model.Job;
import com.etc.util.Page;

public interface EmployeeDao {

	public int addEmployee(Employee employee);

	public int getEmployeeListCount(Employee employee);

	public List<Employee> getEmployeeListByPage(@Param("employee")Employee employee,@Param("page") Page page);

	public List<Job> getJobList();

	public List<Dept> getDeptList();

	public int deleteEmployee(@Param("ids")String ids);

	public Employee getEmployeeById(Employee employee);

	public int updateEmployee(Employee employee);

}
