package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.etc.model.Job;
import com.etc.util.Page;

public interface JobDao {

	public int addJob(Job job);

	public int getJobListCount(Job job);

	public List<Job> getJobListByPage(@Param("job")Job job, @Param("page")Page page);

	public int updateJob(Job job);

	public int deleteJob(@Param("ids")String ids);

}
