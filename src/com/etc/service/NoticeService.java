package com.etc.service;
import java.util.List;

import com.etc.model.Notice;
import com.etc.util.Page;

public interface NoticeService {

	/*public boolean addEmployee(Employee employee);

	public List<Employee> getEmployeeListByPage(Employee employee, Page page);

	public List<Job> getJobList();

	public List<Dept> getDeptList();


	public boolean deleteemployee(String ids);

	public boolean updateEmployee(Employee employee);

	public Employee searchEmployeeById(Employee employee);*/

	public boolean addNotice(Notice notice);

	public List<Notice> getNoticeListByPage(Notice notice, Page page);

	public boolean deleteNotice(String ids);

	public boolean updateNotice(Notice notice);

}
