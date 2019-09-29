package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.etc.dao.NoticeDao;
import com.etc.model.Notice;
import com.etc.service.NoticeService;
import com.etc.util.Page;
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	@Qualifier("noticeDao")
	private NoticeDao notcieDao;

	@Override
	public boolean addNotice(Notice notice) {
		if(notcieDao.addNotice(notice)>0){
			return true;
		}
		return false;
	}

	@Override
	public List<Notice> getNoticeListByPage(Notice notice, Page page) {
		int total=notcieDao.getNoticeListCount(notice);
		page.setTotal(total);
		return notcieDao.getNoticeListByPage(notice,page);
	}

	@Override
	public boolean deleteNotice(String ids) {
		if(notcieDao.deleteNotice(ids)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateNotice(Notice notice) {
		if(notcieDao.updateNotice(notice)>0){
			return true;
		}
		return false;
	}

	
	
//	@Override
//	public boolean addEmployee(Employee employee) {
//		if(employeeDao.addEmployee(employee)>0){
//			return true;
//		}
//		return false;
//	}
//
//	@Override
//	@Transactional
//	public List<Employee> getEmployeeListByPage(Employee employee, Page page) {
//		int total=employeeDao.getEmployeeListCount(employee);
//		page.setTotal(total);
//		return employeeDao.getEmployeeListByPage(employee,page);
//	}
//
//	@Override
//	public List<Job> getJobList() {
//		
//		return employeeDao.getJobList();
//	}
//
//	@Override
//	public List<Dept> getDeptList() {
//		return employeeDao.getDeptList();
//	}
//
//	@Override
//	public boolean deleteemployee(String ids) {
//		if(employeeDao.deleteEmployee(ids)>0){
//			return true;
//		}
//		return false;
//	}
//
//	@Override
//	public boolean updateEmployee(Employee employee) {
//		if(employeeDao.updateEmployee(employee)>0){
//			return true;
//		}
//		return false;
//	}
//
//	@Override
//	public Employee searchEmployeeById(Employee employee) {
//		
//		return employeeDao.getEmployeeById(employee);
//	}



}
