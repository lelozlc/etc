package com.etc.service;
import java.util.List;

import com.etc.model.Dept;
import com.etc.model.Employee;
import com.etc.model.Job;
import com.etc.util.Page;

public interface EmployeeService {

	public boolean addEmployee(Employee employee);

	public List<Employee> getEmployeeListByPage(Employee employee, Page page);

	public List<Job> getJobList();

	public List<Dept> getDeptList();


	public boolean deleteemployee(String ids);

	public boolean updateEmployee(Employee employee);

	public Employee searchEmployeeById(Employee employee);

}
