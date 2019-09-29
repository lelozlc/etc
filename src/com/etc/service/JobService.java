package com.etc.service;
import java.util.List;

import com.etc.model.Job;
import com.etc.util.Page;

public interface JobService {

	boolean addJob(Job job);

	List<Job> getJobListByPage(Job job, Page page);

	boolean updateJob(Job job);

	boolean deleteJob(String ids);

}
