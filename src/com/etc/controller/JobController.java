package com.etc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.etc.model.Job;
import com.etc.service.JobService;
import com.etc.util.Page;

@Controller
@RequestMapping("/job")
public class JobController {
	@Autowired
	@Qualifier("jobService")
	private JobService jobService;
	
	@RequestMapping("/jobSearch.do")
	public ModelAndView jobSearch(Job job,Page page,Model model){
		model.addAttribute("name", job.getName());
		ModelAndView mv=new ModelAndView("job/job");
		List<Job> jobList=jobService.getJobListByPage(job,page);
		mv.addObject("jobList",jobList);
		return mv;
	}
	
	@RequestMapping("/AddJob.do")
	public String AddJob(Job job,Model model){
		if(jobService.addJob(job)){
			model.addAttribute("msg", "添加成功");
			return "job/showAddJob";
		}else {
			model.addAttribute("msg", "添加失败");
			return "job/showAddJob";
		}
	}
	
	@RequestMapping("/jobdelete.do")
	public String jobDelete(String ids){
		if(jobService.deleteJob(ids)){
			return "redirect:jobSearch.do";
		}
		return "job/job";
	}
	
	@RequestMapping("/jobUpdate.do")
	public String updateJob(Job job,Model model){
		if(jobService.updateJob(job)){
			return "redirect:jobSearch.do";
		}else {
			model.addAttribute("msg", "修改失败");
			return "job/showUpdateJob.jsp";
		}
	}

}
