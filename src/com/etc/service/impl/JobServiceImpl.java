package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.etc.dao.JobDao;
import com.etc.model.Job;
import com.etc.service.JobService;
import com.etc.util.Page;
@Service("jobService")
public class JobServiceImpl implements JobService{

	@Autowired
	@Qualifier("jobDao")
	private JobDao jobDao;

	@Override
	public boolean addJob(Job job) {
		if(jobDao.addJob(job)>0){
			return true;
		}
		return false;
	}


	@Override
	public List<Job> getJobListByPage(Job job, Page page) {
		int total=jobDao.getJobListCount(job);
		page.setTotal(total);
		return jobDao.getJobListByPage(job,page);
	}


	@Override
	public boolean updateJob(Job job) {
		if(jobDao.updateJob(job)>0){
			return true;
		}
		return false;
	}


	@Override
	public boolean deleteJob(String ids) {

		if(jobDao.deleteJob(ids)>0){
			return true;
		}
		return false;
	}

}
